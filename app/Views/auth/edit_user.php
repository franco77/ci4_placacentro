<?= $this->extend("admin/layout/master") ?>

<?= $this->section("content") ?>

<div id="infoMessage"><?= $message; ?></div>

<div class="card">
    <div class="card-header">Editar Usuario</div>
    <div class="card-body">

        <?= form_open(uri_string()); ?>

        <div class="mb-3">
            <label for="ic" class="form-label">Cedula</label>
            <?= form_input($ic); ?>
        </div>

        <div class="mb-3">
            <label for="first_name" class="form-label">Nombre</label>
            <?= form_input($first_name); ?>
        </div>

        <div class="mb-3">
            <label for="last_name" class="form-label">Apellido</label>
            <?= form_input($last_name); ?>
        </div>

        <div class="mb-3">
            <label for="birthdate" class="form-label">Fecha de nacimiento</label>
            <?php echo form_input($birthdate); ?>
        </div>

        <div class="mb-3">
            <label for="company" class="form-label">Cargo</label>
            <?= form_dropdown($company); ?>
        </div>

        <div class="mb-3">
            <label for="phone" class="form-label">Telefono</label>
            <?= form_input($phone); ?>
        </div>

        <div class="mb-3">
            <label for="admission_date" class="form-label">Fecha de Ingreso</label>
            <?= form_input($admission_date); ?>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Contraseña</label>
            <?= form_input($password); ?>
        </div>

        <div class="mb-3">
            <label for="password_confirm" class="form-label">Confirmar Contraseña</label>
            <?= form_input($password_confirm); ?>
        </div>

        <?php if ($ionAuth->isAdmin()) : ?>

        <h3><?= lang('Auth.edit_user_groups_heading'); ?></h3>
        <?php foreach ($groups as $group) : ?>
        <label class="checkbox">
            <?php
                    $gID     = $group['id'];
                    $checked = null;
                    $item    = null;
                    foreach ($currentGroups as $grp) {
                        if ($gID == $grp->id) {
                            $checked = ' checked="checked"';
                            break;
                        }
                    }
                    ?>
            <input type="checkbox" name="groups[]" value="<?= $group['id']; ?>" <?= $checked; ?>>
            <?= htmlspecialchars($group['name'], ENT_QUOTES, 'UTF-8'); ?>
        </label>
        <?php endforeach ?>

        <?php endif ?>

        <?= form_hidden('id', $user->id); ?>

        <div class="mb-3">
            <?= form_submit('submit', 'Editar', array('class' => 'btn btn-primary')); ?>
        </div>

        <?= form_close(); ?>

    </div>
</div>

<?= $this->endSection() ?>