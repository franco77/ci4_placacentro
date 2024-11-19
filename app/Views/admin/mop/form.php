<form id="form" accept-charset="utf-8">
   <div class="mb-3">
      <label for="item_code">Item Code</label>
      <textarea name="item_code" class="form-control" ><?= !empty($data_mop['item_code']) ? $data_mop['item_code'] : '' ?></textarea>
   </div>
   <div class="mb-3">
      <label for="item_name">Item Name</label>
      <textarea name="item_name" class="form-control" ><?= !empty($data_mop['item_name']) ? $data_mop['item_name'] : '' ?></textarea>
   </div>
   <div class="mb-3">
      <label for="quantity">Quantity</label>
      <textarea name="quantity" class="form-control" ><?= !empty($data_mop['quantity']) ? $data_mop['quantity'] : '' ?></textarea>
   </div>
   <div class="mb-3">
      <label for="category">Category</label>
      <input type="text" name="category" value="<?= !empty($data_mop['category']) ? $data_mop['category'] : '' ?>" class="form-control" />
   </div>
   <div class="mb-3">
      <label for="type">Type</label>
      <input type="text" name="type" value="<?= !empty($data_mop['type']) ? $data_mop['type'] : '' ?>" class="form-control" />
   </div>
   <div class="mb-3">
      <label for="created_by">Created By</label>
      <input type="text" name="created_by" value="<?= !empty($data_mop['created_by']) ? $data_mop['created_by'] : '' ?>" class="form-control" />
   </div>
   <div class="mb-3">
      <label for="created_at">Created At</label>
      <input type="text" name="created_at" value="<?= !empty($data_mop['created_at']) ? $data_mop['created_at'] : '' ?>" class="form-control" />
   </div>
   <div class="form-group">
      <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      <label for="error"></label>
   </div>
</form>