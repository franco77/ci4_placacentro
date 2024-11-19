<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="<?= base_url('asset/js/jquery-3.6.0.min.js') ?>"></script>
<!-- Bootstrap 5 with Popper.js-->
<script src="<?= base_url('asset/js/bootstrap.bundle.min.js') ?>"></script>
<!-- overlayScrollbars -->
<script src="<?= base_url('asset/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') ?>"></script>
<!-- AdminLTE App -->
<script src=" <?= base_url('asset/js/adminlte.min.js') ?>"></script>


<!-- Page Global Script -->
<!-- Toggle Button -->
<script src="<?= base_url('asset/js/bootstrap4-toggle.min.js') ?>"></script>

<!-- SweetAlert2 -->
<script src="<?= base_url('asset/js/sweetalert2.all.min.js') ?>"></script>
<!-- jquery-validation -->
<script src="<?= base_url('asset/js/jquery.validate.min.js') ?>"></script>




<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<!-- Select2 -->


<!-- DataTables Full Function -->
<script src="<?= base_url("asset/plugins/datatables/DataTables-1.11.3/js/jquery.dataTables.min.js"); ?>"
    type="text/javascript"></script>
<script src="<?= base_url("asset/plugins/datatables/DataTables-1.11.3/js/dataTables.bootstrap5.min.js"); ?>"
    type="text/javascript"></script>
<script src="<?= base_url("asset/plugins/datatables/Buttons-2.0.1/js/dataTables.buttons.min.js"); ?>"
    type="text/javascript"></script>
<script src="<?= base_url("asset/plugins/datatables/JSZip-2.5.0/jszip.min.js"); ?>" type="text/javascript"></script>
<script src="<?= base_url("asset/plugins/datatables/Buttons-2.0.1/js/buttons.print.min.js"); ?>" type="text/javascript">
</script>
<script src="<?= base_url("asset/plugins/datatables/Buttons-2.0.1/js/buttons.html5.min.js"); ?>" type="text/javascript">
</script>
<script src="<?= base_url("asset/plugins/datatables/Responsive-2.2.9/js/dataTables.responsive.min.js"); ?>"
    type="text/javascript"></script>
<script src="<?= base_url("asset/plugins/datatables/Responsive-2.2.9/js/responsive.bootstrap5.min.js"); ?>"
    type="text/javascript"></script>




<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>





<link rel="stylesheet" href="<?= base_url('asset/plugins/jasny-bootstrap-v4/css/jasny-bootstrap.css') ?>">
<script src="<?= base_url('asset/plugins/jasny-bootstrap-v4/js/jasny-bootstrap.js'); ?>" type="text/javascript">
</script>

<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment.min.js"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js">
</script>




<script>
$(document).ready(function() {
    $('.select2').select2({
        theme: 'bootstrap-5'
    });
});
</script>

<script>
$(document).ready(function() {
    $("#alert").hide();
    $("#alert").fadeTo(2000, 1000).slideUp(1000, function() {
        $("#alert").slideUp(1000);
    });
});
</script>