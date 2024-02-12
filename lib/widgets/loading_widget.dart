import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  final int? ht;
  final int? wd;
  const LoadingWidget(this.ht, this.wd, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ht!.h,
      width: wd!.w,
      child: Center(
        child: Image.asset('assets/images/loading.gif'),
      ),
    );
  }
}