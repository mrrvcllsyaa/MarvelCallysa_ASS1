import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/keranjang_cubit.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: BlocBuilder<BelanjaCubit, int>(
          builder: (context, jumlahBarang) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 70,
                  color: Colors.green,
                ),

                const SizedBox(height: 16),

                const Text(
                  'Jumlah Barang dalam Keranjang',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 8),

                Text(
                  '$jumlahBarang',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        context
                            .read<BelanjaCubit>()
                            .kurangiBarang();
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                      ),
                    ),

                    const SizedBox(width: 16),

                    IconButton(
                      onPressed: () {
                        context
                            .read<BelanjaCubit>()
                            .tambahKeranjang();
                      },
                      icon: const Icon(
                        Icons.add_circle,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

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