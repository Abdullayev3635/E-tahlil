import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/profile/presentation/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 19.w, right: 19.w, top: 20.h),
            height: 124.h,
            decoration: BoxDecoration(
                color: cFirstColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(cRadius22.r),
                    bottomRight: Radius.circular(cRadius22.r))),
            child: Center(
              child: SizedBox(
                child: Text("Фойдаланувчи маълумоти",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: cWhiteColor,
                        fontFamily: 'Medium')),
                width: 300.w,
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            "Қўқон шаҳар 1-сектор раҳбари",
            style: TextStyle(
                color: cGrayColor2, fontSize: 14.sp, fontFamily: 'Medium'),
          ),
          Text(
            "Абдуллаев Оллоёр",
            style: TextStyle(
                color: cGrayColor4, fontSize: 24.sp, fontFamily: 'Medium'),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            "+99893 213-36-35",
            style: TextStyle(
                color: cFirstColor, fontSize: 16.sp, fontFamily: 'Medium'),
          ),
          SizedBox(
            height: 24.h,
          ),
          SvgPicture.asset(
            "assets/icons/person.svg",
            width: 153.w,
            height: 153.h,
          ),
          SizedBox(
            height: 24.h,
          ),
          Card(
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                infoWidget(
                  "46",
                  "Вилоятдаги барча секторлар ичида",
                  "2",
                  "Туман (Шаҳар)нинг 4 та сектори ичида",
                  cFirstColor,
                  cFirstColor,
                ),
                SizedBox(
                  height: 25.h,
                ),
                infoWidget("235", "Вилоятдаги барча секторлар ичида", "3",
                    "Сектор котиби кўриб чиқмоқда", cYellowColor, cYellowColor),
                SizedBox(
                  height: 25.h,
                ),
                infoWidget("45", "Режа графиги бўйича жами", "36",
                    "Бажарилиши керак бўлган ишлар", cYellowColor, cRedColor),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 21.w),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cRadius22.r),
            ),
          ),
        ],
      ),
    );
  }
}
