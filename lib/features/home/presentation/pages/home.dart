import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/core/widgets/costum_toast.dart';
import 'package:etahlil/di/dependency_injection.dart';
import 'package:etahlil/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:etahlil/features/home/presentation/bloc/subCategory/sub_category_bloc.dart';
import 'package:etahlil/features/kutilmoqda/presentetion/pages/yuborilmagan.dart';
import 'package:etahlil/features/send_data/presentetion/pages/send_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Widget screen() => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di<CategoryBloc>()..add(GetCategory()),
          ),
          BlocProvider(create: (context) => di<SubCategoryBloc>()),
        ],
        child: const HomePage(),
      );

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();

  late CategoryBloc _categoryBloc;
  late SubCategoryBloc _subCategoryBloc;

  @override
  void initState() {
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _subCategoryBloc = BlocProvider.of<SubCategoryBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    search.dispose();
    _subCategoryBloc.close();
    _categoryBloc.close();
    super.dispose();
  }

  Future _handleRefresh() async {
    _categoryBloc.add(GetCategory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackColor,
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is HomeFailureState) {
                CustomToast.showToast(
                    "Маълумотлар юкланишда хатолик юз берди!");
              }
              if (state is HomeFailureState1) {}
              if (state is HomeLoadingState) {
                return Container(
                  height: state.isLarge ? (443) : (306).h,
                  decoration: BoxDecoration(
                    color: cFirstColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(cRadius22.r),
                      bottomRight: Radius.circular(cRadius22.r),
                    ),
                  ),
                  child: const Center(child: CupertinoActivityIndicator()),
                );
              } else if (state is HomeInitialState) {
                return Container(
                  height: state.isLarge ? (443) : (306).h,
                  decoration: BoxDecoration(
                      color: cFirstColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(cRadius22.r),
                          bottomRight: Radius.circular(cRadius22.r))),
                  child: const Center(child: CupertinoActivityIndicator()),
                );
              } else if (state is HomeSuccessState) {
                _subCategoryBloc.add(GetSubCategoryEvent(
                    id: state.list[state.selected].id!,
                    list: state.list));
                return Container(
                  height: state.isLarge ? (443) : (306).h,
                  decoration: BoxDecoration(
                      color: cFirstColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(cRadius22.r),
                          bottomRight: Radius.circular(cRadius22.r))),
                  child: Column(
                    children: [
                      SizedBox(height: 45.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25.w),
                        height: 60.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: 32.w,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 250.w,
                              child: Text(
                                state.list[state.selected].description ?? "",
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                style: TextStyle(
                                  color: cWhiteColor,
                                  fontFamily: 'Regular',
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          NotSendPage.screen()),
                                ).then((value) {
                                  _handleRefresh();
                                  debugPrint('on back');
                                });
                              },
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: SvgPicture.asset(
                                      "assets/icons/cloud_icon.svg",
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                  Visibility(
                                    visible: state.count > 0,
                                    child: Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          const Icon(Icons.brightness_1,
                                              size: 18.0,
                                              color: Colors.redAccent),
                                          Text(
                                            state.count.toString(),
                                            style: TextStyle(
                                                color: cWhiteColor,
                                                fontSize: 14.sp,
                                                fontFamily: 'SemiBold'),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                                    contentPadding:
                                        EdgeInsets.only(bottom: 2.h),
                                    prefixIcon: SvgPicture.asset(
                                      "assets/icons/search_icon.svg",
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                  ),
                                  onChanged: (text) {
                                    _subCategoryBloc
                                        .add(SearchSubCategoryEvent(txt: text));
                                  },
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: 'Medium',
                                      color: cWhiteColor),
                                ),
                                height: 57.h,
                                padding: EdgeInsets.symmetric(horizontal: 19.w),
                                decoration: BoxDecoration(
                                    color: cSecondColor,
                                    borderRadius:
                                        BorderRadius.circular(cRadius16.r)),
                              ),
                              flex: 5,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  _categoryBloc.add(ChangeColor(state.list, 0,
                                      state.count, state.isLarge));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(cRadius16.r),
                                      border: Border.all(
                                          width: 1.5.w,
                                          color: state.isLarge
                                              ? cWhiteColor
                                              : cSecondColor),
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
                        height: state.isLarge ? (285).h : (85).h,
                        margin: EdgeInsets.only(left: 18.w),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: state.isLarge ? 5 : 1,
                              mainAxisExtent: 68.w,
                              crossAxisSpacing: 3.h,
                              childAspectRatio: 1 / 1,
                              mainAxisSpacing: 13.w,
                            ),
                            padding: const EdgeInsets.all(4.0),
                            scrollDirection:
                                state.isLarge ? Axis.vertical : Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  _categoryBloc.add(ChangeColor(state.list,
                                      index, state.count, !state.isLarge));
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1.5.w,
                                              color: state.list[index].id == 0
                                                  ? cRedColor
                                                  : state.selected == index
                                                      ? cWhiteColor
                                                      : cSecondColor),
                                          color: cSecondColor),
                                      height: 75.h,
                                      width: 68.w,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 2.h),
                                      child: Center(
                                          child: Text(
                                        state.list[index].name!,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: cWhiteColor,
                                            fontFamily: 'Medium',
                                            fontSize: 9.sp),
                                      )),
                                    ),
                                    Visibility(
                                      child: Align(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color: cWhiteColor),
                                          margin: EdgeInsets.symmetric(
                                              horizontal:
                                                  state.isLarge ? 5.w : 0.w,
                                              vertical: 5.h),
                                          padding: EdgeInsets.only(bottom: 2.h),
                                          height: 18.h,
                                          width: 18.w,
                                          child: Center(
                                            child: Text(
                                              (state.list[index].count ?? "0")
                                                  .toString(),
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: cFirstColor,
                                                  fontFamily: 'Medium',
                                                  fontSize: 9.sp),
                                            ),
                                          ),
                                        ),
                                        alignment: Alignment.topRight,
                                      ),
                                      visible: state.list[index].count!=0,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              } else {
                return Container(
                  height: state.isLarge ? (443) : (306).h,
                  decoration: BoxDecoration(
                      color: cFirstColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(cRadius22.r),
                          bottomRight: Radius.circular(cRadius22.r))),
                  child: Column(
                    children: [
                      SizedBox(height: 45.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25.w),
                        height: 60.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: 32.w,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 250.w,
                              child: Text(
                                "",
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                style: TextStyle(
                                  color: cWhiteColor,
                                  fontFamily: 'Regular',
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          NotSendPage.screen()),
                                ).then((value) {
                                  _handleRefresh();
                                  debugPrint('on back');
                                });
                              },
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: SvgPicture.asset(
                                      "assets/icons/cloud_icon.svg",
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                                    contentPadding:
                                        EdgeInsets.only(bottom: 2.h),
                                    prefixIcon: SvgPicture.asset(
                                      "assets/icons/search_icon.svg",
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                  ),
                                  onChanged: (text) {
                                    _subCategoryBloc
                                        .add(SearchSubCategoryEvent(txt: text));
                                  },
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: 'Medium',
                                      color: cWhiteColor),
                                ),
                                height: 57.h,
                                padding: EdgeInsets.symmetric(horizontal: 19.w),
                                decoration: BoxDecoration(
                                    color: cSecondColor,
                                    borderRadius:
                                        BorderRadius.circular(cRadius16.r)),
                              ),
                              flex: 5,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  _categoryBloc.add(ChangeColor(
                                      const [], 0, 0, state.isLarge));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(cRadius16.r),
                                      border: Border.all(
                                          width: 1.5.w,
                                          color: state.isLarge
                                              ? cWhiteColor
                                              : cSecondColor),
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
                        height: state.isLarge ? (285).h : (85).h,
                        margin: EdgeInsets.only(left: 18.w),
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              }
            },
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
            child: BlocBuilder<SubCategoryBloc, SubCategoryState>(
              builder: (context, state) {
                if (state is SubCategoryFailureState) {
                  CustomToast.showToast(
                      "Маълумотлар юкланишда хатолик юз берди!");
                }
                if (state is SubCategoryLoadingState) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (state is SubCategorySuccessState) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 0),
                    child: ListView.builder(
                        itemCount: state.list.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return RefreshIndicator(
                            onRefresh: _handleRefresh,
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                if (state.list[index].status == "1") {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => SendData.screen(
                                            state.list[index].categoryId!,
                                            state.list[index].id!,
                                            state.list[index].categoryName!,
                                            state.list[index].name!)),
                                  ).then((value) {
                                    _handleRefresh();
                                    debugPrint('on back');
                                  });
                                } else {
                                  if (!state.isState) {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => SendData.screen(
                                              state.list[index].categoryId!,
                                              state.list[index].id!,
                                              state.list[index].categoryName!,
                                              state.list[index].name!)),
                                    ).then((value) {
                                      _handleRefresh();
                                      debugPrint('on back');
                                    });
                                  } else {
                                    CustomToast.showToast(
                                        "Илтимос аввал бажарилиши зарур бўлган ишларни бажаринг!");
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(cRadius16.r),
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
                                    SizedBox(
                                      width: 250.w,
                                      child: Text(
                                        state.list[index].name!,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: cGrayColor2,
                                            fontFamily: 'Medium'),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      state.list[index].countWorks!.toString(),
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
                                      color: state.list[index].status == "1"
                                          ? cRedColor
                                          : cYellowColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
