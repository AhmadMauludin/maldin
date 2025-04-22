<?= $this->extend('layouts/main'); ?>
<!-- if this line is still there, it means I just copy paste my friend's UKK application -->

<?= $this->section('content'); ?>

<div class="card flex-fill">
    <div class="card-header">
        <h5 class="card-title mb-0"><?= $title; ?></h5>
    </div>
    <table class="table table-hover my-0">
        <thead>
            <tr>
                <th>No</th>
                <th>Id</th>
                <th>Tugas</th>
                <th>Status</th>
                <th>Foto</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php $no = 1 + (5 * ($pager->getCurrentPage() - 1)); ?>
            <?php foreach ($tugas as $row): ?>
                <tr>
                    <td><?= $no ?></td>
                    <td><?= $row['id'] ?></td>
                    <td><?= $row['tugas'] ?></td>
                    <td><?= $row['status'] ?></td>
                    <td><img src="<?= base_url('uploads/tugas/' . $row['foto']) ?>" width="50"></td>
                    <td>
                        <a href="<?= site_url('tugas/edit/' . $row['id']) ?>">Edit</a>

                        <a href="<?= site_url('tugas/delete/' . $row['id']) ?>" onclick="return confirm('Hapus data?')">Hapus</a>
                    </td>
                </tr>
            <?php $no++;
            endforeach; ?>
        </tbody>
    </table>
</div>
<!-- Navigasi halaman (pagination) -->
<div style="margin-top: 10px;">
    <?= $pager->links(); ?>
</div>
<?= $this->endSection(); ?>