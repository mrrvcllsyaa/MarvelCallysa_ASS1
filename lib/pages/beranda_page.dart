import 'package:flutter/material.dart';

import 'katalog_page.dart';
import 'form_pemesanan_page.dart';
import 'favorit_page.dart';
import 'keranjang_page.dart';
import 'lokasi_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoMart-Produk Daur Ulang'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.eco,
                size: 90,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              const Text(
                'Selamat Datang di EcoMart',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Belanja produk ramah lingkungan bersama '
                'Komunitas Bank Sampah Hijau di Kota Bandung.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const KatalogPage(),
                      ),
                    );
                  },
                  child: const Text('Lihat Produk'),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FormPemesananPage(),
                      ),
                    );
                  },
                  child: const Text('Form Pemesanan'),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FavoritPage(),
                      ),
                    );
                  },
                  child: const Text('Favorit'),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const KeranjangPage(),
                      ),
                    );
                  },
                  child: const Text('Keranjang Belanja'),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LokasiPage(),
                      ),
                    );
                  },
                  child: const Text('Lokasi EcoMart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}