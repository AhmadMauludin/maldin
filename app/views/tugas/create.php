<!-- Extend layout utama -->
<?= $this->extend('layouts/main'); ?>

<!-- Mulai section 'content' untuk ditampilkan di layout -->
<?= $this->section('content'); ?>

<!-- Form input tugas baru -->
<form action="<?= site_url('tugas/store') ?>" method="post" enctype="multipart/form-data">
    <!-- Input tersembunyi untuk menyimpan ID user yang login -->
    <input name="iduser" type="hidden" value="<?= session()->get('id') ?>" required />
    <div class="card">
        <div class="card-header">
            <h5 class="card-title mb-0">Input Tugas Baru</h5>
        </div>
        <div class="card-body">
            <label class="form-label">Tugas</label>
            <input name="tugas" type="text" class="form-control" placeholder="Masukan tugas">
        </div>
        <div class="card-body">
            <label class="form-label">Tanggal</label>
            <input name="tanggal" type="date" class="form-control" placeholder="Masukan Tanggal">
        </div>
        <div class="card-body">
            <label class="form-label">Waktu</label>
            <input name="waktu" type="time" class="form-control" placeholder="Masukan Waktu">
        </div>
        <div class="card-body">
            <label class="form-label">Status</label>
            <select class="form-control" name="status" id="status">
                <option value="To do">To do</option>
                <option value="Berjalan">Berjalan</option>
                <option value="Selesai">Selesai</option>
                <option value="Batal">Batal</option>
            </select>
        </div>
        <div class="card-body">
            <label class="form-label">Foto</label>
            <input name="foto" type="file" class="form-control" placeholder="Masukan Foto">
        </div>
        <!-- Tombol navigasi dan submit -->
        <div class="card-body">
            <a href="<?= base_url('tugas'); ?>"><button class="btn btn-secondary">Kembali</button></a>
            <button type="submit" class="btn btn-success">Tambah Tugas</button>
        </div>
    </div>

</form>
<!-- Akhiri section 'content' -->
<?= $this->endSection(); ?>