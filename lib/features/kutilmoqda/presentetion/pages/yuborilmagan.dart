import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/core/widgets/costum_toast.dart';
import 'package:etahlil/di/dependency_injection.dart';
import 'package:etahlil/features/kutilmoqda/presentetion/bloc/not_send_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/utils/api_path.dart';
import '../../data/model/not_send_model1.dart';

class NotSendPage extends StatefulWidget {
  const NotSendPage({Key? key}) : super(key: key);

  static Widget screen() => BlocProvider(
        create: (context) => di<NotSendBloc>()..add(GetNotSendEvent()),
        child: const NotSendPage(),
      );

  @override
  _NotSendPageState createState() => _NotSendPageState();
}

class _NotSendPageState extends State<NotSendPage> {
  late NotSendBloc _bloc;
  final NetworkInfo networkInfo = di.get();
  SharedPreferences sharedPreferences = di.get();
  Dio dio = di.get();
  late ProgressDialog pd;

  @override
  void initState() {
    _bloc = BlocProvider.of<NotSendBloc>(context);
    pd = ProgressDialog(context: context);
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 19.w, right: 19.w, top: 20.h),
            height: 124.h,
            decoration: BoxDecoration(
              color: cFirstColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(cRadius22.r),
                bottomRight: Radius.circular(cRadius22.r),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        "assets/icons/arrow_left.svg",
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                  Text("Юборилмаганлар",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: cWhiteColor,
                          fontFamily: 'Medium')),
                  SizedBox(
                    width: 24.w,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: BlocBuilder<NotSendBloc, NotSendState>(
              builder: (context, state) {
                if (state is NotSendFailure) {
                  CustomToast.showToast(
                      "Маълумотлар юкланишда хатолик юз берди!");
                }
                if (state is NotSendSuccess) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 12.h, right: 18.w, left: 18.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(cRadius16.r),
                            color: cWhiteColor),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text(
                                    state.list[index].title ?? "",
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        fontFamily: 'SemiBold'),
                                    maxLines: 1,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: 22.w,
                                    right: 16.w,
                                    top: 10.h,
                                    bottom: 6.h,
                                  ),
                                  width: 250.w,
                                ),
                                Container(
                                  child: Text(
                                    state.list[index].categoryName ?? "",
                                    style: TextStyle(
                                        fontSize: 17.sp, fontFamily: 'Medium'),
                                    maxLines: 2,
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 22.w,
                                      right: 16.w,
                                      top: 6.h,
                                      bottom: 5.h),
                                  width: 250.w,
                                ),
                                Container(
                                  child: Text(
                                    state.list[index].subCategoryName ?? "",
                                    style: TextStyle(
                                        fontSize: 14.sp, fontFamily: 'Regular'),
                                    maxLines: 2,
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 22.w,
                                      right: 16.w,
                                      top: 6.h,
                                      bottom: 16.h),
                                  width: 250.w,
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            const Spacer(),
                            InkResponse(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  "assets/icons/send_icon.svg",
                                  width: 25.w,
                                  height: 24.h,
                                  color: cFirstColor,
                                ),
                              ),
                              onTap: () async {
                                if (await networkInfo.isConnected) {
                                  // _bloc.add(SetNotSendEvent(
                                  //   notSendModel: state.list[index],
                                  // ));
                                  sendData(state.list[index]);
                                } else {
                                  CustomToast.showToast(
                                      "Интернет билан алоқа ёқ илтимос алоқани қайта текширинг!");
                                }
                              },
                            ),
                            SizedBox(
                              width: 25.w,
                            )
                          ],
                        ),
                      );
                    },
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.list.length,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }

  void sendData(NotSendModel notSendModel) async {
    pd.show(max: 100, msg: "Маълумотлар юкланмоқда...", msgFontSize: 17.sp);
    var json =
        jsonEncode(notSendModel.imagesList!.map((e) => e.toJson()).toList());

    var body = {
      "user_id": sharedPreferences.getString("id")!,
      "category_id": notSendModel.categoryId.toString(),
      "subCategory_id": notSendModel.subCategoryId.toString(),
      "orinbosar_ishtirokida": notSendModel.orinbosarIshtirokida.toString(),
      "title": notSendModel.title.toString(),
      "text": notSendModel.text.toString(),
      "images_list": json,
    };

    try {
      Options options = Options(
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Accept": "application/json",
          "Authorization": "Bearer ${sharedPreferences.getString("token")}"
        },
        receiveTimeout: 60 * 1000,
        sendTimeout: 60 * 1000,
      );

      final response = await dio.post(
        baseUrl + worksPHP,
        data: body,
        options: options,
        onSendProgress: (int sent, int total) {
          pd.update(value: (sent / total * 100).round() - 1);
        },
      );
      if (response.statusCode == 200) {
        final box = Hive.box(forSendBox);
        box.delete(notSendModel.key);
        _bloc.add(GetNotSendEvent());
        pd.close();
      } else {
        pd.close();
        CustomToast.showToast("Маълумотлар юкланишда хатолик юз берди!");
      }
    } catch (e) {
      debugPrint(e.toString());
      pd.close();
      CustomToast.showToast("Маълумотлар юкланишда хатолик юз берди!");
    }
  }
}
