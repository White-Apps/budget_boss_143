import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnbItOnddd extends StatelessWidget {
  const OnbItOnddd({
    super.key,
    required this.imageOn,
    required this.titleOn,
    required this.decOn,
  });
  final String imageOn;
  final String titleOn;
  final String decOn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/onnbds.png',
              width: MediaQuery.of(context).size.width,
              height: 440.h,
              alignment: Alignment.bottomCenter,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Center(
                child: Image.asset(
                  imageOn,
                  width: 200.w,
                  height: 200.h,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color(0xffD063FF),
                        Color(0xff1780F5),
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    titleOn,
                    style: TextStyle(
                      fontSize: 32.h,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.1.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              FittedBox(
                child: Text(
                  decOn,
                  style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.3.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
