import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorit_provider.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk Favorit'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Consumer<FavoritProvider>(
          builder: (context, favorit, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 70,
                ),

                const SizedBox(height: 16),

                const Text(
                  'Jumlah Produk Favorit',
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 8),

                Text(
                  '${favorit.jumlahFavorit}',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    favorit.tambahFavorit();
                  },
                  child: const Text('Tambah Favorit'),
                ),

                const SizedBox(height: 8),

                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}