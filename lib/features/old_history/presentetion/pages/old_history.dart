import 'package:etahlil/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OldHistory extends StatefulWidget {
  const OldHistory({Key? key}) : super(key: key);

  @override
  _OldHistoryState createState() => _OldHistoryState();
}

class _OldHistoryState extends State<OldHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: Center(
        child: Text(
          'Old History',
          style: TextStyle(fontSize: 20.sp, color: cFirstColor),
        ),
      ),
    );
  }
}
