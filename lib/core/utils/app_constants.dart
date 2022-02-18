import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// All colors
const cFirstColor = Color(0xFF2972FE);
const cSecondColor = Color(0xFF6499FF);
const cBackInputColor = Color(0xFFFAFAFA);
const cBackButtonColor = Color(0xFFF2F2F2);
const cTextColor = Color(0xFF475E6A);
const cBlackColor = Color(0xFF000000);
const cWhiteColor = Color(0xFFFFFFFF);
const cRedColor = Color(0xFFFF3030);
const cGrayColor = Color(0xFF949494);
const cGrayColor2 = Color(0xFF4F4F4F);
const cYellowColor = Color(0xFFFFC92F);
const cBackColorIcon = Color(0xFF99BAFF);
const cBackColor  = Color(0xFFF8F8F8);

// All gradient
const cFirstGradient = LinearGradient(
  colors: [cFirstColor, cSecondColor],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const cSecondGradient = LinearGradient(
  colors: [Colors.transparent, cFirstColor],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

// All keys for local caches
const String userData = 'user_data';

// All keys for local databases
const String userTable = 'user_table';

// All sizes
const double cRadius16 = 16.0;
const double cRadius22 = 22.0;

const double cNumberLockW90 = 95.0;
const double cNumberLockH90 = 90.0;
const double cNumberLockText42 = 42.0;

// versions
const String version = "1.0.0";

// lock number style

const numStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: cWhiteColor);
