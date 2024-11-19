<?= $this->extend("admin/layout/master") ?>

<?= $this->section("content") ?>
<style>
    .switch {
        position: relative;
        display: inline-block;
        width: 50px;
        height: 24px;
    }

    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 16px;
        width: 16px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }

    input:checked+.slider {
        background-color: #2196F3;
    }

    input:focus+.slider {
        box-shadow: 0 0 1px #2196F3;
    }

    input:checked+.slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    /* Rounded sliders */
    .slider.round {
        border-radius: 34px;
    }

    .slider.round:before {
        border-radius: 50%;
    }
</style>
<div class="row">
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
                        <th>Cod Cut</th>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Status</th>
                        <th>Amount</th>
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
                        "data": "cod_cut"
                    },
                    {
                        "data": "title"
                    },
                    {
                        "data": "type"
                    },
                    {
                        "data": "status"
                    },
                    {
                        "data": "amount"
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
                    t = "Ver";
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
                Swal.fire({
                    icon: 'error',
                    title: 'Nada Seleccionado',
                    text: 'Porfavor selecciona algun rergistro para borrar!'
                })
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


        $(document).on("change", "#cheak", function(e) {
            var status = $(this).val();
            var id = $(this).data('id');

            if (status === 'Activo') {
                status = 'Inactivo';
            } else {
                status = 'Activo';
            }

            $.ajax({
                url: "<?= base_url('admin/installments/changeStatus') ?>",
                type: "POST",
                data: {
                    status: status,
                    id: id
                },
                success: function(data) {
                    toastr.success('Estatus del abono #-' + id + ' Cambio con exito!',
                        'Success');
                },
                error: function(xhr, textStatus, errorThrown) {
                    toastr.error('A ocurrido un error al cambiar de estatus.', 'Error');
                    console.error("Error in Ajax request:", textStatus, errorThrown);
                }
            });
        });







    });
</script>
<?= $this->endSection() ?>