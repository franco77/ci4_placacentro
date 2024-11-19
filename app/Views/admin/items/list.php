<?= $this->extend("admin/layout/master") ?>

<?= $this->section("content") ?>
<div class="row justify-content-center">
    <div class="card">
        <div class="card-header">
            <h3><?= $title ?></h3>
        </div>
        <div class="card-body">
            <p>
                <button class="btn btn-sm btn-outline-danger float-left bulk-delete">Eliminar</button>
                <button class="btn btn-sm btn-outline-primary float-left refresh" purpose="add">Refrescar</button>
                <button class="btn btn-sm btn-primary float-right form-action" purpose="add">Agregar</button>
            </p>
            <table id="datatable" class="table <?= setting('App.table_style'); ?>" cellspacing="0" style="width: 100%">
                <thead class="<?= setting('App.table_header_style'); ?>">
                    <tr>
                        <th style="width: 0px"><input type="checkbox" class="check-items"></th>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Estatus</th>
                        <th>Categoria</th>
                        <th style="width: 0px">#</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</div>


<div class="modal modal-form" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>


<?= $this->endSection() ?>
<!-- /.content -->


<!-- page script -->
<?= $this->section("pageScript") ?>


<script>
    $(document).ready(function() {

        let h = "<?= $host ?>",
            t = $('#datatable').DataTable({
                "processing": true,
                "serverSide": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "scrollY": '45vh',
                "responsive": false,
                "orderCellsTop": true,
                "ajax": {
                    "url": h + "data",
                    "type": "POST"
                },
                "columns": [{
                        "data": "column_bulk",
                        "searchable": false,
                        "orderable": false
                    },
                    {
                        "data": "item_code"
                    },
                    {
                        "data": "item_name"
                    },
                    {
                        "data": "quantity"
                    },
                    {
                        "data": "status"
                    },
                    {
                        "data": "category"
                    },
                    {
                        "data": "column_action",
                        "searchable": false,
                        "orderable": false
                    }
                ],
                "order": [
                    [1, "DESC"]
                ]
            });

        function fresh() {
            t.ajax.reload();
        }

        function save(url, data) {
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                cache: false,
                processData: false,
                contentType: false,
            }).done(function() {
                fresh();
                $('.modal-form').modal('hide');
                toastr.success('Registro guardado con exito'); // Show success notification
            }).fail(function(res) {
                $('.form-text').remove()
                $('.is-invalid').removeClass('is-invalid')
                let err = jQuery.parseJSON(res.responseText)
                $.each(err.messages, function(selector, value) {
                    $('[for="' + selector + '"]').after(
                        '<br><small class="form-text text-danger">' + value + '</small>');
                    $('[name="' + selector + '"]').addClass('is-invalid');
                });
                toastr.error('Error al guardar el registro'); // Show error notification
            });
        }

        function drop(ids) {
            Swal.fire({
                title: 'Estas Seguro?',
                text: 'Si borras este registro no podras recuperarlo!.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Si, Borrar esto!'
            }).then((result) => {
                if (result.isConfirmed) {
                    for (let i = 0; i < ids.length; i++) {
                        $.ajax({
                            url: h + 'delete/' + ids[i]
                        }).fail(function() {
                            console.log('Data not found');
                        }).always(function() {
                            fresh();
                        });
                    }
                }
            });
        }

        t.on('draw', function() {
            $('.form-action').on('click', function() {
                let me = $(this),
                    mb = $('.modal-form'),
                    m, u, u2, id = me.attr('item-id'),
                    t, p = me.attr('purpose');
                if (p === "add") {
                    t = "Add Data";
                    u = h + 'new';
                    u2 = h + 'create';
                } else if (p === "edit") {
                    t = "Edit Data";
                    u = h + 'edit/' + id;
                    u2 = h + 'update/' + id;
                } else {
                    t = "Detail Data";
                    u = h + 'show/' + id;
                }

                $.ajax({
                    type: "GET",
                    url: u
                }).done(function(r) {
                    mb.find('.modal-title').text(t);
                    mb.find('.modal-body').html(r);
                    mb.modal('show');
                    lib();

                    $('#form input:text, #form textarea').first().focus();
                    $('#form').on('submit', function(e) {
                        e.preventDefault();
                        // let d = $('#form').serialize();
                        let d = new FormData(this);
                        save(u2, d);
                    });
                }).fail(function() {
                    alert("Data not found");
                });

            });
        });

        $('.refresh').on('click', function() {
            fresh()
        })

        $('.check-items').on('click', function() {
            $('input:checkbox').not(this).prop('checked', this.checked);
        });

        $('.bulk-delete').on('click', function() {
            let ids = [];
            $(".bulk-item").each(function() {
                if ($(this).is(":checked")) {
                    ids.push($(this).val());
                }
            });
            if (ids.length) {
                drop(ids);
            } else {
                alert("Please select items");
            }
        });

        function lib() {
            $.fn.datetimepicker.Constructor.Default = $.extend({}, $.fn.datetimepicker.Constructor.Default, {
                icons: {
                    time: 'fas fa-clock',
                    date: 'fas fa-calendar',
                    up: 'fas fa-arrow-up',
                    down: 'fas fa-arrow-down',
                    previous: 'fas fa-chevron-left',
                    next: 'fas fa-chevron-right',
                    today: 'fas fa-calendar-check-o',
                    clear: 'fas fa-trash',
                    close: 'fas fa-times'
                },
                minDate: '1900-01-01 00:00',
                maxDate: '2155-12-31 23:59',
                useCurrent: false
            });

            $('.year').datetimepicker({
                viewMode: 'years',
                format: 'YYYY'

            });
            $('.datetime').datetimepicker({
                viewMode: 'years',
                format: 'YYYY-MM-DD HH:mm'
            });
            $('.date').datetimepicker({
                format: 'YYYY-MM-DD'
            });
            $('.time').datetimepicker({
                format: 'HH:mm'
            });
            // Custom Library
            // .Custom Library
        }





    });
</script>
<!-- .Your Magic -->

<?= $this->endSection() ?>