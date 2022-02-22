import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/home/domain/models/section_model.dart';
import 'package:etahlil/features/send_data/presentetion/pages/send_data.dart';
import 'package:flutter/cupertino.dart';
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

  bool isLarge = false;
  List<SectionModel> sectionList = [
    SectionModel(1, 'Қурилиш бўлим', true),
    SectionModel(2, 'Қурилиш бўлим', false),
    SectionModel(3, 'Қурилиш бўлим', false),
    SectionModel(4, 'Қурилиш бўлим', false),
    SectionModel(5, 'Қурилиш бўлим', false),
    SectionModel(6, 'Қурилиш бўлим', false),
    SectionModel(7, 'Қурилиш бўлим', false),
    SectionModel(8, 'Қурилиш бўлим', false),
    SectionModel(9, 'Қурилиш бўлим', false),
    SectionModel(10, 'Қурилиш бўлим', false),
    SectionModel(11, 'Қурилиш бўлим', false),
    SectionModel(12, 'Қурилиш бўлим', false),
    SectionModel(13, 'Қурилиш бўлим', false),
    SectionModel(14, 'Қурилиш бўлим', false),
    SectionModel(15, 'Қурилиш бўлим', false),
    SectionModel(16, 'Қурилиш бўлим', false),
    SectionModel(17, 'Қурилиш бўлим', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackColor,
      body: Column(
        children: [
          Container(
            height: isLarge ? (443) : (306).h,
            decoration: BoxDecoration(
                color: cFirstColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(cRadius22.r),
                    bottomRight: Radius.circular(cRadius22.r))),
            child: Column(
              children: [
                SizedBox(
                  height: 45.h,
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
                  height: 20.h,
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
                            cursorColor: cWhiteColor,
                            decoration: InputDecoration(
                              hintText: "Қидирув",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: cBackColorIcon,
                                  fontSize: 12.sp,
                                  fontFamily: 'Medium'),
                              prefixIconConstraints: BoxConstraints(
                                maxWidth: 25.w,
                                maxHeight: 20.h,
                                minHeight: 20.h,
                                minWidth: 25.w,
                              ),
                              contentPadding: EdgeInsets.only(bottom: 2.h),
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/search_icon.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                            ),
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'Medium',
                                color: cWhiteColor),
                          ),
                          height: 57.h,
                          padding: EdgeInsets.symmetric(horizontal: 19.w),
                          decoration: BoxDecoration(
                              color: cSecondColor,
                              borderRadius: BorderRadius.circular(cRadius16.r)),
                        ),
                        flex: 5,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (isLarge) {
                              isLarge = false;
                              setState(() {});
                            } else {
                              isLarge = true;
                              setState(() {});
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(cRadius16.r),
                                border: Border.all(
                                    width: 1.5.w,
                                    color:
                                        isLarge ? cWhiteColor : cSecondColor),
                                color: cSecondColor),
                            height: 57.h,
                            width: 57.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 17.w, vertical: 17.h),
                            child: SvgPicture.asset(
                              "assets/icons/lounch_icon.svg",
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: isLarge ? (220) : (75).h,
                  margin: EdgeInsets.only(left: 18.w),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isLarge ? 3 : 1,
                          mainAxisExtent: 68.w,
                          crossAxisSpacing: 12,
                          childAspectRatio: 2 / 1,
                          mainAxisSpacing: 13.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: sectionList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            for (int i = 0; i < sectionList.length; i++) {
                              sectionList[i].isCheck = false;
                            }
                            sectionList[index].isCheck = true;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                border: Border.all(
                                    width: 1.5.w,
                                    color: sectionList[index].isCheck!
                                        ? cWhiteColor
                                        : cSecondColor),
                                color: cSecondColor),
                            height: 68.h,
                            width: 68.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 2.h),
                            child: Center(
                                child: Text(
                              sectionList[index].name!,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: cWhiteColor,
                                  fontFamily: 'Medium',
                                  fontSize: 9.sp),
                            )),
                          ),
                        );
                      }),
                ),
                const Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/icons/warning_icon.svg",
                  height: 16.h,
                  width: 16.w,
                  color: cGrayColor2,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "Амалга оширилиши зарур йўналишлар",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "Medium",
                      color: cGrayColor2),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 0),
              child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => const SendData()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(cRadius16.r),
                            color: cWhiteColor),
                        height: 80.h,
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/ellipse.svg",
                              height: 5.h,
                              width: 5.w,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              "Мактаблар",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: cGrayColor2,
                                  fontFamily: 'Medium'),
                            ),
                            const Spacer(),
                            Text(
                              "10",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: cRedColor,
                                  fontFamily: 'Medium'),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            SvgPicture.asset(
                              "assets/icons/warning_icon.svg",
                              height: 20.h,
                              width: 20.w,
                              color: cRedColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
