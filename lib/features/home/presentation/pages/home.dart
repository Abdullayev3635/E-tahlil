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
          BlocProvider(
            create: (context) =>
                di<SubCategoryBloc>()..add(GetSubCategoryEvent(id: 0)),
          ),
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

  bool isLarge = false;

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
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: 250.w,
                        child: Text(
                          "Ёшлар сиёсати, ижтимоий ривожлантириш ва маънавий-маърифий ишлар бўйича",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cWhiteColor,
                              fontFamily: 'Regular',
                              fontSize: 15.sp),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const YuborilmaganPage()),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/icons/cloud_icon.svg",
                          height: 24.h,
                          width: 24.w,
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
                            isLarge = !isLarge;
                            setState(() {});
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
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is HomeNotInternetState) {
                      CustomToast.showToast(
                          "Интернет билан алоқа йўқ илтимос алоқани текширинг!");
                    } else if (state is HomeFailureState) {
                      CustomToast.showToast(
                          "Маълумотлар юкланишда хатолик юз берди!");
                    }
                    if (state is HomeLoadingState) {
                      return const Center(child: CupertinoActivityIndicator());
                    } else if (state is HomeSuccessState) {
                      return Container(
                        height: isLarge ? (220) : (75).h,
                        margin: EdgeInsets.only(left: 18.w),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: isLarge ? 3 : 1,
                                    mainAxisExtent: 75.w,
                                    crossAxisSpacing: 12,
                                    childAspectRatio: 2 / 1,
                                    mainAxisSpacing: 13.w),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  for (int i = 0; i < state.list.length; i++) {
                                    state.list[i].isCheck = false;
                                  }
                                  state.list[index].isCheck = true;
                                  setState(() {});
                                  _subCategoryBloc.add(GetSubCategoryEvent(
                                      id: state.list[index].id!));
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                          border: Border.all(
                                              width: 1.5.w,
                                              color: state.list[index].isCheck
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
                                    Align(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            color: cWhiteColor),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 5.h),
                                        padding: EdgeInsets.only(bottom: 2.h),
                                        height: 18.h,
                                        width: 18.w,
                                        child: Center(
                                          child: Text(
                                            "-1",
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
                                  ],
                                ),
                              );
                            }),
                      );
                    } else {
                      return Container(
                        height: isLarge ? (220) : (75).h,
                        margin: EdgeInsets.only(left: 18.w),
                      );
                    }
                  },
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
            child: BlocBuilder<SubCategoryBloc, SubCategoryState>(
              builder: (context, state) {
                if (state is SubCategoryNotInternetState) {
                  CustomToast.showToast(
                      "Интернет билан алоқа йўқ илтимос алоқани текширинг!");
                }
                // else if (state is SubCategoryFailureState) {
                //   CustomToast.showToast(
                //       "Маълумотлар юкланишда хатолик юз берди!");
                // }
                if (state is SubCategoryLoadingState) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (state is SubCategorySuccessState) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 0),
                    child: ListView.builder(
                        itemCount: state.list.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => SendData.screen(
                                        state.list[index].categoryId!,
                                        state.list[index].id!)),
                              );
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
                                  Text(
                                    state.list[index].name!,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: cGrayColor2,
                                        fontFamily: 'Medium'),
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
