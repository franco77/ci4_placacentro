<?= $this->extend("admin/layout/master") ?>


<?= $this->section("content") ?>


<div class="card">
    <div class="card-header">Ajustes</div>
    <div class="card-body">



        <form action="<?= base_url('admin/settings/save_settings') ?>" method="post">

            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="siteName" class="form-label">Titulo Del Sistema</label>
                        <input type="text" class="form-control" name="siteName[]" id="siteName"
                            placeholder="placeholder" value="<?= setting()->get('App.siteName'); ?>">
                    </div>
                </div>
                <div class="col">
                    <div class="mb-3">
                        <label for="address" class="form-label">Direccion Corporativa</label>
                        <input type="text" class="form-control" name="address[]" id="address" placeholder="placeholder"
                            value="<?= setting()->get('App.address'); ?>">
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email de la empresa</label>
                        <input type="email" class="form-control" name="email[]" id="email" placeholder="placeholder"
                            value="<?= setting()->get('App.email'); ?>">
                    </div>
                </div>
                <div class="col">
                    <div class="mb-3">
                        <label for="phone" class="form-label">Telefono de la empresa</label>
                        <input type="phone" class="form-control" name="phone[]" id="phone" placeholder="placeholder"
                            value="<?= setting()->get('App.phone'); ?>">
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <label for="money" class="form-label">Simbolo de moneda</label>
                <input type="money" class="form-control" name="money[]" id="money" placeholder="placeholder"
                    value="<?= setting()->get('App.money'); ?>">
            </div>

            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label class="form-label" for="theme">Thema del sistema</label>
                        <select class="select2" name="theme[]" id="theme" style="width:100%;">
                            <option></option>
                            <?php
                            $themes = array(
                                '' => 'Original',
                                'dark' => 'Original Oscuro',
                                'https://bootswatch.com/5/cerulean/bootstrap.min.css' => 'Ceruelan',
                                'https://bootswatch.com/5/cosmo/bootstrap.min.css'    => 'Cosmo',
                                'https://bootswatch.com/5/cyborg/bootstrap.min.css'   => 'Cyborg',
                                'https://bootswatch.com/5/darkly/bootstrap.min.css'   => 'Darkly',
                                'https://bootswatch.com/5/flatly/bootstrap.min.css'   => 'Flatly',
                                'https://bootswatch.com/5/litera/bootstrap.min.css'   => 'Litera',
                                'https://bootswatch.com/5/lumen/bootstrap.min.css'    => 'Lumen',
                                'https://bootswatch.com/5/yeti/bootstrap.min.css'      => 'Yety',
                            );

                            foreach ($themes as $value => $display_text) {
                                $selected = ($value == setting()->get('App.theme')) ? ' selected="selected"' : "";

                                echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                            }
                            ?>
                        </select>
                    </div>
                </div>

                <div class="col">
                    <div class="mb-3">
                        <label class="form-label" for="sidebar">Barra de Navegacion</label>
                        <select class="select2" name="sidebar[]" id="sidebar" style="width:100%;">
                            <?php
                            $sidebar = array(
                                'dark' => 'Oscuro',
                                'light'    => 'Claro',
                            );

                            foreach ($sidebar as $value => $display_text) {
                                $selected = ($value == setting()->get('App.sidebar')) ? ' selected="selected"' : "";

                                echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                            }
                            ?>
                        </select>
                    </div>
                </div>
            </div>


            <div class="mb-3">
                <label for="currency_symbol" class="control-label">Mondeda</label>
                <select name="currency_symbol" class="select2" data-placeholder="Select an option" style="width:100%;">
                    <option value=""></option>
                    <?php
                    foreach ($all_currency as $currency) {
                        $selected = ($currency['code'] == setting()->get('App.currency_symbol')) ? ' selected="selected"' : "";

                        echo '<option value="' . $currency['code'] . '" ' . $selected . '>' . $currency['code'] . ' - ' . $currency['country'] . '</option>';
                    }
                    ?>
                </select>
            </div>



            <div class="mb-3">
                <label for="table_style" class="form-label">Stilo Tablas</label>
                <select name="table_style[]" class="select2" data-placeholder="Select an option" style="width:100%;">
                    <option></option>
                    <?php
                    $table_style_values = array(
                        'table-striped table-responsive table-bordered table-sm' => 'Con Bordes y Rayas',
                        'table-responsive table-bordered table-sm' => 'Solo Bordes',
                        'table-responsive table-borderless table-sm' => 'Sin Bordes',
                        'table-sm' => 'Normal',
                        'table-striped table-sm' => 'Normal con Rayas',
                        'caption-top table-sm' => 'Caption-Top',
                    );

                    foreach ($table_style_values as $value => $display_text) :
                        $selected = ($value == setting()->get('App.table_style')) ? ' selected="selected"' : "";
                        echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                    endforeach;
                    ?>
                </select>
            </div>




            <div class="mb-3">
                <label for="table_header_style" class="form-label">Stilo Cabecera Tablas</label>
                <select name="table_header_style[]" class="select2" data-placeholder="Select an option"
                    style="width:100%;">
                    <option></option>
                    <?php
                    $table_header_style_values = array(
                        '-' => 'Normal',
                        'table-light' => 'Claro',
                        'table-dark' => 'Oscura',
                        'table-danger' => 'Rojo',
                        'table-info' => 'Informativa',
                        'table-warning' => 'Amarilla',
                        'table-primary' => 'Primaria',
                    );

                    foreach ($table_header_style_values as $value => $display_text) :
                        $selected = ($value == setting()->get('App.table_header_style')) ? ' selected="selected"' : "";
                        echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                    endforeach;
                    ?>
                </select>
            </div>






            <div class="mb-3">
                <label for="date_format" class="control-label">Formato Fecha</label>
                <select name="date_format[]" class="select2" data-placeholder="Select an option" style="width:100%;">
                    <option></option>
                    <?php
                    $date_format_values = array(
                        '1' => '25/06/2014',
                        '2' => '25-06-2014',
                        '3' => '25.06.2014',
                        '4' => '25 Jun 2014',
                        '5' => '25 Junio 2014',
                        '6' => 'Mar 25 Jun 2014',
                        '7' => 'Martes 25 Junio 2014',
                        '8' => 'March 25, 2020 - 12:00 am'
                    );

                    foreach ($date_format_values as $value => $display_text) :
                        $selected = ($value == setting()->get('App.date_format')) ? ' selected="selected"' : "";
                        echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                    endforeach;
                    ?>
                </select>
            </div>



            <div class="mb-3">
                <label for="number_format" class="control-label">Formato De Nuemros</label>
                <select name="number_format[]" class="select2" data-placeholder="Select an option" style="width:100%;">
                    <option></option>
                    <?php
                    $number_format_values = array(
                        '1' => '1,000,000.00',
                        '2' => '1,000,000',
                        '3' => '1.000.000',
                        '4' => '1.000.000,00',
                    );

                    foreach ($number_format_values as $value => $display_text) {
                        $selected = ($value == setting()->get('App.number_format')) ? ' selected="selected"' :
                            "";

                        echo '<option value="' . $value . '" ' . $selected . '>' . $display_text . '</option>';
                    }
                    ?>
                </select>

            </div>


            <div class="mb-3">
                <label for="button_id_3" class="form-label"></label>
                <button type="submit" class="btn btn-primary" name="button_id_3" id="button_id_3">Guardar
                    Ajustes</button>
            </div>



        </form>








    </div>
</div>



<div class="card">
    <div class="card-header">Ajustes</div>
    <div class="card-body">
        <form method="post" action="<?= base_url('admin/settings/upload') ?>" enctype="multipart/form-data">
            <div class="mb-3">
                <div class="form-group">
                    <label>Logo</label>
                    <input type="file" name="file" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-danger">Upload</button>
            </div>
        </form>
    </div>
</div>


<?= $this->endSection() ?>
<!-- /.content -->


<!-- page script -->
<?= $this->section("pageScript") ?>

<?= $this->endSection() ?>