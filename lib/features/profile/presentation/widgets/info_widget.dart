import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget infoWidget(String mainText, String secondText, String mainText2,
    String secondText2, Color color, Color color2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainText,
            style:
                TextStyle(color: color, fontFamily: 'Medium', fontSize: 32.sp),
          ),
          SizedBox(
            width: 101.w,
            child: Text(secondText,
                style: TextStyle(
                    color: color, fontFamily: 'Medium', fontSize: 10.sp)),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainText2,
            style:
                TextStyle(color: color2, fontFamily: 'Medium', fontSize: 32.sp),
          ),
          SizedBox(
            width: 101.w,
            child: Text(secondText2,
                style: TextStyle(
                    color: color2, fontFamily: 'Medium', fontSize: 10.sp)),
          ),
        ],
      ),
    ],
  );
}
