import 'dart:convert';

import 'package:l/l.dart';
import 'package:new_task/data/entities/login_response.dart';

import '../../common/server/api/api.dart';
import '../../common/server/api/api_constants.dart';
import 'app_reposiotory.dart';

class AppRepositoryImpl implements AppRepository {

  @override
  Future<User?> getProfile() async {
    final response = await ApiService.get(
        ApiConst.getProfile, {});

    final user = User.fromJson(jsonDecode(response??""));
    return user;
  }

  @override
  Future<LoginResponse?> login({String? email, String? password}) async {
    final response = await ApiService.post(
        ApiConst.login,ApiParams.paramLogin(email: email,password: password)
    );

    final loginResponse = LoginResponse.fromJson(jsonDecode(response??""));
    return loginResponse;
  }


  @override
  Future<String?> deleteAccount() async {
    final response = await ApiService.delete(
      "ApiConst.deleteProfile",{}
    );

    l.d(response??"");

    return response;
  }
}
