import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favorites = ChangeNotifierProvider.autoDispose((ref) => FavoritesVM());

class FavoritesVM extends ChangeNotifier{

  @override
  void dispose() {
    super.dispose();
  }
}