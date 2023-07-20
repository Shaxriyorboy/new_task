import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'common/local/app_storage.dart';
import 'common/styles/colors.dart';
List<String> testDeviceIds = ['1A31A5295BE0CE11DC5C985ED7763D8E'];

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getStorageValues();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.black,
  ));
}

String token = "";

Future<void> getStorageValues() async {
  token = await AppStorage().getToken();
}

