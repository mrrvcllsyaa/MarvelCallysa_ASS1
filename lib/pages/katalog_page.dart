import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../models/produk.dart';
import '../providers/favorit_provider.dart';
import '../cubit/keranjang_cubit.dart';
import 'form_pemesanan_page.dart';

class KatalogPage extends StatefulWidget {
  const KatalogPage({super.key});

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  // Jumlah pembelian setiap produk.
  late List<int> jumlahPembelian;

  @override
  void initState() {
    super.initState();

    // Jumlah awal setiap produk adalah 1.
    jumlahPembelian = List<int>.filled(
      daftarProduk.length,
      1,
    );
  }

  String formatRupiah(int harga) {
    return 'Rp${harga.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'),
      (match) => '${match[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...List.generate(daftarProduk.length, (index) {
            final produk = daftarProduk[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 14),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produk.nama,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(formatRupiah(produk.harga)),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        IconButton(
                          onPressed: () { //mengurangi jumlah pembelian produk saat tombol (-) ditekan, tetapi jumlahnya tidak boleh kurang dari 1.
                            if (jumlahPembelian[index] > 1) {
                              setState(() {
                                jumlahPembelian[index]--;
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.remove_circle_outline,
                          ),
                        ),

                        Text(
                          '${jumlahPembelian[index]}',
                          style: const TextStyle(fontSize: 18),
                        ),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              jumlahPembelian[index]++;
                            });
                          },
                          icon: const Icon(
                            Icons.add_circle_outline,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      'Subtotal: ${formatRupiah(
                        produk.harga * jumlahPembelian[index],
                      )}',
                    ),

                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            for (
                              int i = 0;
                              i < jumlahPembelian[index];
                              i++
                            ) {
                              context
                                  .read<BelanjaCubit>()
                                  .tambahKeranjang();
                            }

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Produk ditambahkan ke keranjang',
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text('Tambah ke Keranjang'),
                        ),

                        OutlinedButton.icon(
                          onPressed: () {
                            context
                                .read<FavoritProvider>()
                                .tambahFavorit();

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Produk ditambahkan ke favorit',
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.favorite_border),
                          label: const Text('Tambah Favorit'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),

          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FormPemesananPage(),
                ),
              );
            },
            child: const Text('Lanjut ke Pemesanan'),
          ),

          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}