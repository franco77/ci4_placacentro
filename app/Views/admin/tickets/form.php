<form id="form" accept-charset="utf-8">
    <div class="row">
        <div class="col">
            <div class="mb-3">
                <label for="id_user">Para</label>
                <select name="id_user" id="id_user" class="select2" style="width:100%;">
                    <option value="">-- Seleccione Usuario --</option>
                    <?php
                    foreach ($assigned_to as $assig) :
                        if ($action == 'edit') :
                            $selected = ($assig['id'] == $data_tickets['id_user']) ? ' selected="selected"' : "";
                            echo "<option value='" . $assig['id'] . "'" . $selected . ">" . $assig['first_name'] . ' ' . $assig['last_name'] . "</option>";
                        else :
                            echo '<option value="' . $assig['id'] . '">' . $assig['first_name'] . ' ' . $assig['last_name'] . '</option>';
                        endif;
                    endforeach;
                    ?>
                </select>
            </div>
        </div>

        <div class="col">
            <div class="mb-3">
                <label for="id_category">Categoria</label>
                <select name="id_category" class="select2" style="width:100%;">
                    <option value="">-- Seleccione la categoria --</option>
                    <?php foreach ($data_category as $categories => $category) : ?>
                    <option value="<?= $category['id'] ?>"
                        <?= !empty($data_tickets['id_category']) && $data_tickets['id_category'] == $category['id'] ? 'selected' : '' ?>>
                        <?= $category['title'] ?></option>
                    <?php endforeach ?>
                </select>
            </div>
        </div>

        <div class="mb-3">
            <label for="ticket_title">Titulo</label>
            <input type="text" name="ticket_title"
                value="<?= !empty($data_tickets['ticket_title']) ? $data_tickets['ticket_title'] : '' ?>"
                class="form-control" />
        </div>
        <div class="mb-3">
            <label for="ticket_description">Mensaje</label>
            <textarea name="ticket_description" rows="5"
                class="form-control"><?= !empty($data_tickets['ticket_description']) ? $data_tickets['ticket_description'] : '' ?></textarea>
        </div>

        <div class="mb-3">
            <label for="priority">Prioridad</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="priority1" name="priority" value="Bajo"
                    <?= !empty($data_tickets['priority']) && $data_tickets['priority'] == 'Bajo' ? 'checked' : '' ?> />
                <label class="form-check-label" for="priority1">Bajo</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="priority2" name="priority" value="Medio"
                    <?= !empty($data_tickets['priority']) && $data_tickets['priority'] == 'Medio' ? 'checked' : '' ?> />
                <label class="form-check-label" for="priority2">Medio</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="priority3" name="priority" value="Alto"
                    <?= !empty($data_tickets['priority']) && $data_tickets['priority'] == 'Alto' ? 'checked' : '' ?> />
                <label class="form-check-label" for="priority3">Alto</label>
            </div>
        </div>






    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>



<script>
$('.select2').select2({
    theme: 'bootstrap-5',
    dropdownParent: $('.modal-form')

});
</script>