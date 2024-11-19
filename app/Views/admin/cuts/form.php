<form id="form" accept-charset="utf-8">
    <div class="row">
        <div class="col">
            <div class="mb-3">
                <label for="machine_id">Operador</label>
                <select name="machine_id" class="select2" style="width:100%;">
                    <?php foreach ($data_machines as $machines => $machine) : ?>
                    <option value="<?= $machine['id'] ?>"
                        <?= !empty($data_cuts['machine_id']) && $data_cuts['machine_id'] == $machine['id'] ? 'selected' : '' ?>>
                        <?= $machine['name_machine'] ?></option>
                    <?php endforeach ?>
                </select>
            </div>
        </div>
        <div class="col">
            <div class="mb-3">
                <label for="customer_id">Cliente</label>
                <select name="customer_id" class="select2" style="width:100%;">
                    <?php foreach ($data_customers as $customers => $customer) : ?>
                    <option value="<?= $customer['id'] ?>"
                        <?= !empty($data_cuts['customer_id']) && $data_cuts['customer_id'] == $customer['id'] ? 'selected' : '' ?>>
                        <?= $customer['first_name'] . ' ' . $customer['last_name'] . ' : ' . $customer['ic'] ?></option>
                    <?php endforeach ?>
                </select>
            </div>
        </div>






        <div class='row'>
            <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                <table class="table table-bordered table-hover" id="table_auto">
                    <thead>
                        <tr>
                            <th width="2%"><input id="check_all" class="formcontrol" type="checkbox" /></th>
                            <th width="15%">Codigo</th>
                            <th width="38%">Nombre</th>
                            <th width="15%">Precio</th>
                            <th width="15%">Cantidad</th>
                            <th width="15%">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($action == 'new') : ?>
                        <tr>
                            <td><input class="case" type="checkbox" /></td>
                            <td><input type="text" data-type="item_code" name="productcode[]" id="itemNo_1"
                                    class="form-control autocomplete_txt" autocomplete="off"></td>
                            <td><input type="text" data-type="item_name" name="items[]" id="itemName_1"
                                    class="form-control autocomplete_txt" autocomplete="off"></td>
                            <td><input type="number" name="price[]" id="price_1" class="form-control changesNo"
                                    autocomplete="off" onkeypress="return IsNumeric(event);" ondrop="return false;"
                                    onpaste="return false;"></td>
                            <td><input type="number" name="qty[]" id="quantity_1" class="form-control changesNo"
                                    autocomplete="off" onkeypress="return IsNumeric(event);" ondrop="return false;"
                                    onpaste="return false;"></td>
                            <td><input type="number" name="total[]" id="total_1" class="form-control totalLinePrice"
                                    autocomplete="off" onkeypress="return IsNumeric(event);" ondrop="return false;"
                                    onpaste="return false;"></td>
                            <input type="hidden" id="category_1" name="category[]">
                        </tr>


                        <?php else : ?>
                        <?php
                            $productcode = json_decode($data_cuts['productcode']);
                            $items       = json_decode($data_cuts['items']);
                            $qty         = json_decode($data_cuts['qty']);
                            $price       = json_decode($data_cuts['price']);
                            $total       = json_decode($data_cuts['total']);
                            $category       = json_decode($data_cuts['category']);




                            $counter = 0;
                            for ($i = 0; $i < count($items); $i++) :
                                $counter++;
                            ?>

                        <tr>
                            <td><input class="case" type="checkbox" /></td>
                            <td><input type="text" data-type="item_code" name="productcode[]"
                                    id="itemNo_<?= $counter; ?>" class="form-control autocomplete_txt"
                                    autocomplete="off" value="<?= $productcode[$i]; ?>"></td>

                            <td><input type="text" data-type="item_name" name="items[]" id="itemName_<?= $counter; ?>"
                                    class="form-control autocomplete_txt" autocomplete="off" value="<?= $items[$i]; ?>">
                            </td>


                            <td><input type="number" name="price[]" id="price_<?= $counter; ?>"
                                    class="form-control changesNo" autocomplete="off"
                                    onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;"
                                    value="<?= $price[$i]; ?>"></td>



                            <td><input type="number" name="qty[]" id="quantity_<?= $counter; ?>"
                                    class="form-control changesNo" autocomplete="off"
                                    onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;"
                                    value="<?= $qty[$i]; ?>"></td>



                            <td><input type="number" name="total[]" id="total_<?= $counter; ?>"
                                    class="form-control totalLinePrice" autocomplete="off"
                                    onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;"
                                    value="<?= $total[$i]; ?>"></td>

                            <input type="hidden" name="category[]" id="category_<?= $counter; ?>"
                                value="<?= $category[$i]; ?>">








                        </tr>
                        <?php endfor; ?>
                        <input type="hidden" value="1" id="hide">



                        <?php endif ?>

                    </tbody>

                </table>
            </div>
        </div>

        <div class='row'>
            <div class='col-8'>
                <button class="btn btn-danger delete" type="button">- Eliminar</button>
                <button class="btn btn-success addmore" type="button">+ Agregar</button>
            </div>
            <div class='col-4'>

                <div class="form-group">
                    <label>Subtotal: &nbsp;</label>
                    <div class="input-group">
                        <span class="input-group-text" id="basic-addon1">$</span>
                        <input type="number" class="form-control" id="subTotal" placeholder="Subtotal"
                            onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;">
                    </div>
                </div>
                <!-- <div class="form-group">
                    <label>Tax: &nbsp;</label>
                    <div class="input-group">
                        <div class="input-group-addon">$</div>
                        <input type="number" class="form-control" id="tax" placeholder="Tax"
                            onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;">
                    </div>
                </div> -->
                <!-- <div class="form-group">
                    <label>Tax Amount: &nbsp;</label>
                    <div class="input-group">
                        <input type="number" class="form-control" id="taxAmount" placeholder="Tax"
                            onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;">
                        <div class="input-group-addon">%</div>
                    </div>
                </div> -->
                <div class="form-group">
                    <label>Total: &nbsp;</label>
                    <div class="input-group">
                        <span class="input-group-text" id="basic-addon1">$</span>
                        <input type="number" class="form-control" id="totalAftertax" placeholder="Total"
                            onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;">
                    </div>
                </div>
                <!-- <div class="form-group">
                    <label>Amount Paid: &nbsp;</label>
                    <div class="input-group">
                        <div class="input-group-addon">$</div>
                        <input type="number" class="form-control" id="amountPaid" placeholder="Amount Paid"
                            onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;">
                    </div>
                </div> -->
                <div class="form-group">
                    <label>Monto Adeudado: &nbsp;</label>
                    <div class="input-group">
                        <span class="input-group-text" id="basic-addon1">$</span>
                        <input type="number" class="form-control amountDue" id="amountDue" placeholder="Amount Due"
                            onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;">
                    </div>
                </div>

            </div>
        </div>
        <br>








        <div class="mb-3">
            <label for="express">Corte expres</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="express1" name="express" value="si"
                    <?= !empty($data_cuts['express']) && $data_cuts['express'] == 'si' ? 'checked' : '' ?> />
                <label class="form-check-label" for="express1">SI</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="express2" name="express" value="no"
                    <?= !empty($data_cuts['express']) && $data_cuts['express'] == 'no' ? 'checked' : '' ?> />
                <label class="form-check-label" for="express2">NO</label>
            </div>
        </div>





        <div class="mb-3">
            <label for="total_days">Total Dias</label>
            <input type="text" name="total_days"
                value="<?= !empty($data_cuts['total_days']) ? $data_cuts['total_days'] : '' ?>" class="form-control" />
        </div>





        <div class="col-6">
            <div class="mb-3">
                <label for="qty_boards">Cantidad Laminas</label>
                <input type="text" name="qty_boards"
                    value="<?= !empty($data_cuts['qty_boards']) ? $data_cuts['qty_boards'] : '' ?>"
                    class="form-control" />
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="qty_perforations">Cantidad de perforaciones</label>
                <input type="text" name="qty_perforations"
                    value="<?= !empty($data_cuts['qty_perforations']) ? $data_cuts['qty_perforations'] : '' ?>"
                    class="form-control" />
            </div>
        </div>


        <div class="col-6">
            <div class="mb-3">
                <label for="quantity_cuts">Cantidad Cortes</label>
                <input type="text" name="quantity_cuts"
                    value="<?= !empty($data_cuts['quantity_cuts']) ? $data_cuts['quantity_cuts'] : '' ?>"
                    class="form-control" />
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="total_meters_edge">Total Metros de canto</label>
                <input type="text" name="total_meters_edge"
                    value="<?= !empty($data_cuts['total_meters_edge']) ? $data_cuts['total_meters_edge'] : '' ?>"
                    class="form-control" />
            </div>
        </div>



        <div class="mb-3">
            <label for="stiff_edge">Canto Rigido</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="stiff_edge1" name="stiff_edge" value="no"
                    <?= !empty($data_cuts['stiff_edge']) && $data_cuts['stiff_edge'] == 'no' ? 'checked' : '' ?> />
                <label class="form-check-label" for="stiff_edge1">No</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="stiff_edge2" name="stiff_edge" value="si"
                    <?= !empty($data_cuts['stiff_edge']) && $data_cuts['stiff_edge'] == 'si' ? 'checked' : '' ?> />
                <label class="form-check-label" for="stiff_edge2">Si</label>
            </div>
        </div>


        <div class="mb-3">
            <label for="notes">Notas</label>
            <textarea name="notes"
                class="form-control"><?= !empty($data_cuts['notes']) ? $data_cuts['notes'] : '' ?></textarea>
        </div>

    </div>




    <div class="form-group">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>


