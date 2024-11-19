<form id="form" accept-charset="utf-8">
    <div class="mb-3">
        <label for="id_user" class="form-label">Empleado</label>
        <select name="id_user" class="select2" style="width:100%;">
            <?php foreach ($data_user_data as $user_datas => $user_datum) : ?>
            <option value="<?= $user_datum['id'] ?>"
                <?= !empty($data_leaves['id_user']) && $data_leaves['id_user'] == $user_datum['id'] ? 'selected' : '' ?>>
                <?= $user_datum['first_name'] . '' . $user_datum['last_name'] ?></option>
            <?php endforeach ?>
        </select>
    </div>
    <div class="mb-3">
        <label for="id_type" class="form-label">Tipo de permiso</label>
        <select name="id_type" class="select2" style="width:100%;">
            <?php foreach ($data_leave_types as $leave_types => $leave_type) : ?>
            <option value="<?= $leave_type['id'] ?>"
                <?= !empty($data_leaves['id_type']) && $data_leaves['id_type'] == $leave_type['id'] ? 'selected' : '' ?>>
                <?= $leave_type['name'] ?></option>
            <?php endforeach ?>
        </select>
    </div>


    <div class="mb-3">
        <label class="form-label">Duracion del permiso</label><br>
        <div class="form-check">
            <input name="leave_time" type="radio" id="radio_1" data-value="Half" class="form-check-input duration"
                value="Half Day" checked>
            <label class="form-check-label" for="radio_1">Horas</label>
        </div>
        <div class="form-check">
            <input name="leave_time" type="radio" id="radio_2" data-value="Full" class="form-check-input type"
                value="Full Day">
            <label class="form-check-label" for="radio_2">Dia Completo</label>
        </div>
        <div class="form-check">
            <input name="leave_time" type="radio" id="radio_3" data-value="More" class="form-check-input duration"
                value="More than One day">
            <label class="form-check-label" for="radio_3">Mas de un dia</label>
        </div>
    </div>



    <div class="mb-3">
        <label class="form-label" id="hourlyFix">Fecha</label>
        <input type="text" name="start_date" class="form-control datepicker" id="recipient-name1"
            value="<?= !empty($data_leaves['start_date']) ? $data_leaves['start_date'] : '' ?>" required>
    </div>
    <div class="mb-3" id="enddate" style="display:none">
        <label class="form-label">Fecha Final</label>
        <input type="text" name="end_date" class="form-control datepicker" id="recipient-name1 datepicker"
            value="<?= !empty($data_leaves['end_date']) ? $data_leaves['end_date'] : '' ?>">
    </div>

    <div class="mb-3" id="hourAmount">
        <label class="form-label">Cantidad Horas</label>
        <select id="hourAmountVal" class=" form-control select2" style="width:100%;" tabindex="1" name="hours_leave"
            required>
            <option value="">Selecciona las horas</option>
            <option value="1">Una hora</option>
            <option value="2">Dos horas</option>
            <option value="3">Tres horas</option>
            <option value="4">Cuatro horas</option>
            <option value="5">Cinco horas</option>
            <option value="6">Seis horas</option>
            <option value="7">Siete horas</option>
            <option value="8">Ocho horas</option>
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label">Razón del permiso</label>
        <textarea class="form-control" rows="5" name="reason" id="message-text1" required
            minlength="10"><?= !empty($data_leaves['reason']) ? $data_leaves['reason'] : '' ?></textarea>
    </div>

    </div>
    <script>
    $(document).ready(function() {
        $('#form input').on('change', function(e) {
            e.preventDefault(e);

            // Get the record's ID via attribute  
            var duration = $('input[name=leave_time]:checked', '#form').attr('data-value');

            if (duration == 'Half') {
                $('#enddate').hide();
                $('#hourlyFix').text('Facha');
                $('#hourAmount').show();
            } else if (duration == 'Full') {
                $('#enddate').hide();
                $('#hourAmount').hide();
                $('#hourlyFix').text('Fecha del dia');
            } else if (duration == 'More') {
                $('#enddate').show();
                $('#hourAmount').hide();
            }



        });


    });
    </script>






    <div class="form-group">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>

<script>
$("#datepicker").datepicker({
    dateFormat: "yy-mm-dd"
});
</script>