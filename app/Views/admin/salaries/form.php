<form id="form" accept-charset="utf-8">
    <div class="row">
        <div class="mb-3">
            <label for="id_user" class="form-label">Empleado</label>
            <select name="id_user" class="select2" style="width:100%;">
                <?php foreach ($data_user_data as $user_datas => $user_datum) : ?>
                <option value="<?= $user_datum['id'] ?>"
                    <?= !empty($data_salaries['id_user']) && $data_salaries['id_user'] == $user_datum['id'] ? 'selected' : '' ?>>
                    <?= $user_datum['first_name'] . ' ' . $user_datum['last_name'] ?></option>
                <?php endforeach ?>
            </select>
        </div>
        <div class="col">
            <div class="mb-3">
                <label for="amount" class="form-label">Monto</label>
                <input type="text" name="amount"
                    value="<?= !empty($data_salaries['amount']) ? $data_salaries['amount'] : '' ?>"
                    class="form-control" />
            </div>
        </div>
        <div class="col">
            <div class="mb-3">
                <label for="deductions" class="form-label">Deducciones</label>
                <input type="text" name="deductions"
                    value="<?= !empty($data_salaries['deductions']) ? $data_salaries['deductions'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="mb-3">
            <label for="bonuses" class="form-label">Bono</label>
            <input type="text" name="bonuses"
                value="<?= !empty($data_salaries['bonuses']) ? $data_salaries['bonuses'] : '' ?>"
                class="form-control" />
        </div>
        <div class="mb-3">
            <label for="net_salary" class="form-label">Salario Neto</label>
            <input type="text" name="net_salary"
                value="<?= !empty($data_salaries['net_salary']) ? $data_salaries['net_salary'] : '' ?>"
                class="form-control" />
        </div>
        <div class="mb-3">
            <label for="pay_biweekly" class="form-label">Monto Quincenal</label>
            <input type="text" name="pay_biweekly"
                value="<?= !empty($data_salaries['pay_biweekly']) ? $data_salaries['pay_biweekly'] : '' ?>"
                class="form-control" />
        </div>

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

});
</script>