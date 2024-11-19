<?= $this->extend("admin/layout/master") ?>


<?= $this->section("content") ?>

<div class="col-12">
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-9">
                    <h3 class="card-title">Mi lista de tareas</h3>
                </div>
                <div class="col-md-3">
                    <!-- Add any content you want for the right side -->
                </div>
            </div>
        </div>
        <div class="card-body">
            <form method="post" id="to_do_form">
                <span id="message"></span>
                <div class="input-group">
                    <input type="text" name="task_name" id="task_name" class="form-control" autocomplete="off"
                        placeholder="Ingresa Tu Tarea" />
                    <div class="input-group-append">
                        <button type="submit" name="submit" id="submit" class="btn btn-success"><i
                                class="fa-solid fa-plus"></i></button>
                    </div>
                </div>
            </form>
            <br />
            <div class="list-group">
                <?php foreach ($task as $task) : ?>
                <a href="#" class="list-group-item" id="list-group-item-<?= $task['id'] ?>"
                    data-id="<?= $task['id'] ?>">
                    <?= $task['task_details'] ?>
                    <span class="badge bg-danger float-end" data-id="<?= $task['id'] ?>">X</span>
                </a>
                <?php endforeach; ?>
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

    $(document).on('submit', '#to_do_form', function(event) {
        event.preventDefault();

        var taskName = $('#task_name').val();

        if (taskName === '') {
            $('#message').html(
                '<div class="alert alert-danger">Porfavor escribe tu tarea</div>');
            setTimeout(function() {
                $(".alert").fadeTo(1000, 0).slideUp(1000, function() {
                    $(this).remove();
                });
            }, 2000);
            return false;
        } else {
            $('#submit').prop('disabled', true);

            $.ajax({
                url: "<?= base_url('admin/task/add') ?>",
                method: "POST",
                data: $(this).serialize(),
                success: function(data) {
                    toastr.info('Tarea registrada con exito');
                    $('#submit').prop('disabled', false);
                    $('#to_do_form')[0].reset();
                    $('.list-group').prepend(data);
                    $('.list-group').load(location.href + ' .list-group');
                }
            });
        }
    });


    $(document).on('click', '.list-group-item', function() {
        var id = $(this).data('id');
        $.ajax({
            url: "<?= base_url('admin/task/update') ?>",
            method: "POST",
            data: {
                id: id
            },
            success: function(data) {
                toastr.success('Tarea realizada con exito');
                $('#list-group-item-' + id).css('text-decoration',
                    'line-through');
            }
        })
    });

    $(document).on('click', '.badge', function() {
        var id = $(this).data('id');
        $.ajax({
            url: "<?= base_url('admin/task/delete') ?>",
            method: "POST",
            data: {
                id: id
            },
            success: function(data) {
                toastr.warning('Tarea eliminado con exito');
                $('#list-group-item-' + id).fadeOut('slow');
            }
        })
    });

});
</script>

<?= $this->endSection() ?>