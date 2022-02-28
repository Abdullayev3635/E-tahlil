import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/lock/presentation/pages/lock_page.dart';
import 'package:etahlil/features/navigation/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var maskFormatter = MaskTextInputFormatter(mask: '#   #   #   #');
  TextEditingController code = TextEditingController();
  bool onError = false;
  String txtMain =
      "Ушбу +99833 213-36-35 рақамга 4 рақамдан иборат  маҳфий код юборилди илтимос кодни киритинг!";

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 82.5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(
                "assets/icons/svgtahlil.svg",
                color: cFirstColor,
                width: 196.w,
                height: 33.h,
              ),
              SizedBox(
                height: 68.h,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.h),
                child: Text(
                  txtMain,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: onError ? cRedColor : cFirstColor,
                      fontFamily: "Regular"),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(cRadius16.r),
                  color: cWhiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: onError ? cRedColor : cFirstColor,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                height: 70.h,
                padding: EdgeInsets.fromLTRB(15.w, 2.h, 5.w, 0.h),
                child: Center(
                  child: TextFormField(
                    inputFormatters: [maskFormatter],
                    keyboardType: TextInputType.number,
                    cursorColor: cFirstColor,
                    controller: code,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "─  ─  ─  ─",
                      hintStyle: TextStyle(
                          fontSize: 18.sp,
                          color: cGrayColor,
                          fontFamily: "Regular"),
                    ),
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: onError ? cRedColor : cFirstColor,
                        fontFamily: "Regular"),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => PasswordScreen.screen()),
                  );
                },
                child: Text(
                  'Давом этиш',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'Regular',
                  ),
                ),
                color: cFirstColor,
                elevation: 0,
                minWidth: 274.w,
                height: 70.h,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cRadius16.r)),
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/corp.svg",
                    height: 10.h,
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Вилоят электрон ҳокимиятни \n ривожлантириш маркази",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: "Medium",
                            color: cGrayColor),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "v: " + version,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: "Medium",
                            color: cGrayColor),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 28.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
