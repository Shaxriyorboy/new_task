import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_task/common/router/route_name.dart';
import 'package:new_task/common/styles/colors.dart';
import 'package:new_task/common/styles/text_style.dart';
import 'package:new_task/feature/login/view_model/login_vm.dart';

import '../../../utils/custom_snackbar.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ref.watch(login);
    return CupertinoPageScaffold(
      backgroundColor: AppColors.nF3F4F6,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Авторизация'),
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                color: AppColors.white,
                height: 123.h,
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CupertinoTextField(
                      controller: ref.read(login).emailController,
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.none),
                      ),
                      placeholder: "Логин или почта",
                      placeholderStyle: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(
                              color: AppColors.cC3C3C3,
                              fontSize: FontSize.size16,
                              fontWeight: FontWeight.w400),
                    ),
                    Divider(
                      color: AppColors.nE0E6ED,
                      height: 1.h,
                    ),
                    CupertinoTextField(
                      controller: ref.read(login).passwordController,
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.none),
                      ),
                      placeholder: "Пароль",
                      placeholderStyle: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(
                              color: AppColors.cC3C3C3,
                              fontSize: FontSize.size16,
                              fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 64,
              width: 1.sw,
              child: CupertinoButton(
                color: AppColors.c12154C,
                child:!ref.read(login).isLoading? const Text("Войти"):const CupertinoActivityIndicator(color: AppColors.white,),
                onPressed: () {
                  ref.read(login).login().then((value) {
                    if (value) {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRouteName.HOME_PAGE);
                    }else{
                    }
                  });
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 64,
              width: 1.sw,
              child: CupertinoButton(
                color: AppColors.c12154C,
                child: Text("Зарегистрироваться"),
                onPressed: () {
                  showSnackBar(message: "Эта функция будет добавлена в ближайшее время");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
