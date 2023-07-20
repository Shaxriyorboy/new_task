import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_task/common/local/app_storage.dart';
import 'package:new_task/data/entities/login_response.dart';
import 'package:new_task/data/repository/app_repository_impl.dart';

import '../../../utils/custom_snackbar.dart';

final login = ChangeNotifierProvider.autoDispose((ref) => LoginVM());

class LoginVM extends ChangeNotifier{
  final AppRepositoryImpl _repositoryImpl = AppRepositoryImpl();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<bool> login()async{
    try{
      isLoading = true;
      notifyListeners();
      final result = await _repositoryImpl.login(email: emailController.text.trim(),password: passwordController.text.trim());
      if(result is LoginResponse){
        AppStorage().setToken(result.tokens?.accessToken??"");
      }
      isLoading = false;
      notifyListeners();
      return true;
    }catch(e){
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}