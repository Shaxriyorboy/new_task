import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tape = ChangeNotifierProvider.autoDispose((ref) => TapeVM());

class TapeVM extends ChangeNotifier{

  @override
  void dispose() {
    super.dispose();
  }
}