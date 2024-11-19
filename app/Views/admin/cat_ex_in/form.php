<form id="form" accept-charset="utf-8">
   <div class="mb-3">
      <label for="title">Title</label>
      <input type="text" name="title" value="<?= !empty($data_cat_ex_in['title']) ? $data_cat_ex_in['title'] : '' ?>" class="form-control" />
   </div>
   <div class="mb-3">
      <label for="description">Description</label>
      <textarea name="description" class="form-control" ><?= !empty($data_cat_ex_in['description']) ? $data_cat_ex_in['description'] : '' ?></textarea>
   </div>
   <div class="mb-3">
      <label for="type">Type</label>
      <input type="text" name="type" value="<?= !empty($data_cat_ex_in['type']) ? $data_cat_ex_in['type'] : '' ?>" class="form-control" />
   </div>
   <div class="mb-3">
      <label for="created_at">Created At</label>
      <input type="text" name="created_at" value="<?= !empty($data_cat_ex_in['created_at']) ? $data_cat_ex_in['created_at'] : '' ?>" class="form-control date" id="created_at" data-toggle="datetimepicker" data-target="#created_at" />
   </div>
   <div class="form-group">
      <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      <label for="error"></label>
   </div>
</form>