import 'package:flutter/material.dart';

class FormPemesananPage extends StatefulWidget {
  const FormPemesananPage({super.key});

  @override
  State<FormPemesananPage> createState() =>
      _FormPemesananPageState();
}

class _FormPemesananPageState
    extends State<FormPemesananPage> {
  final TextEditingController namaController =
      TextEditingController();

  final TextEditingController addressController =
      TextEditingController();

  String metodePembayaran = 'Tunai';
  bool setuju = false;

  @override
  void dispose() {
    namaController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void kirimPesanan() {
    if (!setuju) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Silakan setujui pembelian terlebih dahulu',
          ),
        ),
      );
      return;
    }

    if (namaController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Nama dan alamat wajib diisi',
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pesanan berhasil dikirim'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pemesanan'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informasi Pembeli',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Pembeli',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: addressController,
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                labelText: 'Alamat Pengiriman',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.streetview),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Metode Pengiriman',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<String>(
              title: const Text('Diantar'),
              value: 'Diantar',
              groupValue: metodePembayaran,
              onChanged: (value) {
                setState(() {
                  metodePembayaran = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Ambil di Tempat'),
              value: 'Ambil di Tempat',
              groupValue: metodePembayaran,
              onChanged: (value) {
                setState(() {
                  metodePembayaran = value!;
                });
              },
            ),

            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Saya menyetujui pembelian ini',
              ),
              value: setuju,
              onChanged: (value) {
                setState(() {
                  setuju = value ?? false;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading,
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: kirimPesanan,
                child: const Text('Pesan'),
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}