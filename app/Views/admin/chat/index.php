<?= $this->extend("admin/layout/master") ?>

<?= $this->section("content") ?>


<div class="container mx-auto p-4">
    <?php if (isset($validation)) : ?>
    <div class="alert alert-danger bg-red-700">
        <?= $validation->listErrors() ?>
    </div>
    <?php endif; ?>
    <div class="d-flex justify-content-center">
        <div class="w-100 max-w-md">
            <form class="bg-white shadow rounded p-4 mb-4" method="POST" action="">
                <div class="mb-3">
                    <label class="form-label text-gray-700 text-sm fw-bold" for="username">Username</label>
                    <input class="form-control shadow-sm rounded" id="username" name="username" type="text"
                        placeholder="Username">
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Join</button>
                </div>
            </form>
        </div>
    </div>
</div>




<?= $this->endSection() ?>
<!-- /.content -->


<!-- page script -->
<?= $this->section("pageScript") ?>

<?= $this->endSection() ?>