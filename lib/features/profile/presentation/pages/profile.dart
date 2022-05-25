import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/core/widgets/costum_toast.dart';
import 'package:etahlil/di/dependency_injection.dart';
import 'package:etahlil/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:etahlil/features/profile/presentation/widgets/info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../login/presentation/pages/login_page.dart';
import '../../../password/presentation/pages/password_dialog.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  static Widget screen() => BlocProvider(
        create: (context) => di<ProfileBloc>()..add(GetDataProfile()),
        child: const Profile(),
      );

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackColor,
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileFailure) {
            CustomToast.showToast("Маълумотлар юкланишда хатолик юз берди!");
          }
          if (state is ProfileLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is ProfileSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 19.w, right: 25.w, top: 20.h),
                  height: 124.h,
                  decoration: BoxDecoration(
                      color: cFirstColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(cRadius22.r),
                          bottomRight: Radius.circular(cRadius22.r))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                      ),
                      const Spacer(),
                      Center(
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
                      const Spacer(),
                      InkWell(
                        onTap: () => showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Дастурдан чиқишни ҳоҳлайсизми?'),
                            content: const Text(
                                'Сизнинг барча шахсий маълумотларингиз қурилмангиздан ўчириб юборилади!'),
                            actions: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text('Йўқ'),
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                              InkWell(
                                onTap: () async {
                                  SharedPreferences prefs = di.get();
                                  await prefs.remove('id');
                                  await prefs.remove('name');
                                  await prefs.remove('login');
                                  await prefs.remove('phone');
                                  await prefs.remove('regionId');
                                  await prefs.remove('sectorId');
                                  await prefs.remove('token');
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginPage.screen(),
                                    ),
                                    (Route route) => false,
                                  );
                                },
                                child: const Text('Ҳа'),
                              ),
                            ],
                            actionsPadding: const EdgeInsets.all(15),
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/logout.svg",
                          color: cWhiteColor,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  state.object.regionName!,
                  style: TextStyle(
                      color: cGrayColor2,
                      fontSize: 14.sp,
                      fontFamily: 'Medium'),
                ),
                Text(
                  state.object.name!,
                  style: TextStyle(
                      color: cGrayColor4,
                      fontSize: 24.sp,
                      fontFamily: 'Medium'),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  state.object.phoneNumber!,
                  style: TextStyle(
                      color: cFirstColor,
                      fontSize: 16.sp,
                      fontFamily: 'Medium'),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SvgPicture.asset(
                  "assets/icons/person.svg",
                  width: 153.w,
                  height: 153.h,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      infoWidget(
                        state.object.viloyatBoyicha!.toString(),
                        "Вилоятдаги барча секторлар ичида",
                        state.object.tumanBoyicha!.toString(),
                        "Туман (Шаҳар)нинг 4 та сектори ичида",
                        cFirstColor,
                        cFirstColor,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      infoWidget(
                          state.object.barchaJonatmalar!.toString(),
                          "Барча юборилган маьлумотлар сони",
                          state.object.sectorKotibiKormoqda!.toString(),
                          "Сектор котиби кўриб чиқмоқда",
                          cYellowColor,
                          cYellowColor),
                      SizedBox(
                        height: 15.h,
                      ),
                      infoWidget(
                          state.object.rejaGrafikBoyicha!.toString(),
                          "Режа графиги бўйича жами",
                          state.object.bajarilishiKerakIshlar!.toString(),
                          "Бажарилиши керак бўлган ишлар",
                          cYellowColor,
                          cRedColor),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 21.w),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cRadius22.r),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return PasswordEditDialog.screen();
                        }).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 21.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: cWhiteColor),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/ic_shield-security.svg",
                            width: 24.w, height: 24.h, color: cFirstColor),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Text(
                            "Parolni o’rnatish(o’zgartirish)",
                            style: TextStyle(
                                color: cFirstColor,
                                fontSize: 16.sp,
                                fontFamily: 'Regular'),
                          ),
                        ),
                      ],
                    ),
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
                  height: 15.h,
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
