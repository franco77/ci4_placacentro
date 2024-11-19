<form id="form" accept-charset="utf-8">
    <div class="row">
        <div class="col">
            <div class="mb-3">
                <label for="title" class="form-label">Titulo</label>
                <input type="text" name="title"
                    value="<?= !empty($data_holidays['title']) ? $data_holidays['title'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="col">
            <div class="mb-3">
                <label for="date" class="form-label">Facha</label>
                <input type="text" name="date"
                    value="<?= !empty($data_holidays['date']) ? $data_holidays['date'] : '' ?>"
                    class="form-control date" id="datepicker" />
            </div>
        </div>
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>