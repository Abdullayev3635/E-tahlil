import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/di/dependency_injection.dart';
import 'package:etahlil/features/lock/domain/bloc/pass_bloc.dart';
import 'package:etahlil/features/lock/presentation/widgets/num_pad.dart';
import 'package:etahlil/features/navigation/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  static Widget screen() => BlocProvider(
        create: (context) => di<PassBloc>(),
        child: const PasswordScreen(),
      );

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  late PassBloc bloc;
  bool onError = false;

  @override
  void initState() {
    bloc = BlocProvider.of<PassBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  final TextEditingController _pinPutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: cFirstGradient),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/icons/svgtahlil.svg",
                  color: cWhiteColor,
                  width: 268.w,
                  height: 45.h,
                ),
                SizedBox(
                  height: 26.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50.w),
                  child: BlocBuilder<PassBloc, PassState>(
                    buildWhen: (_, state) {
                      if (state is PassSuccess) {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  const BottomNavigationPage()),
                        );
                      }
                      debugPrint(state.message);
                      return state is PassSuccess;
                    },
                    builder: (context, state) {
                      if (state is PassInitial) {
                        return Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cWhiteColor,
                              fontSize: 16.sp,
                              fontFamily: 'Regular'),
                        );
                      } else {
                        return Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cYellowColor,
                              fontSize: 16.sp,
                              fontFamily: 'Regular'),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  width: 114.w,
                  height: 20.h,
                  child: PinCodeTextField(
                    showCursor: false,
                    appContext: context,
                    controller: _pinPutController,
                    length: 4,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    obscuringWidget: Container(
                      height: 14.h,
                      width: 14.w,
                      decoration: BoxDecoration(
                        color: cWhiteColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    enableActiveFill: true,
                    enablePinAutofill: true,
                    pinTheme: PinTheme(
                      fieldHeight: 14.h,
                      fieldWidth: 14.w,
                      borderWidth: 0,
                      shape: PinCodeFieldShape.circle,
                      activeColor: cBackColorIcon,
                      inactiveColor: cBackColorIcon,
                      disabledColor: cBackColorIcon,
                      activeFillColor: cBackColorIcon,
                      selectedFillColor: cBackColorIcon,
                      inactiveFillColor: cBackColorIcon,
                      errorBorderColor: cBackColorIcon,
                    ),
                    onCompleted: (value) {
                      if (value.length == 4) {
                        bloc.add(PassCompileEvent(
                            passController: _pinPutController));
                      }
                    },
                    onChanged: (controllerPin) {},
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                numPad(_pinPutController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
