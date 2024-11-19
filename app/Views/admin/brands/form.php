<form id="form" accept-charset="utf-8">
    <div class="mb-3">
        <label for="brand">Titulo</label>
        <input type="text" name="brand" value="<?= !empty($data_brands['brand']) ? $data_brands['brand'] : '' ?>"
            class="form-control" />
    </div>
    <div class="mb-3">
        <label for="description">Descripcion</label>
        <textarea name="description"
            class="form-control"><?= !empty($data_brands['description']) ? $data_brands['description'] : '' ?></textarea>
    </div>

    <?php if ($action == 'new') : ?>
    <input type="hidden" name="created_at" value="<?= date("Y-m-d h:i:s") ?>" />
    <input type="hidden" name="updated_at" value="<?= date("Y-m-d h:i:s") ?>" />
    <?php else : ?>
    <input type="hidden" name="updated_at" value="<?= date("Y-m-d h:i:s") ?>" />
    <?php endif; ?>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>