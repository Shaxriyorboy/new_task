import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_task/common/router/route_name.dart';
import 'package:new_task/common/styles/text_style.dart';


import '../../../common/local/app_storage.dart';
import '../../../common/localization/words.dart';
import '../../../common/styles/colors.dart';
import '../view_model/profile_vm.dart';


class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    ref.watch(profile);
    return CupertinoPageScaffold(
      backgroundColor: AppColors.nF3F4F6,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Профиль'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 120.h,),
          SvgPicture.asset("assets/icons/user.svg"),
          SizedBox(height: 20.h,),
          Text(ref.read(profile).name??"",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600,fontSize: FontSize.size24),),
          SizedBox(height: 8.h,),
          Text(ref.read(profile).email??"",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400,fontSize: FontSize.size16,color: AppColors.n929292),),
          SizedBox(height: 25.h,),
          GestureDetector(
            onTap: ()async{
              await AppStorage().removeToken();
              await Navigator.of(context,rootNavigator: true).pushReplacementNamed(AppRouteName.LOGIN_PAGE,arguments: true);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 55,
              width: 1.sw,
              color: AppColors.white,
              child: Text("Выйти",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400,fontSize: FontSize.size16,color: AppColors.cEC3A4D),),
            ),
          ),
        ],
      ),
    );
  }
}
