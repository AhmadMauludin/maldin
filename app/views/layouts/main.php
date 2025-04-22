<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
    <meta name="author" content="AdminKit">
    <meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="shortcut icon" href="<?= base_url('img/icons/icon-48x48.png'); ?>" />

    <title><?= $title; ?></title>

    <link href="<?= base_url('assets/css/app.css'); ?>" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>

    <!-- Memanggil id pegguna dari seeion yang nantinya disimpan pada variabel $idu yang nantinya digunakan pada bagian yang dibutuhkan -->
    <?php $idu = session('id'); // Menyimpan ID user dari sesi ke variabel $idu 
    ?>

    <div class="wrapper">
        <nav id="sidebar" class="sidebar js-sidebar">
            <div class="sidebar-content js-simplebar">
                <a class="sidebar-brand" href="#">
                    <span class="align-middle">ToDoList, <?= session()->get('nama') ?></span>
                </a>
                <ul class="sidebar-nav">

                    <!-- Menu navigasi disisipkan dari view terpisah -->
                    <?= view('layouts/menu') ?>
                </ul>

            </div>
        </nav>

        <div class="main">
            <main class="content">
                <div class="container-fluid p-0">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <!-- Section konten diisi oleh bagian konten yang akan dirender -->
                                    <?= $this->renderSection('content'); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <footer class="footer">
                <div class="container-fluid">
                    <div class="row text-muted">
                        <div class="col-6 text-start">
                            <p class="mb-0">
                                <strong>Todo List</strong> &copy;
                            </p>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="<?= base_url('js/app.js'); ?>"></script>
</body>

</html>