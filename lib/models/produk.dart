class Produk {
  final String nama;
  final int harga;

  const Produk({
    required this.nama,
    required this.harga,
  });
}

const List<Produk> daftarProduk = [
  Produk(
    nama: 'Pupuk Kompos Organik',
    harga: 15000,
  ),
  Produk(
    nama: 'Pot Tanaman Daur Ulang',
    harga: 25000,
  ),
  Produk(
    nama: 'Tas Kemasan Daur Ulang',
    harga: 35000,
  ),
];