import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  const CustomScaffold({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/img.png"), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
