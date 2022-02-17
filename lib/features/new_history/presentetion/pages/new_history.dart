import 'package:etahlil/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewHistory extends StatefulWidget {
  const NewHistory({Key? key}) : super(key: key);

  @override
  _NewHistoryState createState() => _NewHistoryState();
}

class _NewHistoryState extends State<NewHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: Center(
        child: Text(
          'New History',
          style: TextStyle(fontSize: 20.sp, color: cFirstColor),
        ),
      ),
    );
  }
}
