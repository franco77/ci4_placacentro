<form id="form" accept-charset="utf-8">

    <div class="row">
        <div class="mb-3">
            <label for="item_code" class="form-label">Codigo</label>
            <input type="text" name="item_code"
                value="<?= !empty($data_items['item_code']) ? $data_items['item_code'] : '' ?>" class="form-control" />
        </div>
        <div class="mb-3">
            <label for="item_name" class="form-label">Nombre</label>
            <input type="text" name="item_name"
                value="<?= !empty($data_items['item_name']) ? $data_items['item_name'] : '' ?>" class="form-control" />
        </div>


        <div class="mb-3">
            <label for="item_description">Descripción</label>
            <textarea rows="3" name="item_description"
                class="form-control"><?= !empty($data_installments['item_description']) ? $data_installments['item_description'] : '' ?></textarea>
        </div>

        <div class="col">
            <div class="mb-3">
                <label for="quantity" class="form-label">Cantidad</label>
                <input type="text" name="quantity"
                    value="<?= !empty($data_items['quantity']) ? $data_items['quantity'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="col">
            <div class="mb-3">
                <label for="price" class="form-label">Precio de venta</label>
                <input type="text" name="price" value="<?= !empty($data_items['price']) ? $data_items['price'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label" for="id_brand">Marca</label>
            <select name="id_brand" id="brands" class="select2" style="width:100%;">
                <option value="">-- Seleccione la marca --</option>
                <?php
                foreach ($brand as $brd) :
                    if ($action == 'edit') :
                        $selected = ($brd['id'] == $data_items['id_brand']) ? ' selected="selected"' : "";
                        echo "<option value='" . $brd['id'] . "'" . $selected . ">" . $brd['brand'] . "</option>";
                    else :
                        echo '<option value="' . $brd['id'] . '">' . $brd['brand'] . '</option>';
                    endif;
                endforeach;
                ?>
            </select>
        </div>

        <div class="col">

            <div class="mb-3">
                <label for="status" class="form-label">Estatus</label>
                <select name="status" class="form-select" style="width:100%;">
                    <?php
                    $status = array(
                        'ACTIVO' => 'ACTIVO',
                        'INACTIVO' => 'INACTIVO',
                    );

                    foreach ($status as $value => $display_text) :
                        if ($action == 'edit') :
                            $selected = ($value == $data_items['status']) ? ' selected="selected"' : "";
                            echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                        else :
                            echo '<option value="' . $value . '">' . $display_text . '</option>';
                        endif;
                    endforeach;
                    ?>
                </select>
            </div>
        </div>
        <div class="col">

            <div class="mb-3">
                <label for="category" class="form-label">Categoria</label>
                <select name="category" class="form-select" id="select2" style="width:100%;">
                    <?php
                    $category = array(
                        'TABLEROS' => 'TABLEROS',
                        'HERRAJES' => 'HERRAJES',
                        'COLCHONES' => 'COLCHONES',
                        'CANTO SUELTO' => 'CANTO SUELTO',
                        'CANTO PEGADO' => 'CANTO PEGADO',

                    );

                    foreach ($category as $value => $display_text) {
                        if ($action == 'edit') :
                            $selected = ($value == $data_items['category']) ? ' selected="selected"' : "";
                            echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                        else :
                            echo '<option value="' . $value . '">' . $display_text . '</option>';
                        endif;
                    }
                    ?>
                </select>
            </div>
        </div>

    </div>

    <div class="mb-3">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>



<script>
$('#select2').select2({
    theme: 'bootstrap-5',
    dropdownParent: $('.modal-form')

});

$('#brands').select2({
    theme: 'bootstrap-5',
    dropdownParent: $('.modal-form')
});
</script>