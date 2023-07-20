import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../common/local/app_storage.dart';
import '../../../common/localization/words.dart';
import '../../../common/styles/colors.dart';
import '../view_model/tape_vm.dart';


class TapePage extends ConsumerStatefulWidget {
  const TapePage({Key? key}) : super(key: key);

  @override
  ConsumerState<TapePage> createState() => _TapePageState();
}

class _TapePageState extends ConsumerState<TapePage> {

  @override
  Widget build(BuildContext context) {
    ref.watch(tape);
    return const CupertinoPageScaffold(
      backgroundColor: AppColors.nF3F4F6,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Лента'),
      ),
      child: Center(
        child: Text("Страница ленты"),
      ),
    );
  }
}
