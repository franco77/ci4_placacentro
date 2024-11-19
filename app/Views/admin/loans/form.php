<form id="form" accept-charset="utf-8">

    <div class="mb-3">
        <label for="id_user" class="form-label">Empleado para prestamo</label>
        <select name="id_user" class="select2" style="width:100%;">
            <?php foreach ($data_user_data as $user_datas => $user_datum) : ?>
            <option value="<?= $user_datum['id'] ?>"
                <?= !empty($data_loans['id_user']) && $data_loans['id_user'] == $user_datum['id'] ? 'selected' : '' ?>>
                <?= $user_datum['first_name'] . ' ' . $user_datum['last_name'] ?></option>
            <?php endforeach ?>
        </select>
    </div>

    <div class="row">
        <div class="col">
            <div class="mb-3">
                <label for="loan_amount" class="form-label">Monto Prestamo</label>
                <input type="number" name="loan_amount" id="loan_amount"
                    value="<?= !empty($data_loans['loan_amount']) ? $data_loans['loan_amount'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="col">
            <div class="mb-3">
                <label for="total_installments" class="form-label">Cantidad Meses</label>
                <input type="number" name="total_installments" id="total_installments"
                    value="<?= !empty($data_loans['total_installments']) ? $data_loans['total_installments'] : '' ?>"
                    class="form-control" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-4">

            <label for="interests" class="form-label">Tasa Intereses (Anual)</label>
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">%</span>
                <input type="number" name="interests" id="interests"
                    value="<?= !empty($data_loans['interests']) ? $data_loans['interests'] : '' ?>"
                    class="form-control" />
            </div>
        </div>

        <div class="col-8">
            <div class="mb-3">
                <label for="fee_amount" class="form-label">Monto de las cuotas</label>
                <?php if ($action == 'edit') : ?>
                <input type="text" name="fee_amount" id="fee_amount"
                    value="<?= !empty($data_loans['fee_amount']) ? $data_loans['fee_amount'] : '' ?>"
                    class="form-control" />
                <?php else : ?>
                <input type="number" name="fee_amount" id="fee_amount" class="form-control" />
                <?php endif; ?>
            </div>
        </div>
    </div>


    <?php if ($action == 'edit') : ?>
    <div class="col">
        <div class="mb-3">
            <label for="status">Estatus del prestamo</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="status1" name="status" value="sin_pagar"
                    <?= !empty($data_orders['status']) && $data_orders['status'] == 'sin_pagar' ? 'checked' : '' ?> />
                <label class="form-check-label" for="status1">Sin pago</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="status2" name="status" value="pago"
                    <?= !empty($data_orders['status']) && $data_orders['status'] == 'pago' ? 'checked' : '' ?> />
                <label class="form-check-label" for="status1">Pago</label>
            </div>
        </div>
    </div>
    <?php endif; ?>


    <div class="row">
        <div class="col">
            <div class="mb-3">
                <label for="loan_date" class="form-label">Fecha del Prestamo</label>
                <input type="text" name="loan_date"
                    value="<?= !empty($data_loans['loan_date']) ? $data_loans['loan_date'] : '' ?>"
                    class="form-control datepicker" id="loan_date" />
            </div>
        </div>

        <div class="col">
            <div class="mb-3">
                <label for="loan_end_date" class="form-label">Fecha En Que Finaliza Préstamo</label>
                <input type="text" name="loan_end_date"
                    value="<?= !empty($data_loans['loan_end_date']) ? $data_loans['loan_end_date'] : '' ?>"
                    class="form-control datepicker" id="loan_end_date" />
            </div>
        </div>
    </div>

    <?php if ($action == 'new') : ?>
    <hr>
    <button type="button" class="btn btn-danger" id="calculate-button">Calcular</button>

    <div class="row">
        <div class="col-md-4">
            <hr>
            <div class="mb-3">
                <label for="principal-result" class="form-label">Monto a prestar</label>
                <input type="text" class="form-control" id="principal-result" value="">
            </div>
            <div class="mb-3">
                <label for="monthly-principal" class="form-label">Monto a pagar en cuotas</label>
                <input type="text" class="form-control" id="monthly-principal" value="">
            </div>
            <div class="mb-3">
                <label for="interest-result" class="form-label">Total a pagar de intereses</label>
                <input type="text" class="form-control" id="interest-result" value="">
            </div>

            <div class="mb-3">
                <label for="monthly-interest" class="form-label">Total Intereses Mensuales</label>
                <input type="text" class="form-control" id="monthly-interest" value="">
            </div>
            <hr>
            <div class="mb-3">
                <label for="total-result" class="form-label">Total</label>
                <input type="text" class="form-control" id="total-result" value="">
            </div>
        </div>
    </div>

    <?php endif;?>




    <div class="form-group">
        <button type="submit" class="btn btn-primary">Guardar</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <label for="error"></label>
    </div>
</form>



<script>
$("#calculate-button").click(function() {
    // get input values
    var loanAmount = parseFloat($("#loan_amount").val());
    var interestRate = parseFloat($("#interests").val()) / 100 /
        12; // convert percentage to monthly interest rate
    var loanDuration = parseInt($("#total_installments").val());

    // calculate monthly payment
    var monthlyPayment =
        (loanAmount * interestRate * Math.pow(1 + interestRate, loanDuration)) /
        (Math.pow(1 + interestRate, loanDuration) - 1);

    // calculate total payment and total interest
    var totalPayment = monthlyPayment * loanDuration;
    var totalInterest = totalPayment - loanAmount;

    // display results
    $("#principal-result").val(loanAmount.toFixed(2));
    $("#monthly-principal").val(
        "($ " + (loanAmount / loanDuration).toFixed(2) + " Mensuales)"
    );


    $("#interest-result").val(totalInterest.toFixed(2));
    $("#monthly-interest").val(
        "($ " + (totalInterest / loanDuration).toFixed(2) + " Mensuales)"
    );
    var totaltotalInterestMonth = (totalInterest / loanDuration).toFixed(2);
    $("#total-result").val(totalPayment.toFixed(2));

    var totaltotalInterestMonth = totalInterest / loanDuration;
    var totalAmountMonth = loanAmount / loanDuration;
    var fintotalMonth = totalAmountMonth + totaltotalInterestMonth;

    $("#fee_amount").val(fintotalMonth.toFixed(2));
});
</script>