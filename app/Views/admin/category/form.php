<form id="form" accept-charset="utf-8">
   <div class="mb-3">
      <label for="title">Title</label>
      <input type="text" name="title" value="<?= !empty($data_category['title']) ? $data_category['title'] : '' ?>" class="form-control" />
   </div>
   <div class="mb-3">
      <label for="description">Description</label>
      <input type="text" name="description" value="<?= !empty($data_category['description']) ? $data_category['description'] : '' ?>" class="form-control" />
   </div>
   <div class="form-group">
      <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      <label for="error"></label>
   </div>
</form>