<?= $this->extend("admin/layout/master") ?>

<?= $this->section("content") ?>

<style>
.page-people-directory .nav-contacts {
    margin-bottom: 20px;
}

.page-people-directory .nav-contacts li a {
    color: #666;
    font-weight: 400;
    font-size: 13px;
}

.page-people-directory .nav-contacts li .badge {
    background: none;
    font-weight: 500;
    color: #333;
}

.page-people-directory .nav-contacts li.active .badge {
    color: #fff;
    background: none;
}

.page-people-directory .people-group .media img {
    width: 45px;
}

.page-people-directory .people-group .list-group-item {
    -moz-transition: all 0.2s ease-out 0s;
    -webkit-transition: all 0.2s ease-out 0s;
    transition: all 0.2s ease-out 0s;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    margin: 0;
    border-width: 0;
}

.page-people-directory .people-group .media-heading {
    margin-top: 5px;
}

.page-people-directory .people-group .media-heading,
.page-people-directory .people-group .media-body {
    line-height: normal;
}

.page-people-directory .pagination-contact {
    margin-top: -3px;
}

.page-people-directory .contact-group {
    margin-top: 20px;
}

.page-people-directory .contact-group .media img {
    width: 80px;
}



.page-people-directory .contact-group .media-heading {
    font-size: 16px;
    font-weight: 500;
}

.page-people-directory .contact-group .media-heading small {
    margin-left: 5px;
    font-size: 13px;
    font-weight: 400;
    color: #999;
}

.page-people-directory .contact-group .list-group-item {
    border: 1px solid #e3e3e3;
    margin-top: 10px;
    -webkit-box-shadow: 3px 3px 5px -1px rgba(153, 153, 153, 1);
    -moz-box-shadow: 3px 3px 5px -1px rgba(153, 153, 153, 1);
    box-shadow: 3px 3px 5px -1px rgba(153, 153, 153, 1);
}

.page-people-directory .contact-group .list-group-item:hover {
    background-color: #fcfcfc;
}

.page-people-directory .contact-group .media-content {
    margin-top: 5px;
}

.page-people-directory .contact-group .fa:before {
    font-size: 20px;
    color: gray;
}

.page-people-directory .contact-group .media-content ul {
    margin-top: 15px;
    margin-bottom: 0;
}

.page-people-directory .contact-group .media-content ul>li {
    display: inline-block;
    min-width: 200px;
    margin-bottom: 5px;
}

.page-people-directory .well {
    border-radius: 0px;
    border: none;
}

.page-people-directory .list-group-item:first-child {
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
}

.page-people-directory .page-title {
    text-transform: uppercase;
}

.page-people-directory .btn-add-new-contact {
    float: right;
}

@media (max-width: 992px) {
    .page-people-directory .btn-add-new-contact {
        float: left;
    }
}



/* ============================================================
CONTACT MODAL VIEW
============================================================ */
.page-people-directory .modal-pull-right .modal-dialog {
    max-width: 720px;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body {
    width: 100%;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .modal-close h4 {
    padding-left: 15px;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .col-md-12 {
    padding: 0px;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header {
    width: 100%;
    height: 280px;
    text-align: center;
    overflow: inherit;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    border-bottom: 5px solid gray;
    filter: grayscale(100%);
    -webkit-filter: grayscale(100%);
    -moz-filter: grayscale(100%);
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header:hover {
    filter: grayscale(0%);
    -webkit-filter: grayscale(0%);
    -moz-filter: grayscale(0%);
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header .profile-image-container {
    margin-top: 211px;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header .profile-image-container img {
    border: 5px solid gray;
    border-radius: 60%;
    -moz-border-radius: 60%;
    -webkit-border-radius: 60%;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header .contact-info {
    width: 100%;
    position: absolute;
    margin-top: 120px;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header .contact-info .contact-name {
    font-weight: bold;
    color: #fff;
    font-size: 30px;
    text-align: center;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header .contact-info .contact-skills ul {
    list-style: none;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header .contact-info .contact-skills ul li {
    display: block;
    width: 60px;
}

.page-people-directory .modal-pull-right .modal-dialog .dialog-close {
    width: 100%;
    position: absolute;
    margin-top: 20px;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header .dialog-close li {
    cursor: pointer;
    color: white;
    text-align: right;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header .dialog-close li span.fa {
    font-size: 35px;
    font-weight: bold;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-header .dialog-close li span.fa:hover {
    color: gray;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-view-content .contact-view-action {
    margin-right: 15px;
    margin-top: 15px;
}

.page-people-directory .modal-pull-right .modal-dialog .modal-body .contact-view-content .contact-view-info {
    margin-top: 15px;
}

.page-people-directory .contact-info-container {
    height: 250px;
    margin-top: 80px;
    position: absolute;
    width: 100%;
}

.page-people-directory .contact-add-content {
    padding: 40px;
}

.page-people-directory .close-right-modal {
    cursor: pointer;
}

.page-people-directory .close-right-modal:hover {
    opacity: .8;
}

.page-people-directory .basic-info-scroll {
    height: 425px;
    overflow-x: hidden;
}


.circulo {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    background: #e48d00;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    margin-left: 15px;
    padding: 3%
}

.circulo>h2 {
    font-family: sans-serif;
    color: #e7e7e7;
    font-size: 25px;
    font-weight: bold;
}


@media (max-width: 800px) {
    .page-people-directory .contact-top-bar {
        text-align: left;
        width: 100%;
    }

    .page-people-directory .contact-top-bar .btn-add-new-contact {
        margin-bottom: 10px;
        display: block;
    }

    .page-people-directory .contact-top-bar .txt-search-contact {
        margin-bottom: -5px;
    }
}
</style>

<div class="col-md-12">
    <div class="page-people-directory">


        <div class="list-group contact-group">

            <div class="row">
                <?php foreach ($providers as $pro) : ?>
                <div class="col-md-4">
                    <div class="list-group">
                        <div class="list-group-item">
                            <div class="media">
                                <?php $word = substr($pro['contact_name'], 0, 1); ?>
                                <div class="circulo mb-3">
                                    <h2><?= $word; ?></h2>
                                </div>
                                <div class="media-body ms-3">
                                    <h4 class="media-heading mb-2"><?= $pro['contact_name'] ?> - <small
                                            class="text-muted">
                                            <?= $pro['company'] ?></small>
                                        <br>
                                        <hr>
                                        <?= $pro['contact_title'] ?>
                                        <hr>
                                    </h4>
                                    <p class="mb-2"><i class="fas fa-map-marker me-2"></i> <?= $pro['address'] ?>.
                                        <?= $pro['city'] ?>, <?= $pro['country'] ?></p>
                                    <ul class="list-unstyled">
                                        <li class="mb-1"><i class="fas fa-envelope me-2"></i> <?= $pro['email'] ?></li>
                                        <li class="mb-1"><i class=" fas fa-mobile me-2"></i> <?= $pro['phone'] ?></li>
                                        <li class="mb-1"><i class=" fas fa-envelope me-2"></i> <?= $pro['website'] ?>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <?php endforeach; ?>
            </div>



        </div>
    </div>
</div>


<?= $this->endSection() ?>
<!-- /.content -->

<!-- / Incluir la libreria toastr  -->
<!-- page script -->
<?= $this->section("pageScript") ?>

<?= $this->endSection() ?>