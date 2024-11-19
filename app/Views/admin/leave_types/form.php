<form id="form" accept-charset="utf-8">
    <div class="mb-3">
        <label for="name" class="form-label">Titulo</label>
        <input type="text" name="name" value="<?= !empty($data_leave_types['name']) ? $data_leave_types['name'] : '' ?>"
            class="form-control" />
    </div>
    <div class="mb-3">
        <label for="leave_day" class="form-label">Cantidad de dias</label>
        <input type="text" name="leave_day"
            value="<?= !empty($data_leave_types['leave_day']) ? $data_leave_types['leave_day'] : '' ?>"
            class="form-control" />
    </div>
    <div class="mb-3">
        <label for="status" class="form-label">Estatus</label>
        <input type="text" name="status"
            value="<?= !empty($data_leave_types['status']) ? $data_leave_types['status'] : '' ?>"
            class="form-control" />
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>