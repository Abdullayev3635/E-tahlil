import 'package:etahlil/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String? firstHalf;
  String? secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 70) {
      firstHalf = widget.text.substring(0, 70);
      secondHalf = widget.text.substring(70, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21.0.w, vertical: 0.0),
      child: secondHalf == ""
          ? Text(
              firstHalf!,
              style: TextStyle(
                  fontSize: 14.sp, fontFamily: 'Medium', color: cGrayColor2),
            )
          : Column(
              children: <Widget>[
                Text(
                  flag ? (firstHalf! + "...") : (firstHalf! + secondHalf!),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Medium',
                      color: cGrayColor2),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: Icon(
                      flag
                          ? Icons.keyboard_arrow_right_outlined
                          : Icons.keyboard_arrow_down,
                      color: cSecondColor,
                      size: 18,
                    ),
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
