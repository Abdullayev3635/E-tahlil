import 'package:carousel_slider/carousel_slider.dart';
import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/core/widgets/description_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OldHistory extends StatefulWidget {
  const OldHistory({Key? key}) : super(key: key);

  @override
  _OldHistoryState createState() => _OldHistoryState();
}

class _OldHistoryState extends State<OldHistory> {
  List<Widget>? imageSliders;
  List<String> imgList = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    getImages();
    super.initState();
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
                      bottomRight: Radius.circular(cRadius22.r))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    Text("Юборилган",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: cWhiteColor,
                            fontFamily: 'Medium')),
                    SvgPicture.asset(
                      "assets/icons/filter_icon.svg",
                      width: 24.w,
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 21.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Фильтр ишлатилмаган",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: cBlackColor,
                      fontFamily: 'Medium',
                      fontSize: 18.sp),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.only(bottom: 12.h, right: 18.w, left: 18.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(cRadius22.r),
                        color: cWhiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        imageSliders != null
                            ? ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(cRadius22.r),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    aspectRatio: 1.0,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 500),
                                    height: 290.h,
                                    viewportFraction: 1.0,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    },
                                  ),
                                  carouselController: _controller,
                                  items: imageSliders,
                                ),
                              )
                            : Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 5.0,
                                height: 5.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (cFirstColor).withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Дам олиш объектлари",
                                style: TextStyle(
                                    color: cFirstColor,
                                    fontFamily: 'Medium',
                                    fontSize: 11.sp),
                              ),
                              Text(
                                "18:06  17/02/2022",
                                style: TextStyle(
                                    color: cFirstColor,
                                    fontFamily: 'Medium',
                                    fontSize: 11.sp),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 21.w),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Container(
                          child: Text(
                            "Мактаблар ўқувчилари билан учрашув",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'SemiBold',
                                color: cGrayColor2),
                            textAlign: TextAlign.start,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 21.w),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        const DescriptionTextWidget(
                          text:
                              "Қўқон шаҳар 1-сектор раҳбари М.Усмонов томонидан Қўқон шаҳрининг фаол тадбир 1-сектор раҳбари М.Усмонов томонидан Қўқон шаҳрининг фаол тадбир1-сектор раҳбари М.Усмонов томонидан Қўқон 1-сектор раҳбари М.Усмонов томонидан Қўқон шаҳрининг фаол тадбир 1-сектор раҳбари М.Усмонов томонидан Қўқон шаҳрининг фаол тадбир1-сектор раҳбари М.Усмонов томонидан Қўқон шаҳрининг фаол тадбир1-сектор раҳбари М.Усмонов томонидан Қўқон шаҳрининг фаол тадбир",
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                      ],
                    ),
                  );
                },
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
              ),
            ),
          ],
        ));
  }

  Future<void> getImages() async {
    imgList = [
      "assets/images/image_children.jpg",
      "assets/images/image_children.jpg",
      "assets/images/image_children.jpg"
    ];

    imageSliders = imgList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              child: Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            ),
          ),
        )
        .toList();
  }
}
