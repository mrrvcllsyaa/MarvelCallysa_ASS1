import 'package:flutter/material.dart';

class FavoritProvider extends ChangeNotifier {
  int jumlahFavorit = 0;

  void tambahFavorit() {
    jumlahFavorit++;
    notifyListeners();
  }
}