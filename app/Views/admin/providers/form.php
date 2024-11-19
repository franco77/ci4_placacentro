<form id="form" accept-charset="utf-8">
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="company">Compañia (Empresa)</label>
                <input type="text" name="company" value="<?= !empty($data_providers['company']) ? $data_providers['company'] : '' ?>" class="form-control" />
            </div>
        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="contact_name">Nombre del contacto</label>
                <input type="text" name="contact_name" value="<?= !empty($data_providers['contact_name']) ? $data_providers['contact_name'] : '' ?>" class="form-control" />
            </div>
        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="contact_title">Titulo</label>
                <input type="text" name="contact_title" value="<?= !empty($data_providers['contact_title']) ? $data_providers['contact_title'] : '' ?>" class="form-control" />
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="address">Direccion</label>
                <input type="text" name="address" value="<?= !empty($data_providers['address']) ? $data_providers['address'] : '' ?>" class="form-control" />
            </div>
        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="city">Ciudad</label>
                <input type="text" name="city" value="<?= !empty($data_providers['city']) ? $data_providers['city'] : '' ?>" class="form-control" />
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="region">Region</label>
                <input type="text" name="region" value="<?= !empty($data_providers['region']) ? $data_providers['region'] : '' ?>" class="form-control" />
            </div>
        </div>


        <div class="mb-3">
            <label for="website">Sitio web</label>
            <input type="text" name="website" value="<?= !empty($data_providers['website']) ? $data_providers['website'] : '' ?>" class="form-control" />
        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="country">Pais</label>
                <input type="text" name="country" value="<?= !empty($data_providers['country']) ? $data_providers['country'] : '' ?>" class="form-control" />
            </div>
        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="phone">Telefono</label>
                <input type="text" name="phone" value="<?= !empty($data_providers['phone']) ? $data_providers['phone'] : '' ?>" class="form-control" />
            </div>
        </div>

        <div class="mb-3">
            <label for="email">Email</label>
            <input type="text" name="email" value="<?= !empty($data_providers['email']) ? $data_providers['email'] : '' ?>" class="form-control" />
        </div>


    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>