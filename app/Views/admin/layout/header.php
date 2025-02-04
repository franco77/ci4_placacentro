<!DOCTYPE html>
<!--<html dir="rtl" lang="ar">-->
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?= setting()->get('App.siteName') . '-' . esc($title) ?></title>
    <meta name="description" content="Garment Factory Process">
    <meta name="keyword" content="garment,factory,khonkaen,ocomshop">
    <meta name="author" content="ocomshop">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= csrf_meta() ?>

    <!-- Google Font: Thai Fonts -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="<?= base_url('asset/plugins/fontawesome-free/css/all.min.css') ?>">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="<?= base_url('asset/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') ?>">
    <!-- Theme style -->

    <link rel="stylesheet" href="<?= base_url('asset/css/adminlte.min.css') ?>">

    <link rel="stylesheet" href="<?= setting()->get('App.theme') ?>">
    <!-- SweetAlert2 Bootstrap or Dark -->
    <link rel="stylesheet" href="<?= base_url('asset/css/sweetalert2-dark.min.css') ?>">
    <!-- DataTables -->
    <link rel="stylesheet"
        href="<?= base_url('asset/plugins/datatables/DataTables-1.11.3/css/dataTables.bootstrap5.min.css'); ?>">
    <link rel="stylesheet"
        href="<?= base_url('asset/plugins/datatables/Responsive-2.2.9/css/responsive.bootstrap5.min.css'); ?>">



    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" />


    <link rel="stylesheet"
        href="<?= base_url('asset/plugins/datatables/StateRestore-1.1.1/css/stateRestore.bootstrap5.min.css') ?>">
    <!-- Dark style -->
    <?php if (setting()->get('App.theme') == 'dark') : ?>
    <link rel="stylesheet" href="<?= base_url('asset/css/dark/adminlte-dark-addon.min.css') ?>">
    <?php endif; ?>
    <style>
    .ui-autocomplete {
        max-height: 400px;
        overflow-y: auto;
        overflow-x: hidden;
        padding-right: 20px;
    }
    </style>

</head>