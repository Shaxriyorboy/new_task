import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../common/local/app_storage.dart';
import '../../../common/localization/words.dart';
import '../../../common/styles/colors.dart';
import '../view_model/favorites_vm.dart';


class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {

  @override
  Widget build(BuildContext context) {
    ref.watch(favorites);
    return const CupertinoPageScaffold(
      backgroundColor: AppColors.nF3F4F6,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Избранные'),
      ),
      child: Center(
        child: Text("Страница Избранные"),
      ),
    );
  }
}
