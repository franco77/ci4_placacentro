<form id="form" accept-charset="utf-8">

    <div class="row">


        <div class="mb-3">
            <label for="id_user" class="form-label">Empleado</label>
            <select name="id_user" id="id_user" class="select2" style="width:100%;">
                <option value="">-- Selecciona Un Empleado --</option>
                <?php
                foreach ($assigned_to as $assig) :
                    if ($action == 'edit') :
                        $selected = ($assig['id'] == $data_user_data['id_user']) ? ' selected="selected"' : "";
                        echo "<option value='" . $assig['id'] . "'" . $selected . ">" . $assig['first_name'] . ' ' . $assig['last_name'] . "</option>";
                    else :
                        echo '<option value="' . $assig['id'] . '">' . $assig['first_name'] . ' ' . $assig['last_name'] . '</option>';
                    endif;
                endforeach;
                ?>
            </select>
        </div>

        <div class="col">
            <div class="mb-3">
                <label for="address_1" class="form-label">Direccion</label>
                <input type="text" name="address_1"
                    value="<?= !empty($data_user_data['address_1']) ? $data_user_data['address_1'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="col">
            <div class="mb-3">
                <label for="contact_number_2" class="form-label">Numero de contacto de un Familiar</label>
                <input type="text" name="contact_number_2"
                    value="<?= !empty($data_user_data['contact_number_2']) ? $data_user_data['contact_number_2'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="mb-3">
            <label for="Genero">Genero</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="gender1" name="gender" value="Masculino"
                    <?= !empty($data_user_data['gender']) && $data_user_data['gender'] == 'Masculino' ? 'checked' : '' ?> />
                <label class="form-check-label" for="gender1">Masculino</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="gender2" name="gender" value="Femenino"
                    <?= !empty($data_user_data['gender']) && $data_user_data['gender'] == 'Femenino' ? 'checked' : '' ?> />
                <label class="form-check-label" for="gender2">Femenino</label>
            </div>
        </div>
        <div class="mb-3">
            <label for="experience">Experiencia</label>
            <textarea name="experience"
                class="form-control"><?= !empty($data_user_data['experience']) ? $data_user_data['experience'] : '' ?></textarea>
        </div>
        <div class="mb-3">
            <label for="disabilities">Discapacidades</label>
            <textarea name="disabilities"
                class="form-control"><?= !empty($data_user_data['disabilities']) ? $data_user_data['disabilities'] : '' ?></textarea>
        </div>


        <div class="mb-3">
            <label for="civil_status">Estado Civil</label>
            <select name="civil_status" id="select2" style="width:100%;">
                <?php
                $civil_status = array(
                    'Casado' => 'Casado',
                    'Soltero' => 'Soltero',
                    'Union-Libre' => 'Union-Libre',
                    'Divorciado' => 'Divorciado',
                );

                foreach ($civil_status as   $value => $display_text) {
                    if ($action == 'edit') :
                        $selected = ($value == $data_user_data['civil_status']) ? ' selected="selected"' : "";
                        echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                    else :
                        echo '<option value="' . $value . '">' . $display_text . '</option>';
                    endif;
                }
                ?>
            </select>
        </div>

        <div class="mb-3">
            <label for="name_couple" class="form-label">Nombre Pareja</label>
            <input type="text" name="name_couple" class="form-control"
                value="<?= !empty($data_user_data['name_couple']) ? $data_user_data['name_couple'] : '' ?>">
        </div>


        <div class="mb-3">
            <label for="number_children">Numero de hijos</label>
            <input type="text" name="number_children"
                value="<?= !empty($data_user_data['number_children']) ? $data_user_data['number_children'] : '' ?>"
                class="form-control" />
        </div>

        <hr>

        <div class='row'>
            <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                <table class="table table-bordered table-hover" id="table_auto">
                    <thead>
                        <tr>
                            <th width="2%"><input id="check_all" class="formcontrol" type="checkbox" /></th>
                            <th width="45%">Nombre</th>
                            <th width="45%">Edad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($action == 'new') : ?>
                        <tr>
                            <td><input class="case" type="checkbox" /></td>
                            <td><input type="text" data-type="names_children" name="names_children[]" id="itemNo_1"
                                    class="form-control autocomplete_txt" autocomplete="off"></td>
                            <td><input type="text" data-type="age_children" name="age_children[]" id="itemName_1"
                                    class="form-control autocomplete_txt" autocomplete="off"></td>

                        </tr>


                        <?php else :
                            $names_children = json_decode($data_user_data['names_children']);
                            $age_children   = json_decode($data_user_data['age_children']);

                            $counter = 0;
                            for ($i = 0; $i < count($names_children); $i++) :
                                $counter++;
                            ?>

                        <tr>
                            <td><input class="case" type="checkbox" /></td>
                            <td><input type="text" data-type="names_children" name="names_children[]"
                                    id="nameCh_<?= $counter; ?>" class="form-control autocomplete_txt"
                                    autocomplete="off" value="<?= $names_children[$i]; ?>"></td>

                            <td><input type="text" data-type="age_children" name="age_children[]"
                                    id="ageCh_<?= $counter; ?>" class="form-control autocomplete_txt" autocomplete="off"
                                    value="<?= $age_children[$i]; ?>">
                            </td>
                        </tr>
                        <?php endfor; ?>
                        <input type="hidden" value="1" id="hide">



                        <?php endif ?>

                    </tbody>

                </table>
            </div>
        </div>

        <div class='row mb-4'>
            <div class='col-8'>
                <button class="btn btn-danger delete" type="button">- Eliminar</button>
                <button class="btn btn-success addmore" type="button">+ Agregar</button>
            </div>
            <div class='col-4'>
            </div>
        </div>
        <hr>
        <br />







        <div class="form-group">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <label for="error"></label>
        </div>
</form>

<script>
$(document).ready(function() {

    $('.select2').select2({
        theme: 'bootstrap-5',
        dropdownParent: $('.modal-form')

    });

    $('#select2').select2({
        theme: 'bootstrap-5',
        dropdownParent: $('.modal-form')

    });



    $(function() {
        $("#datepicker").datepicker({
            dateFormat: "yy-mm-dd"
        });
    });




    var i = $('#table_auto tr').length;
    $(".addmore").on('click', function() {
        html = '<tr>';
        html += '<td><input class="case" type="checkbox"/></td>';
        html +=
            '<td><input type="text" data-type="names_children" name="names_children[]" id="nameCh_' +
            i +
            '" class="form-control autocomplete_txt" autocomplete="off"></td>';
        html += '<td><input type="text" data-type="age_children" name="age_children[]" id="ageCh_' +
            i +
            '" class="form-control autocomplete_txt" autocomplete="off"></td>';
        html += '</tr>';
        $('#table_auto').append(html);
        i++;
    });

    //to check all checkboxes
    $(document).on('change', '#check_all', function() {
        $('input[class=case]:checkbox').prop("checked", $(this).is(':checked'));
    });

    //deletes the selected table rows
    $(".delete").on('click', function() {
        $('.case:checkbox:checked').parents("tr").remove();
        $('#check_all').prop("checked", false);
    });




});
</script>