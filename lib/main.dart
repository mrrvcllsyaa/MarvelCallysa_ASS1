import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'providers/favorit_provider.dart';
import 'cubit/keranjang_cubit.dart';
import 'pages/beranda_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoritProvider(),
        ),
      ],
      child: BlocProvider(
        create: (_) => BelanjaCubit(),
        child: const GreenShopApp(),
      ),
    ),
  );
}

class GreenShopApp extends StatelessWidget {
  const GreenShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoMart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const BerandaPage(),
    );
  }
}