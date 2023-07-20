import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final map = ChangeNotifierProvider.autoDispose((ref) => MapVM());

class MapVM extends ChangeNotifier{

  @override
  void dispose() {
    super.dispose();
  }
}