import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var maskFormatter = MaskTextInputFormatter(mask: '(##) ###-##-##');
  TextEditingController tel = TextEditingController();
  bool onError = false;

  @override
  void dispose() {
    tel.dispose();
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
          margin: EdgeInsets.symmetric(horizontal: 35.w),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(cRadius16.r),
                  color: cWhiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: onError ? cRedColor : cFirstColor,
                        spreadRadius: 1),
                  ],
                ),
                height: 70.h,
                padding: EdgeInsets.fromLTRB(15.w, 2.h, 5.w, 0.h),
                child: Center(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/call.svg',
                        width: 24.w,
                        height: 24.h,
                        color: cFirstColor,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        '+998',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: cGrayColor,
                            fontFamily: "Regular"),
                      ),
                      Expanded(
                        child: TextFormField(
                          inputFormatters: [maskFormatter],
                          keyboardType: TextInputType.phone,
                          cursorColor: cFirstColor,
                          controller: tel,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "(--)--- -- --",
                            hintStyle: TextStyle(
                                fontSize: 18.sp,
                                color: cGrayColor,
                                fontFamily: "Regular"),
                            prefixIconConstraints: BoxConstraints(
                              maxWidth: 30.w,
                              maxHeight: 30.h,
                              minHeight: 25.h,
                              minWidth: 25.w,
                            ),
                          ),
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: onError ? cRedColor : cFirstColor,
                              fontFamily: "Regular"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Visibility(
                visible: onError,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  child: Text(
                    "Бундай фойдаланувчи рўйхатдан ўтмаган! Дастурдан фойдаланиш учун администратор билан боғланинг!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: cRedColor,
                        fontFamily: "Regular"),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  onError = true;
                  setState(() {});
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
                minWidth: 360.w,
                height: 70.h,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cRadius16.r)),
              ),
              SizedBox(
                height: 16.h,
              ),
              Visibility(
                visible: onError,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const AuthPage()),
                    );
                  },
                  child: Text(
                    'Админстратор билан боғланиш',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Regular',
                        color: cBlackColor),
                  ),
                  color: cBackButtonColor,
                  elevation: 0,
                  minWidth: 360.w,
                  height: 70.h,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cRadius16.r)),
                ),
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
                        "Вилоят электрон ҳокимиятни ривожлантириш маркази",
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
