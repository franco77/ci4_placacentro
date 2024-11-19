<form id="form" accept-charset="utf-8">
    <div class="mb-3">
        <label for="ex_in_cat_id" class="form-label">Categoria</label>
        <select name="ex_in_cat_id" class="select2" style="width:100%;">
            <?php foreach ($data_cat_ex_in as $cat_ex_ins => $cat_ex_in) : ?>
            <option value="<?= $cat_ex_in['id'] ?>"
                <?= !empty($data_expenses['ex_in_cat_id']) && $data_expenses['ex_in_cat_id'] == $cat_ex_in['id'] ? 'selected' : '' ?>>
                <?= $cat_ex_in['title'] ?></option>
            <?php endforeach ?>
        </select>
    </div>
    <div class="mb-3">
        <label for="title" class="form-label">Titulo</label>
        <input type="text" name="title" value="<?= !empty($data_expenses['title']) ? $data_expenses['title'] : '' ?>"
            class="form-control" />
    </div>
    <div class="mb-3">
        <label for="amount" class="form-label">Monto</label>
        <input type="text" name="amount" id="amount"
            value="<?= !empty($data_expenses['amount']) ? $data_expenses['amount'] : '' ?>" class="form-control" />
    </div>
    <div class="mb-3">
        <label for="description" class="form-label">Descripcion</label>
        <textarea name="description" rows="5"
            class="form-control"><?= !empty($data_expenses['description']) ? $data_expenses['description'] : '' ?></textarea>
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
        theme: 'bootstrap-5',
        dropdownParent: $('.modal-form')
    });

    $("#amount").maskMoney({
        prefix: 'COP ',
        suffix: "",
        formatOnBlur: true,
        allowZero: false,
        allowNegative: true,
        allowEmpty: false,
        doubleClickSelection: true,
        selectAllOnFocus: true,
        thousands: '.',
        decimal: '.',
        precision: 0,
        affixesStay: true,
        bringCaretAtEndOnFocus: true

    });

});
</script>