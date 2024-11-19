<style>
    @page {
        margin: 0;
    }

    * {
        padding: 0;
        margin: 0;
    }

    @font-face {
        font-family: "source_sans_proregular";
        src: local("Source Sans Pro"), url("fonts/sourcesans/sourcesanspro-regular-webfont.ttf") format("truetype");
        font-weight: normal;
        font-style: normal;

    }

    body {
        font-family: "source_sans_proregular", Calibri, Candara, Segoe, Segoe UI, Optima, Arial, sans-serif;
    }

    #inventory-invoice {
        padding: 5px;
    }

    #inventory-invoice a {
        text-decoration: none ! important;
    }

    .invoice {
        position: relative;
        background-color: #FFF;
        min-height: 680px;
        padding: 15px
    }

    .invoice header {
        padding: 5px 0;
        margin-bottom: 20px;
        border-bottom: 1px solid #3989c6
    }

    .invoice .company-details {
        text-align: right
    }

    .invoice .company-details .name {
        margin-top: 0;
        margin-bottom: 0
    }

    .invoice .contacts {
        margin-bottom: 20px
    }

    .invoice .invoice-to {
        text-align: left
    }

    .invoice .invoice-to .to {
        margin-top: 0;
        margin-bottom: 0
    }

    .invoice .invoice-details {
        text-align: right
    }

    .invoice .invoice-details .invoice-id {
        margin-top: 0;
        color: #3989c6
    }

    .invoice main {
        padding-bottom: 20px
    }

    .invoice main .thanks {
        margin-top: -100px;
        font-size: 12px;
        margin-bottom: 20px
    }

    .invoice main .notices {
        padding-left: 6px;
        border-left: 6px solid #3989c6
    }

    .invoice main .notices .notice {
        font-size: 12px
    }

    .invoice table {
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
        margin-bottom: 20px
    }

    .invoice table td,
    .invoice table th {
        padding: 5px;
        background: #eee;
        border-bottom: 1px solid #fff
    }

    .invoice table th {
        white-space: nowrap;
        font-weight: 400;
        font-size: 12px;
        border: 1px solid #fff;
    }

    .invoice table td {
        border: 1px solid #fff;
    }

    .invoice table td h3 {
        margin: 0;
        font-weight: 400;
        color: #3989c6;
        font-size: 12px
    }

    .invoice table .tax,
    .invoice table .total,
    .invoice table .unit {
        text-align: right;
        font-size: 12px
    }

    .invoice table .no {
        color: #fff;
        font-size: 12px;
        background: #17a2b8
    }

    .invoice table .unit {
        background: #ddd
    }

    .invoice table .total {
        background: #17a2b8;
        color: #fff
    }

    .invoice table tfoot td {
        background: 0 0;
        border-bottom: none;
        white-space: nowrap;
        text-align: right;
        padding: 8px 10px;
        font-size: 11px;
        border-top: 1px solid #aaa
    }

    .invoice table tfoot tr:first-child td {
        border-top: none
    }

    .invoice table tfoot tr:last-child td {
        color: #3989c6;
        font-size: 11px;
        border-top: 1px solid #3989c6
    }

    .invoice table tfoot tr td:first-child {
        border: none
    }

    .invoice footer {
        width: 100%;
        text-align: center;
        color: #777;
        border-top: 1px solid #aaa;
        padding: 8px 0
    }

    @media print {
        .invoice {
            font-size: 11px !important;
            overflow: hidden !important
        }

        .invoice footer {
            position: absolute;
            bottom: 10px;
            page-break-after: always
        }

        .invoice>div:last-child {
            page-break-before: always
        }
    }
</style>



<div id="inventory-invoice">
    <div class="invoice overflow-auto">
        <div style="min-width: 500px">
            <header>
                <div class="row">
                    <div class="col">
                        <a target="_blank" href="#">
                            <img src="<?= base_url('uploads/logo/' . setting('App.file')) ?>" width="200" alt="">
                        </a>
                    </div>
                    <div class="col company-details">
                        <h2 class="name"><?= setting('App.siteName') ?>
                        </h2>
                        <div><?= setting('App.address') ?></div>
                        <div><?= setting('App.phone') ?></div>
                        <div><?= setting('App.email') ?></div>
                    </div>
                </div>
            </header>
            <main>
                <div class="row contacts">
                    <div class="col invoice-to">
                        <div class="text-gray-light">Presupuesto para:</div>
                        <h4 class="to"><?= $estimate['Cm_fname'] . ' ' . $estimate['Cm_lname'] ?></h4>
                        <div class="address"><?= $estimate['address'] ?>, <?= $estimate['city'] ?></div>
                        <div class="email"><?= $estimate['email'] ?>
                        </div>
                    </div>
                    <div class="col invoice-details">
                        <h3 class="invoice-id">Presupuesto - <?= $estimate['id'] ?></h3>
                        <div class="date">Creado el: <?= $estimate['registered_on'] ?></div>
                        <div class="date">Valido hasta: <?= $estimate['expiry_date'] ?></div>
                    </div>
                </div>
                <table border="0" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th class="text-left">Producto</th>
                            <th class="text-right">Cantidad</th>
                            <th class="text-right">Precio</th>
                            <th class="text-right">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $productcode = json_decode($estimate['productcode']);
                        $items       = json_decode($estimate['items']);
                        $qty         = json_decode($estimate['qty']);
                        $price       = json_decode($estimate['price']);
                        $total       = json_decode($estimate['total']);
                        $category    = json_decode($estimate['category']);




                        $counter = 0;
                        for ($i = 0; $i < count($items); $i++) :
                        ?>
                            <tr>
                                <td class="no"><?= $productcode[$i]; ?></td>
                                <td class="text-left"><?= $items[$i]; ?></td>
                                <td class="qty"><?= $qty[$i] ?></td>
                                <td class="unit"><?= $price[$i]; ?></td>
                                <td class="total"><?= $total[$i] ?></td>
                            </tr>
                            <?php $counter += $total[$i]; ?>
                        <?php endfor; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2"></td>
                            <td colspan="2">SUBTOTAL</td>
                            <td><?= monies_format($counter); ?></td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                            <td colspan="2">TAX 25%</td>
                            <td>$1,300.00</td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                            <td colspan="2">GRAND TOTAL</td>
                            <td>$6,500.00</td>
                        </tr>
                    </tfoot>
                </table>
            </main>
        </div>
    </div>
</div>