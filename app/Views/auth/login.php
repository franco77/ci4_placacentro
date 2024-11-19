<?= $this->extend("admin/layout/login") ?>

<?= $this->section("content") ?>

<div class="container-fluid ps-md-0">
    <div class="row g-0">
        <div class="d-none d-md-flex col-md-4 col-lg-8 bg-image"></div>
        <div class="col-md-8 col-lg-4">
            <div class="login d-flex align-items-center py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-lg-8 mx-auto">
                            <h3 class="login-heading mb-4">Welcome back!</h3>
                            <div id="infoMessage"><?php echo $message; ?></div>
                            <!-- Sign In Form -->
                            <?php echo form_open('auth/login'); ?>
                            <div class="form-floating mb-3">
                                <?php echo form_input($identity); ?>
                                <label for="floatingInput">Email address</label>
                            </div>
                            <div class="form-floating mb-3">
                                <?php echo form_input($password); ?>
                                <label for="floatingPassword">Password</label>
                            </div>

                            <div class="form-check mb-3">
                                <?php echo form_checkbox('remember', '1', false, 'id="remember"'); ?>
                                <label class="form-check-label" for="rememberPasswordCheck">
                                    Remember password
                                </label>
                            </div>

                            <div class="d-grid">
                                <?php echo form_submit('submit', lang('Auth.login_submit_btn'), array('class' => 'btn btn-primary')); ?>
                                <div class="text-center">
                                    <a href="forgot_password"><?php echo lang('Auth.login_forgot_password'); ?></a>
                                </div>
                            </div>

                            <?php echo form_close(); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>








<?= $this->endSection() ?>