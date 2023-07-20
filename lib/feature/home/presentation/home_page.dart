import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_task/common/styles/colors.dart';
import 'package:new_task/feature/favorites/presentation/favorites_page.dart';
import 'package:new_task/feature/map/presentation/map_page.dart';
import 'package:new_task/feature/profile/presentation/profile_page.dart';


import '../../../common/local/app_storage.dart';
import '../../../common/localization/words.dart';
import '../../tape/presentation/tape_page.dart';
import '../view_model/home_vm.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<Widget> data = [TapePage(),MapPage(),FavoritesPage(),ProfilePage()];

  @override
  Widget build(BuildContext context) {
    ref.watch(home);
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: (index){
          ref.read(home).changeIndex(index);
        },
        activeColor: AppColors.c12154C,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/icon_1.svg",color: ref.read(home).activeIndex == 0?AppColors.c12154C:AppColors.black,), label: 'Лента'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/icon_4.svg",color: ref.read(home).activeIndex == 1?AppColors.c12154C:AppColors.black,), label: 'Карта'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/icon_3.svg",color: ref.read(home).activeIndex == 2?AppColors.c12154C:AppColors.black,), label: 'Избранные'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/icon_2.svg",color: ref.read(home).activeIndex == 3?AppColors.c12154C:AppColors.black,), label: 'Профиль'),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            return data[index];
          }
        );
      },

    );
  }
}
