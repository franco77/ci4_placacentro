<?= $this->extend("admin/layout/master") ?>

<?= $this->section("content") ?>

<?php if (session()->getFlashdata('message')) : ?>
<?= session()->getFlashdata('message') ?>
<?php endif; ?>





<!-- Small boxes (Stat box) -->
<div class="row">
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-info text-white">
            <div class="inner">
                <h3><?= $total_customers ?></h3>

                <p>Clientes</p>
            </div>
            <div class="icon">
                <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">Mas Info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-success">
            <div class="inner">
                <h3><?= $total_cuts; ?></h3>

                <p>Cortes</p>
            </div>
            <div class="icon">
                <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-warning">
            <div class="inner">
                <h3><?= $total_items ?></h3>

                <p>Productos registrados</p>
            </div>
            <div class="icon">
                <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-danger">
            <div class="inner">
                <h3>65</h3>

                <p>Unique Visitors</p>
            </div>
            <div class="icon">
                <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <!-- ./col -->
</div>






<div class="row">
    <div class="col-4">
        <div class="card">
            <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                    <h3 class="card-title">Cantidad de cortes por maquina</h3>
                </div>
            </div>
            <div class="card-body">

                <div id="grafico_div"></div>



            </div>
        </div>
    </div>

    <div class="col-8">
        <div class="card">
            <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                    <h3 class="card-title">Las 4 laminas mas vendidas</h3>
                </div>
            </div>
            <div class="card-body">

                <div id="GoogleBarChart" style="height: 400px; width: 100%"></div>



            </div>
        </div>
    </div>
</div>






<?= $this->endSection() ?>
<!-- /.content -->


<!-- page script -->
<?= $this->section("pageScript") ?>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {
    'packages': ['corechart', 'bar']
});

google.charts.setOnLoadCallback(drawBarChart);


// Bar Chart
google.charts.setOnLoadCallback(showBarChart);

function drawBarChart() {
    var data = google.visualization.arrayToDataTable([
        ['Producto', 'Total Ventas'],
        <?php
            foreach ($products as $row) {
                echo "['" . $row['producto'] . "'," . $row['total'] . "],";
            }
            ?>
    ]);
    var options = {
        title: ' Graficos de productos barra de ventas inteligente',
        is3D: true,
    };
    var chart = new google.visualization.BarChart(document.getElementById('GoogleBarChart'));
    chart.draw(data, options);
}
</script>




<script>
//carrega pacote dos gráficos basicos
google.charts.load('current', {
    'packages': ['corechart']
});

//definimos a funcao de desenhar como callback do carregamento do pacote
google.charts.setOnLoadCallback(draws_graph);

//funcao que configura e desenha grafico
function draws_graph() {

    //cria dataTable com os dados
    var dados = new google.visualization.DataTable();
    dados.addColumn('string', 'Escolaridade');
    dados.addColumn('number', 'Cortes');
    dados.addRows([
        <?php
            foreach ($cuts as $row) {
                echo "['" . $row['machine'] . "'," . $row['total'] . "],";
            }
            ?>
    ]);



    //configurações do grafico
    var opcoes = {
        'title': 'Cantidad de Cortes Por maquina',

    };

    //define grafico como gráfico de pizza a ser incluido no elemento de id grafico_div
    var grafico = new google.visualization.ColumnChart(document.getElementById('grafico_div'));

    //desenha gráfico com dados e configuraçoes definidas
    grafico.draw(dados, opcoes);
}

window.addEventListener('resize', draws_graph);
</script>


<?= $this->endSection() ?>