import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../common/local/app_storage.dart';
import '../../../common/localization/words.dart';
import '../../../common/styles/colors.dart';
import '../view_model/map_vm.dart';


class MapPage extends ConsumerStatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {

  @override
  Widget build(BuildContext context) {
    ref.watch(map);
    return const CupertinoPageScaffold(
      backgroundColor: AppColors.nF3F4F6,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Карта'),
      ),
      child: Center(
        child: Text("Страница Карта"),
      ),
    );
  }
}
