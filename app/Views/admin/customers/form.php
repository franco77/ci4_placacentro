<form id="form" accept-charset="utf-8">

    <div class="row">
        <div class="col-md-12">
            <div class="mb-3">
                <label for="ic">Cedula</label>
                <input type="text" name="ic" value="<?= !empty($data_customers['ic']) ? $data_customers['ic'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="col-md-6">
            <div class="mb-3">
                <label for="first_name">Nombre</label>
                <input type="text" name="first_name"
                    value="<?= !empty($data_customers['first_name']) ? $data_customers['first_name'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="col-md-6">
            <div class="mb-3">
                <label for="last_name">Apellido</label>
                <input type="text" name="last_name"
                    value="<?= !empty($data_customers['last_name']) ? $data_customers['last_name'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="mb-3">
            <label for="email">Email</label>
            <input type="text" name="email"
                value="<?= !empty($data_customers['email']) ? $data_customers['email'] : '' ?>" class="form-control" />
        </div>

        <div class="mb-3">
            <label for="birthdate">Fecha Nacimiento</label>
            <input type="text" name="birthdate"
                value="<?= !empty($data_customers['birthdate']) ? $data_customers['birthdate'] : '' ?>"
                class="form-control" id="datepicker" />
        </div>

        <div class="mb-3">
            <label for="Genero">Genero</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="gender1" name="gender" value="Masculino"
                    <?= !empty($data_customers['gender']) && $data_customers['gender'] == 'Masculino' ? 'checked' : '' ?> />
                <label class="form-check-label" for="gender1">Masculino</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="gender2" name="gender" value="Femenino"
                    <?= !empty($data_customers['gender']) && $data_customers['gender'] == 'Femenino' ? 'checked' : '' ?> />
                <label class="form-check-label" for="gender2">Femenino</label>
            </div>
        </div>

        <div class="col-md-6">
            <div class="mb-3">
                <label for="address">Direccion</label>
                <input type="text" name="address"
                    value="<?= !empty($data_customers['address']) ? $data_customers['address'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="col-md-6">
            <div class="mb-3">
                <label for="phone">Telefono</label>
                <input type="text" name="phone"
                    value="<?= !empty($data_customers['phone']) ? $data_customers['phone'] : '' ?>"
                    class="form-control" />
            </div>
        </div>



        <div class="col">
            <div class="mb-3">
                <label for="sel_dep" class="form-label"> <span class="text-danger">*</span>Departamento</label>
                <select id='sel_dep' name="department" class="select2" style="width:100%;">
                    <option value="">-- Seleccione Departamento --</option>
                    <?php
                    foreach ($department as $dep) {

                        if ($action == 'edit') :
                            $selected = ($dep['id'] == $data_customers['department']) ? ' selected="selected"' : "";
                            echo '<option value="' . $dep['id'] . '" ' . $selected . '>' .  $dep['depart_name'] . '</option>';
                        else :
                            echo '<option value="' . $dep['id'] . '">' .  $dep['depart_name'] . '</option>';
                        endif;
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="col">
            <div class="mb-3">
                <label for="sel_city" class="form-label"> <span class="text-danger">*</span>Ciudad</label>
                <?php if ($action == 'new') : ?>
                <select id='sel_city' name="city" class="select2" style="width:100%;">
                    <?php else : ?>
                    <select id='sel_city' name="city" class="select2" style="width:100%;">
                        <option value="<?= $data_customers['city'] ?>"><?= $data_customers['city'] ?></option>
                        <?php endif; ?>
                    </select>
            </div>
        </div>
        <? // php endif; 
        ?>


        <div class="mb-3">
            <label for="notes">Notas</label>
            <textarea name="notes" rows="3"
                class="form-control"><?= !empty($data_customers['notes']) ? $data_customers['notes'] : '' ?></textarea>
        </div>



        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <label for="error"></label>
        </div>
</form>


<script>
$(document).ready(function() {

    // City change
    $('#sel_dep').change(function() {
        var dep = $(this).val();

        // AJAX request
        $.ajax({
            url: '<?= base_url('admin/customers/getDepartment') ?>',
            method: 'post',
            data: {
                dep: dep
            },
            dataType: 'json',
            success: function(response) {

                // Remove options
                $('#sel_city').find('option').not(':first').remove();

                // Add options
                $.each(response, function(index, data) {
                    $('#sel_city').append('<option value="' + data['city'] + '">' +
                        data['city'] + '</option>');
                });
            }
        });
    });
});

$(function() {
    $("#datepicker").datepicker({
        dateFormat: "yy-mm-dd"
    });
});
</script>
<script>
$(document).ready(function() {
    $('.select2').select2({
        theme: 'bootstrap-5'
    });
});
</script>