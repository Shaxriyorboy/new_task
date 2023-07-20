import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_task/data/entities/login_response.dart';
import 'package:new_task/data/repository/app_repository_impl.dart';

final profile = ChangeNotifierProvider.autoDispose((ref) => ProfileVM());

class ProfileVM extends ChangeNotifier{
  final AppRepositoryImpl _repositoryImpl = AppRepositoryImpl();
  String? name;
  String? email;
  bool isLoading = false;

  ProfileVM(){
    getProfile();
  }

  Future<void> getProfile()async{
    try{
      isLoading = true;
      final result = await _repositoryImpl.getProfile();
      if(result is User){
        name = result.nickname;
        email = result.email;
      }
      isLoading = false;
      notifyListeners();
    }catch(e){
      isLoading = false;
      notifyListeners();
      debugPrint(e.toString());
    }
 }

  @override
  void dispose() {
    super.dispose();
  }
}