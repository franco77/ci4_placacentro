<form id="form" accept-charset="utf-8">
    <div class="mb-3">
        <label class="form-label" for="id_user">Operador</label>
        <select name="id_user" id="id_user" class="select2" style="width:100%;">
            <option value="">-- Seleccione Operador --</option>
            <?php
            foreach ($operators as $ope) :
                if ($action == 'edit') :
                    $selected = ($ope['id'] == $data_machines['id_user']) ? ' selected="selected"' : "";
                    echo "<option value='" . $ope['id'] . "'" . $selected . ">" . $ope['first_name'] . ' ' . $ope['last_name'] . "</option>";
                else :
                    echo '<option value="' . $ope['id'] . '">' . $ope['first_name'] . ' ' . $ope['last_name'] . '</option>';
                endif;
            endforeach;
            ?>
        </select>
    </div>
    <div class="mb-3">
        <label for="name_machine">Nombre Maquina</label>
        <input type="text" name="name_machine"
            value="<?= !empty($data_machines['name_machine']) ? $data_machines['name_machine'] : '' ?>"
            class="form-control" />
    </div>
    <div class="mb-3">
        <label for="cod">Codigo</label>
        <input type="text" name="cod" value="<?= !empty($data_machines['cod']) ? $data_machines['cod'] : '' ?>"
            class="form-control" />
    </div>
    <div class="mb-3">
        <label for="status">Estatus</label>
        <select name="status" class="form-select" id="select2" style="width:100%;">
            <?php

            $status = array(
                '1' => 'Activo',
                '0' => 'Inactivo',
            );

            foreach ($status as   $value => $display_text) {
                if ($action == 'edit') :
                    $selected = ($value == $data_machines['status']) ? ' selected="selected"' : "";
                    echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                else :
                    echo '<option value="' . $value . '">' . $display_text . '</option>';
                endif;
            }
            ?>
        </select>
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>


<script>
$(document).ready(function() {
    $('.select2').select2({
        theme: 'bootstrap-5'
    });
});
</script>