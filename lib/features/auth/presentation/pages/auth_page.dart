import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/core/widgets/costum_toast.dart';
import 'package:etahlil/di/dependency_injection.dart';
import 'package:etahlil/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:etahlil/features/navigation/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthPage extends StatefulWidget {
  final String tel;

  const AuthPage(this.tel, {Key? key}) : super(key: key);

  static Widget screen(String tel) => BlocProvider(
        create: (context) => di<AuthBloc>(),
        child: AuthPage(tel),
      );

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var maskFormatter = MaskTextInputFormatter(mask: '#   #   #   #');
  TextEditingController code = TextEditingController();

  late AuthBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<AuthBloc>(context);

    super.initState();
  }

  @override
  void dispose() {
    code.dispose();
    _bloc.close();
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
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthNoInternet) {
              CustomToast.showToast(
                  "Интернет билан алоқа йўқ илтимос алоқани текширинг!");
            } else if (state is AuthFailure) {
              CustomToast.showToast("Маълумотлар юкланишда хатолик юз берди!");
            }
            if (state is AuthSuccess) {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const BottomNavigationPage()),
                );
              });
            }
            if (state is AuthError) {
              return Column(
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
                    width: 274.w,
                    margin: EdgeInsets.only(bottom: 16.h),
                    child: Text(
                      "Юборилган код нотўғри илтимос қайтадан харакат қилинг",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: cRedColor,
                          fontFamily: "Regular"),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: 274.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(cRadius16.r),
                      color: cWhiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: cRedColor,
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
                            color: cRedColor,
                            fontFamily: "Regular"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  MaterialButton(
                    onPressed: () {
                      _bloc.add(SendSMSEvent(
                          maskFormatter.getUnmaskedText(), widget.tel));
                    },
                    child: _widget1(state),
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
                            "Вилоят электрон ҳокимиятни ривожлантириш маркази",
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
              );
            } else {
              return Column(
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
                    width: 274.w,
                    margin: EdgeInsets.only(bottom: 16.h),
                    child: Text(
                      "Ушбу " +
                          widget.tel +
                          " рақамга 4 рақамдан иборат  маҳфий код юборилди илтимос кодни киритинг!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: cFirstColor,
                          fontFamily: "Regular"),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: 274.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(cRadius16.r),
                      color: cWhiteColor,
                      boxShadow: const [
                        BoxShadow(
                          color: cFirstColor,
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
                            color: cFirstColor,
                            fontFamily: "Regular"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  MaterialButton(
                    onPressed: () {
                      _bloc.add(SendSMSEvent(
                          maskFormatter.getUnmaskedText(), widget.tel));
                    },
                    child: _widget1(state),
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
                            "Вилоят электрон ҳокимиятни ривожлантириш маркази",
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
              );
            }
          },
        ),
      ),
    );
  }

  Widget _widget1(state) {
    if (state is AuthLoading) {
      return const CupertinoActivityIndicator();
    } else {
      return Text(
        'Давом этиш',
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: 'Regular',
        ),
      );
    }
  }
}
