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
          if (state is ProfileNoConnection) {
            CustomToast.showToast(
                "Интернет билан алоқа йўқ илтимос алоқани текширинг!");
          } else if (state is ProfileFailure) {
            CustomToast.showToast("Маълумотлар юкланишда хатолик юз берди!");
          }
          if (state is ProfileLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is ProfileSuccess) {
            return Column(
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
                        state.object.viloyatBoyicha!.toString(),
                        "Вилоятдаги барча секторлар ичида",
                        state.object.tumanBoyicha!.toString(),
                        "Туман (Шаҳар)нинг 4 та сектори ичида",
                        cFirstColor,
                        cFirstColor,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      infoWidget(
                          state.object.barchaJonatmalar!.toString(),
                          "Барча юборилган маьлумотлар сони",
                          state.object.sectorKotibiKormoqda!.toString(),
                          "Сектор котиби кўриб чиқмоқда",
                          cYellowColor,
                          cYellowColor),
                      SizedBox(
                        height: 25.h,
                      ),
                      infoWidget(
                          state.object.rejaGrafikBoyicha!.toString(),
                          "Режа графиги бўйича жами",
                          state.object.bajarilishiKerakIshlar!.toString(),
                          "Бажарилиши керак бўлган ишлар",
                          cYellowColor,
                          cRedColor),
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
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
