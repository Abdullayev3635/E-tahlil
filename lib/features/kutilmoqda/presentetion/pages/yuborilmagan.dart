import 'package:etahlil/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotSendPage extends StatefulWidget {
  const NotSendPage({Key? key}) : super(key: key);

  @override
  _NotSendPageState createState() => _NotSendPageState();
}

class _NotSendPageState extends State<NotSendPage> {
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
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      EdgeInsets.only(bottom: 12.h, right: 18.w, left: 18.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(cRadius16.r),
                      color: cWhiteColor),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(14),
                        height: 68.h,
                        width: 68.w,
                        child: ClipRRect(
                          child: Image.asset(
                            "assets/images/image_children.jpg",
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(cRadius10.r),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              "Қўқон шаҳар 1-сектор раҳбари М.Усмонов томонидан Қўқон",
                              style: TextStyle(
                                  fontSize: 16.sp, fontFamily: 'SemiBold'),
                              maxLines: 1,
                            ),
                            margin: EdgeInsets.only(
                                left: 2.w, right: 16.w, top: 16.h, bottom: 6.h),
                            width: 250.w,
                          ),
                          Container(
                            child: Text(
                              "Қўқон шаҳар 1-сектор раҳбари М.Усмонов томонидан Қўқон",
                              style: TextStyle(
                                  fontSize: 14.sp, fontFamily: 'Regular'),
                              maxLines: 2,
                            ),
                            margin: EdgeInsets.only(
                                left: 2.w, right: 16.w, top: 6.h, bottom: 16.h),
                            width: 250.w,
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    ],
                  ),
                );
              },
              physics: const BouncingScrollPhysics(),
              itemCount: 1,
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              "Барчасини қайта юбориш",
              style: TextStyle(
                  fontSize: 18.sp, color: cWhiteColor, fontFamily: 'Regular'),
            ),
            color: cFirstColor,
            elevation: 0,
            height: 70.h,
            minWidth: 392.w,
            textColor: cGrayColor2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cRadius16.r)),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }
}
