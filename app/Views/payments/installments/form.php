<form id="form" accept-charset="utf-8">
    <div class="row">

        <div class="col-6">
            <div class="mb-3">
                <label for="cod_cut">Codigo de corte</label>
                <input type="text" name="cod_cut"
                    value="<?= !empty($data_installments['cod_cut']) ? $data_installments['cod_cut'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="title">Titulo</label>
                <input type="text" name="title"
                    value="<?= !empty($data_installments['title']) ? $data_installments['title'] : '' ?>"
                    class="form-control" />
            </div>
        </div>



        <div class="col">
            <div class="mb-3">
                <label for="amount">Monto</label>
                <input type="text" name="amount"
                    value="<?= !empty($data_installments['amount']) ? $data_installments['amount'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="col">
            <div class="mb-3">
                <label for="type">Tipo de transferencia</label>
                <select name="type" class="form-select" id="select2" style="width:100%;">
                    <?php
                    $type = array(
                        'efectivo' => 'Efectivo',
                        'transferencia' => 'Transferencia',
                        'tarjeta' => 'Tarjeta',
                    );

                    foreach ($type as   $value => $display_text) {
                        if ($action == 'edit') :
                            $selected = ($value == $data_installments['type']) ? ' selected="selected"' : "";
                            echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                        else :
                            echo '<option value="' . $value . '">' . $display_text . '</option>';
                        endif;
                    }
                    ?>
                </select>
            </div>
        </div>

        <div class="mb-3">
            <label for="description">Descripción</label>
            <textarea rows="5" name="description" id="summernote"
                class="form-control"><?= !empty($data_installments['description']) ? $data_installments['description'] : '' ?></textarea>
        </div>

        <div class="mb-3">
            <label for="status">Estatus</label>
            <select name="status" class="form-select" id="select2" style="width:100%;">
                <?php

                $status = array(
                    'Activo' => 'Activo',
                    'Inactivo' => 'Inactivo',
                    'En Espera' => 'En Espera',
                );

                foreach ($status as   $value => $display_text) {
                    if ($action == 'edit') :
                        $selected = ($value == $data_installments['status']) ? ' selected="selected"' : "";
                        echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                    else :
                        echo '<option value="' . $value . '">' . $display_text . '</option>';
                    endif;
                }
                ?>
            </select>
        </div>

        <div class="mb-3">
            <label for="ip_address">Direccion IP</label>
            <input type="text" name="ip_address" value="<?= getClientIpAddress() ?>" class="form-control" readonly />
        </div>
    </div>

    <?php if ($action == 'new') : ?>
    <input type="hidden" name="created_by"
        value="<?= !empty($data_installments['created_by']) ? $data_installments['created_by'] : '' ?>"
        class="form-control" />

    <input type="hidden" name="created_at"
        value="<?= !empty($data_installments['created_at']) ? $data_installments['created_at'] : '' ?>"
        class="form-control date" id="created_at" data-toggle="datetimepicker" data-target="#created_at" />

    <input type="hidden" name="time" value="<?= !empty($data_installments['time']) ? $data_installments['time'] : '' ?>"
        class="form-control time" id="time" data-toggle="datetimepicker" data-target="#time" />

    <?php endif; ?>


    <?php if ($action == 'edit') : ?>
    <input type="hidden" name="updated_by"
        value="<?= !empty($data_installments['updated_by']) ? $data_installments['updated_by'] : '' ?>"
        class="form-control" />

    <input type="hidden" name="updated_at"
        value="<?= !empty($data_installments['updated_at']) ? $data_installments['updated_at'] : '' ?>"
        class="form-control datetime" id="updated_at" data-toggle="datetimepicker" data-target="#updated_at" />

    <input type="hidden" name="deleted_at"
        value="<?= !empty($data_installments['deleted_at']) ? $data_installments['deleted_at'] : '' ?>"
        class="form-control datetime" id="deleted_at" data-toggle="datetimepicker" data-target="#deleted_at" />
    <?php endif; ?>





    <div class="mb-3">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>





<script>
$(document).ready(function() {
    $('#summernote').summernote({
        placeholder: 'Agrega alguna nota',
        tabsize: 2,
        height: 200
    });


    $('#select2').select2({
        theme: 'bootstrap-5'
    });
});
</script>