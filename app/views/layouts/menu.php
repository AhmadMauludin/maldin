<?php
// Mengambil ID user yang sedang login dari session
$idu = session('id');
?>

<!-- Menu navigasi dalam bentuk daftar tidak bernomor -->
<!-- Menu menuju halaman dashboard -->
<li>
    <a class="sidebar-link" href="<?= base_url('/dashboard') ?>">Dashboard</a>
</li>

<!-- Jika user yang login adalah admin -->
<?php if (session()->get('bagian') == "admin"): ?>
    <li>
        <a class="sidebar-link" href="<?= site_url('user/') ?>">User</a>
    </li>
<?php endif; ?>

<!-- Jika user yang login adalah user biasa -->
<?php if (session()->get('bagian') == "user"): ?>
    <li>
        <a class="sidebar-link" href="<?= site_url('tugas/create') ?>">Tugas Baru</a>
    </li>

    <li>
        <a class="sidebar-link" href="<?= site_url('tugas/index1') ?>">Tugas</a>
    </li>

    <li>
        <a class="sidebar-link" href="<?= site_url('/friendship') ?>">Friendship</a>
    </li>

<?php endif; ?>

<!-- Menu untuk melakukan backup database -->
<li>
    <a class="sidebar-link" href="<?= site_url('/backup') ?>">Backup DB</a>
</li>

<!-- Menu untuk mengatur profil user -->
<li>
    <a class="sidebar-link" href="<?= site_url('user/edit/' . $idu) ?>">Pengaturan</a>
</li>

<!-- Menu logout untuk keluar dari aplikasi -->
<li>
    <a class="sidebar-link" href="<?= site_url('/logout') ?>">Logout</a>
</li>
<!-- if this line is still there, it means I just copy paste my friend's UKK application -->