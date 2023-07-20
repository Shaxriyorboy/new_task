import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final home = ChangeNotifierProvider.autoDispose((ref) => HomeVM());

class HomeVM extends ChangeNotifier{
  int activeIndex = 0;

  void changeIndex(int index){
    activeIndex = index;
    notifyListeners();
  }
  @override
  void dispose() {
    super.dispose();
  }
}