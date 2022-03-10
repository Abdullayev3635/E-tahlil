import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/core/widgets/costum_toast.dart';
import 'package:etahlil/features/select_part/presentetion/pages/select_part.dart';
import 'package:etahlil/features/select_part/presentetion/pages/select_sub_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DialogFilter extends StatefulWidget {
  const DialogFilter({Key? key}) : super(key: key);

  @override
  _DialogFilterState createState() => _DialogFilterState();
}

class _DialogFilterState extends State<DialogFilter> {
  DateTime? selectedBegin;
  DateTime? selectedEnd;
  var customFormat = DateFormat('yyyy-MM-dd');
  DateTime selectedOnly = DateTime.now();

  int categoryId = 0;
  int subCategoryId = 0;
  String categoryName = "Бўлимни танланг";
  String subCategoryName = "Йўналишни танланг";

  @override
  void initState() {
    // selectedBegin = DateTime.now();
    // selectedEnd = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: cWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: 2,
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => showPicker(context, '1'),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: cBackButtonColor),
                      height: 55,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedBegin == null
                                ? "Дата 1"
                                : customFormat.format(selectedBegin!),
                            style:
                                TextStyle(color: cFirstColor, fontSize: 14.sp),
                          ),
                          const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: cFirstColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => showPicker(context, '2'),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: cBackButtonColor),
                      height: 55,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedEnd == null
                                ? "Дата 2"
                                : customFormat.format(selectedEnd!),
                            style:
                                TextStyle(color: cFirstColor, fontSize: 14.sp),
                          ),
                          const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: cFirstColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return SelectPart.screen();
                  },
                ).then((value) => {
                      if (value != null)
                        {
                          setState(() {
                            categoryId = value['id'];
                            categoryName = value['name'].toString();
                          }),
                        },
                    });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cBackButtonColor),
                height: 55,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      categoryName,
                      style: TextStyle(color: cFirstColor, fontSize: 14.sp),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_sharp,
                      color: cFirstColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {
                if (categoryId.toString().isEmpty) {
                  CustomToast.showToast("Илтимос бўлим танланг!");
                } else {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return SelectSubPart.screen(categoryId.toString());
                    },
                  ).then((value) => {
                        if (value != null)
                          {
                            setState(() {
                              subCategoryId = value['id'];
                              subCategoryName = value['name'].toString();
                            }),
                          }
                      });
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cBackButtonColor),
                height: 55,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subCategoryName,
                      style: TextStyle(color: cFirstColor, fontSize: 14.sp),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_sharp,
                      color: cFirstColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context, {
                  "categoryId": categoryId,
                  "subCategoryId": subCategoryId,
                  "categoryName": categoryName,
                  "startData": selectedBegin == null
                      ? "0"
                      : customFormat.format(selectedBegin!),
                  "endData": selectedEnd == null
                      ? "0"
                      : customFormat.format(selectedEnd!),
                });
              },
              //since this is only a UI app
              child: Text(
                'Давом этиш',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Regular',
                ),
              ),
              color: cFirstColor,
              elevation: 0,
              minWidth: 400.w,
              height: 80.h,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showPicker(BuildContext context, String a) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      firstDate: DateTime(
          DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(
          DateTime.now().year + 1, DateTime.now().month, DateTime.now().day),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: cFirstColor,
            colorScheme: const ColorScheme.light(primary: cFirstColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && a == '1') {
      setState(() {
        selectedBegin = picked;
      });
    } else {
      setState(() {
        selectedEnd = picked;
      });
    }
  }
}