<script type="text/javascript">
$(document).ready(function() {

    $('.select2').select2({
        theme: 'bootstrap-5',
        dropdownParent: $('.modal-form')

    });

    //adds extra table rows
    var i = $('#table_auto tr').length;
    $(".addmore").on('click', function() {
        html = '<tr>';
        html += '<td><input class="case" type="checkbox"/></td>';
        html += '<td><input type="text" data-type="item_code" name="productcode[]" id="itemNo_' + i +
            '" class="form-control autocomplete_txt" autocomplete="off"></td>';
        html += '<td><input type="text" data-type="item_name" name="items[]" id="itemName_' + i +
            '" class="form-control autocomplete_txt" autocomplete="off"></td>';
        html += '<td><input type="text" name="price[]" id="price_' + i +
            '" class="form-control changesNo" autocomplete="off" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;"></td>';
        html += '<td><input type="text" name="qty[]" id="quantity_' + i +
            '" class="form-control changesNo" autocomplete="off" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;"></td>';
        html += '<td><input type="text" name="total[]" id="total_' + i +
            '" class="form-control totalLinePrice" autocomplete="off" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;"></td>';

        html += '<input type="hidden" name="category[]" id="category_' + i +
            '"';
        html += '</tr>';
        $('#table_auto').append(html);
        i++;
    });

    //to check all checkboxes
    $(document).on('change', '#check_all', function() {
        $('input[class=case]:checkbox').prop("checked", $(this).is(':checked'));
    });

    //deletes the selected table rows
    $(".delete").on('click', function() {
        $('.case:checkbox:checked').parents("tr").remove();
        $('#check_all').prop("checked", false);
        calculateTotal();
    });

    //autocomplete script
    $(document).on('focus', '.autocomplete_txt', function() {
        type = $(this).data('type');

        if (type == 'item_code') autoTypeNo = 0;
        if (type == 'item_name') autoTypeNo = 1;

        $(this).autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: '<?= base_url('admin/items/productListAjax'); ?>',
                    dataType: "json",
                    method: 'post',
                    data: {
                        name_startsWith: request.term,
                        type: type
                    },
                    success: function(data) {
                        response($.map(data, function(item) {
                            var code = item.split("|");
                            return {
                                label: code[autoTypeNo],
                                value: code[autoTypeNo],
                                data: item
                            }
                        }));
                    }
                });
            },
            autoFocus: true,
            minLength: 0,
            appendTo: ".modal-form",
            select: function(event, ui) {
                var names = ui.item.data.split("|");
                id_arr = $(this).attr('id');
                id = id_arr.split("_");
                console.log(names, id);

                $('#itemNo_' + id[1]).val(names[0]);
                $('#itemName_' + id[1]).val(names[1]);
                $('#quantity_' + id[1]).val(1);
                $('#price_' + id[1]).val(names[2]);
                $('#total_' + id[1]).val(1 * names[2]);
                $('#category_' + id[1]).val(names[3]);
                calculateTotal();
            }
        });
    });

    //price change
    $(document).on('change keyup blur', '.changesNo', function() {
        id_arr = $(this).attr('id');
        id = id_arr.split("_");
        quantity = $('#quantity_' + id[1]).val();
        price = $('#price_' + id[1]).val();
        if (quantity != '' && price != '') $('#total_' + id[1]).val((parseFloat(price) * parseFloat(
            quantity)).toFixed(2));
        calculateTotal();
    });

    $(document).on('change keyup blur', '#tax', function() {
        calculateTotal();
    });

    //total price calculation 
    function calculateTotal() {
        subTotal = 0;
        total = 0;
        $('.totalLinePrice').each(function() {
            if ($(this).val() != '') subTotal += parseFloat($(this).val());
        });
        $('#subTotal').val(subTotal.toFixed(2));
        tax = $('#tax').val();
        if (tax != '' && typeof(tax) != "undefined") {
            taxAmount = subTotal * (parseFloat(tax) / 100);
            $('#taxAmount').val(taxAmount.toFixed(2));
            total = subTotal + taxAmount;
        } else {
            $('#taxAmount').val(0);
            total = subTotal;
        }
        $('#totalAftertax').val(total.toFixed(2));
        calculateAmountDue();
    }

    $(document).on('change keyup blur', '#amountPaid', function() {
        calculateAmountDue();
    });

    //due amount calculation
    function calculateAmountDue() {
        amountPaid = $('#amountPaid').val();
        total = $('#totalAftertax').val();
        if (amountPaid != '' && typeof(amountPaid) != "undefined") {
            amountDue = parseFloat(total) - parseFloat(amountPaid);
            $('.amountDue').val(amountDue.toFixed(2));
        } else {
            total = parseFloat(total).toFixed(2);
            $('.amountDue').val(total);
        }
    }


    //It restrict the non-numbers
    var specialKeys = new Array();
    specialKeys.push(8, 46); //Backspace
    function IsNumeric(e) {
        var keyCode = e.which ? e.which : e.keyCode;
        console.log(keyCode);
        var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
        return ret;
    }
});
</script>


<?php if ($action == 'edit') : ?>
<script type='text/javascript'>
$(document).ready(function() {

    $("#items_1").autocomplete({
        source: function(request, response) {
            // Fetch data
            $.ajax({
                url: "<?= base_url('admin/items/productListAjax'); ?>",
                type: 'post',
                dataType: "json",
                data: {
                    search: request.term
                },
                success: function(data) {
                    response(data);
                }
            });
        },
        select: function(event, ui) {
            // Set selection
            $('#items_1').val(ui.item.label); // display the selected text
            $('#item_code_1').val(ui.item.value2); // save selected id to input
            return false;
        },
        focus: function(event, ui) {
            $("#items_1").val(ui.item.label);
            $("#item_code_1").val(ui.item.value2);
            return false;
        },
    });

});
</script>
<?php endif; ?>