<style type="text/css">
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

.text-left {
    font-size: 12px;
}

.text-right {
    font-size: 12px;
}

.address {
    font-size: 13px;
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
    font-size: 12px;
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

<div class="container">
    <div class="card">
        <div class="card-body">
            <div id="invoice">
                <div class="invoice overflow-auto">
                    <div style="min-width: 600px">
                        <header>
                            <div class="row">
                                <div class="col">
                                    <img src="<?= base_url('uploads/logo/' . setting('App.file')) ?>" width="200"
                                        alt="">
                                </div>
                                <div class="col company-details">
                                    <h3 class="name"><?= setting('App.siteName') ?>
                                    </h3>
                                    <div><?= setting('App.address') ?></div>
                                    <div><?= setting('App.phone') ?></div>
                                    <div><?= setting('App.email') ?></div>
                                </div>
                            </div>
                        </header>
                        <main>
                            <div class="row contacts">
                                <div class="col invoice-to">
                                    <div class="text-gray-light">Recibo para:</div>
                                    <h5 class="to">
                                        <?= ucwords(strtolower($installments['Cm_fname'])) . ' ' . ucwords(strtolower($installments['Cm_lname'])) ?>
                                    </h5>
                                    <div class="address">CI: <?= $installments['ic'] ?></div>
                                    <div class="address">Direccion: <?= strtolower($installments['address']) ?></div>
                                    <div class="address">Email: <?= strtolower($installments['email']) ?>
                                    </div>
                                </div>
                                <div class="col invoice-details">
                                    <h3 class="invoice-id">Abono #<?= $installments['id'] ?></h3>
                                    <div class="date">Fecha de recibo: <?= $installments['created_at'] ?></div>
                                    <div class="date">Hora: <?= $installments['time'] ?></div>
                                </div>
                            </div>
                            <table>
                                <thead>
                                    <tr>
                                        <th>#CORTE</th>
                                        <th class="text-left">DESCRIPTION</th>
                                        <th class="text-right">TIPO</th>
                                        <th class="text-right"></th>
                                        <th colspan="2" class="text-right" width="20px">TOTAL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="no"><?= $installments['cod_cut'] ?></td>
                                        <td class="text-left">
                                            <p><?= $installments['description'] ?></p>

                                        </td>
                                        <td class="unit"><?= $installments['type'] ?></td>
                                        <td class="unit"></td>
                                        <td colspan="2" class="total"><?= monies_format($installments['amount']) ?></td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2">SUBTOTAL</td>
                                        <td><?= monies_format($installments['amount']) ?></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2">NETO TOTAL</td>
                                        <td><?= monies_format($installments['amount']) ?></td>
                                    </tr>
                                    <br><br>
                                </tfoot>
                            </table>
                            <div class="thanks">Recibi: <?= num2letras($installments['amount']) ?></div>
                            <div class="notices">
                                <div>NOTA:</div>
                                <div class="notice">Este recibo es una constancia de que se hizo un abono, mas no es un
                                    documento de valor.</div>
                            </div>
                        </main>
                        <footer>Invoice was created on a computer and is valid without the signature and seal.
                        </footer>
                    </div>

                    <div></div>
                </div>
            </div>
        </div>
    </div>
</div>