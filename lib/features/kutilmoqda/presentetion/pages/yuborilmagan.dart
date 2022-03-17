import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/core/widgets/costum_toast.dart';
import 'package:etahlil/di/dependency_injection.dart';
import 'package:etahlil/features/kutilmoqda/presentetion/bloc/not_send_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../../../core/network/network_info.dart';

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

  @override
  void initState() {
    _bloc = BlocProvider.of<NotSendBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog pd = ProgressDialog(context: context);
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
                  pd.close();
                  CustomToast.showToast(
                      "Маълумотлар юкланишда хатолик юз берди!");
                }
                if (state is NotSendLoading) {
                  SchedulerBinding.instance?.addPostFrameCallback((_) {
                    pd.show(
                      max: 100,
                      msg: 'File Uploading...',
                      barrierDismissible: false,
                      msgMaxLines: 1,
                    );
                  });
                }
                if (state is NotSendSuccess) {
                  pd.close();
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
                                        fontSize: 16.sp,
                                        fontFamily: 'SemiBold'),
                                    maxLines: 1,
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 22.w,
                                      right: 16.w,
                                      top: 16.h,
                                      bottom: 6.h),
                                  width: 250.w,
                                ),
                                Container(
                                  child: Text(
                                    state.list[index].text ?? "",
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
                              child: SvgPicture.asset(
                                "assets/icons/send_icon.svg",
                                width: 25.w,
                                height: 24.h,
                                color: cFirstColor,
                              ),
                              onTap: () async {
                                if (await networkInfo.isConnected) {
                                  _bloc.add(SetNotSendEvent(
                                    notSendModel: state.list[index],
                                  ));
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
                  pd.close();
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
}
