import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/lock/presentation/widgets/number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

SizedBox numPad(TextEditingController _pinPutController) {
  return SizedBox(
    height: 360.h,
    width: 300.w,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            number(_pinPutController, '1'),
            number(_pinPutController, '2'),
            number(_pinPutController, '3'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            number(_pinPutController, '4'),
            number(_pinPutController, '5'),
            number(_pinPutController, '6'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            number(_pinPutController, '7'),
            number(_pinPutController, '8'),
            number(_pinPutController, '9'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            number(_pinPutController, ''),
            number(_pinPutController, '0'),
            GestureDetector(
              onTap: () {
                if (_pinPutController.text.isNotEmpty) {
                  _pinPutController.text = _pinPutController.text
                      .substring(0, _pinPutController.text.length - 1);
                  _pinPutController.selection = TextSelection.collapsed(
                      offset: _pinPutController.text.length);
                }
              },
              behavior: HitTestBehavior.translucent,
              child: SizedBox(
                height: cNumberLockH90.h,
                width: cNumberLockW90.w,
                child: Center(
                  child: SvgPicture.asset("assets/icons/ic_delete.svg", width: 50.w, height: 50.h,),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
