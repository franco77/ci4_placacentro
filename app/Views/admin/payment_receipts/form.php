<form id="form" accept-charset="utf-8">
   <div class="mb-3">
      <label for="id_user" class="form-label">Id User</label>
      <select name="id_user" class="custom-select">
         <?php foreach($data_user_data as $user_datas => $user_datum): ?>
         <option value="<?= $user_datum['id'] ?>" <?= !empty($data_payment_receipts['id_user']) && $data_payment_receipts['id_user'] == $user_datum['id'] ? 'selected' : '' ?>><?= $user_datum['id'] ?></option>
         <?php endforeach ?>
      </select>
   </div>
   <div class="mb-3">
      <label for="amount_paid" class="form-label">Amount Paid</label>
      <input type="text" name="amount_paid" value="<?= !empty($data_payment_receipts['amount_paid']) ? $data_payment_receipts['amount_paid'] : '' ?>" class="form-control" />
   </div>
   <div class="mb-3">
      <label for="payment_date" class="form-label">Payment Date</label>
      <input type="text" name="payment_date" value="<?= !empty($data_payment_receipts['payment_date']) ? $data_payment_receipts['payment_date'] : '' ?>" class="form-control date" id="payment_date" data-toggle="datetimepicker" data-target="#payment_date" />
   </div>
   <div class="form-group">
      <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      <label for="error"></label>
   </div>
</form>