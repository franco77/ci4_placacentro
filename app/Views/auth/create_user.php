<?= $this->extend("admin/layout/master") ?>

<?= $this->section("content") ?>

<div id="infoMessage"><?php echo $message; ?></div>


<div class="card">
    <div class="card-header">Crear Usuario</div>
    <div class="card-body">

        <?php echo form_open('auth/create_user'); ?>

        <div class="mb-3">
            <label for="ic" class="form-label">Cedula</label>
            <?php echo form_input($ic); ?>
        </div>


        <div class="row">
            <div class="col">
                <div class="mb-3">
                    <label for="first_name" class="form-label">Nombre</label>
                    <?php echo form_input($first_name); ?>
                </div>
            </div>

            <div class="col">
                <div class="mb-3">
                    <label for="last_name" class="form-label">Apellido</label>
                    <?php echo form_input($last_name); ?>
                </div>
            </div>
        </div>


        <div class="mb-3">
            <label for="birthdate" class="form-label">Fecha de nacimiento</label>
            <?php echo form_input($birthdate); ?>
        </div>


        <?php
        if ($identity_column !== 'email') {
            echo '<p>';
            echo form_label(lang('Auth.create_user_identity_label'), 'identity');
            echo '<br />';
            echo \Config\Services::validation()->getError('identity');
            echo form_input($identity);
            echo '</p>';
        }
        ?>

        <div class="row">
            <div class="col">
                <div class="mb-3">
                    <label for="company" class="form-label">Cargo</label>
                    <?php echo form_dropdown($company); ?>
                </div>
            </div>

            <div class="col">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <?php echo form_input($email); ?>
                </div>
            </div>
        </div>

        <div class="mb-3">
            <label for="phone" class="form-label">Telefono</label>
            <?php echo form_input($phone); ?>
        </div>

        <div class="mb-3">
            <label for="admission_date" class="form-label">Fecha de Ingreso</label>
            <?php echo form_input($admission_date); ?>
        </div>

        <div class="row">
            <div class="col">
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <?php echo form_input($password); ?>
                </div>
            </div>

            <div class="col">
                <div class="mb-3">
                    <label for="password_confirm" class="form-label">Confirmar Contraseña</label>
                    <?php echo form_input($password_confirm); ?>
                </div>
            </div>
        </div>


        <div class="mb-3">
            <?php echo form_submit('submit', lang('Auth.create_user_submit_btn'), array('class' => 'btn btn-primary')); ?>
        </div>


    </div>
</div>

<?php echo form_close(); ?>


<?= $this->endSection() ?>