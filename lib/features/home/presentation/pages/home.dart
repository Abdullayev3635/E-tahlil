import 'package:etahlil/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: Column(
        children: [
          Container(
            height: 306.h,
            decoration: BoxDecoration(
                color: cFirstColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(cRadius22.r),
                    bottomRight: Radius.circular(cRadius22.r))),
            child: Column(
              children: [
                SizedBox(
                  height: 56.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 75.w),
                  child: Text(
                    "Ёшлар сиёсати, ижтимоий ривожлантириш ва маънавий-маърифий ишлар бўйича",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: cWhiteColor,
                        fontFamily: 'Regular',
                        fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextField(
                            textAlign: TextAlign.start,
                            autofocus: false,
                            controller: search,
                            decoration: InputDecoration(
                              hintText: "Қидирув",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: cBackColorIcon,
                                  fontSize: 12.sp,
                                  fontFamily: 'Medium'),
                              suffixIcon: SvgPicture.asset(
                                "assets/icons/search_icon.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: cSecondColor,
                              borderRadius: BorderRadius.circular(cRadius16.r)),
                        ),
                        flex: 5,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(cRadius16.r),
                              color: cSecondColor),
                          child: SvgPicture.asset(
                            "assets/icons/lounch_icon.svg",
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
