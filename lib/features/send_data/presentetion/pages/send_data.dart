import 'package:etahlil/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SendData extends StatefulWidget {
  const SendData({Key? key}) : super(key: key);

  @override
  _SendDataState createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {
  File? _imageFile,
      _imageFile1,
      _imageFile2,
      _imageFile3,
      _imageFile4,
      _imageFile5;
  final _picker = ImagePicker();
  TextEditingController subject = TextEditingController();
  TextEditingController text = TextEditingController();

  @override
  void dispose() {
    subject.dispose();
    text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        behavior: HitTestBehavior.translucent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 19.w, right: 19.w, top: 20.h),
                height: 114.h,
                decoration: BoxDecoration(
                    color: cFirstColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(cRadius22.r),
                        bottomRight: Radius.circular(cRadius22.r))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        child: SvgPicture.asset(
                          "assets/icons/arrow_left.svg",
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      child: Text("Дам олиш объектлари",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: cWhiteColor,
                              fontFamily: 'Medium')),
                      width: 300.w,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                height: 125.h,
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                child: Row(
                  children: [
                    // pickedImage(_imageFile, _pickImageFromCamera("0")),
                    Expanded(
                      child: InkWell(
                          onTap: () async => _pickImageFromCamera("0"),
                          child: _imageFile == null
                              ? SvgPicture.asset(
                                  'assets/icons/default_image.svg')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.file(_imageFile!,
                                      fit: BoxFit.fill))),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    // pickedImage(_imageFile1, _pickImageFromCamera("1")),
                    Expanded(
                      child: InkWell(
                          onTap: () async => _pickImageFromCamera("1"),
                          child: _imageFile1 == null
                              ? SvgPicture.asset(
                                  'assets/icons/default_image.svg')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.file(_imageFile1!,
                                      fit: BoxFit.fill))),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    // pickedImage(_imageFile2, _pickImageFromCamera("2")),
                    Expanded(
                      child: InkWell(
                          onTap: () async => _pickImageFromCamera("2"),
                          child: _imageFile2 == null
                              ? SvgPicture.asset(
                                  'assets/icons/default_image.svg')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.file(_imageFile2!,
                                      fit: BoxFit.fill))),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                height: 125.h,
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                child: Row(
                  children: [
                    // pickedImage(_imageFile3, _pickImageFromCamera("3")),
                    Expanded(
                      child: InkWell(
                          onTap: () async => _pickImageFromCamera("3"),
                          child: _imageFile3 == null
                              ? SvgPicture.asset(
                                  'assets/icons/default_image.svg')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.file(_imageFile3!,
                                      fit: BoxFit.fill))),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    // pickedImage(_imageFile4, _pickImageFromCamera("4")),
                    Expanded(
                      child: InkWell(
                          onTap: () async => _pickImageFromCamera("4"),
                          child: _imageFile4 == null
                              ? SvgPicture.asset(
                                  'assets/icons/default_image.svg')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.file(_imageFile4!,
                                      fit: BoxFit.fill))),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    // pickedImage(_imageFile5, _pickImageFromCamera("5")),
                    Expanded(
                      child: InkWell(
                          onTap: () async => _pickImageFromCamera("5"),
                          child: _imageFile5 == null
                              ? SvgPicture.asset(
                                  'assets/icons/default_image.svg')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.file(_imageFile5!,
                                      fit: BoxFit.fill))),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
                decoration: BoxDecoration(
                    color: cBackColor,
                    borderRadius: BorderRadius.circular(cRadius22),
                    border: Border.all(color: cFirstColor, width: 1.5.w)),
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        textAlign: TextAlign.start,
                        autofocus: false,
                        maxLines: 1,
                        controller: subject,
                        cursorColor: cGrayColor2,
                        decoration: InputDecoration(
                          hintText: "Мавзу",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: cGrayColor,
                              fontSize: 15.sp,
                              fontFamily: 'Medium'),
                        ),
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Medium',
                            color: cGrayColor2),
                      ),
                      height: 57.h,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                          color: cBackButtonColor,
                          borderRadius: BorderRadius.circular(cRadius12.r)),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      child: TextField(
                        textAlign: TextAlign.start,
                        autofocus: false,
                        maxLines: 20,
                        controller: text,
                        cursorColor: cGrayColor2,
                        decoration: InputDecoration(
                          hintText: "Матн",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: cGrayColor,
                              fontSize: 15.sp,
                              fontFamily: 'Medium'),
                        ),
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Medium',
                            color: cGrayColor2),
                      ),
                      height: 200.h,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                          color: cBackButtonColor,
                          borderRadius: BorderRadius.circular(cRadius12.r)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                height: 69.h,
                decoration: BoxDecoration(
                    color: cBackColor,
                    borderRadius: BorderRadius.circular(cRadius22),
                    border: Border.all(color: cFirstColor, width: 1.5.w)),
                child: Center(
                  child: Theme(
                    data: ThemeData(
                        unselectedWidgetColor: cGrayColor2,
                        toggleableActiveColor: cGrayColor2),
                    child: CheckboxListTile(
                      title: Text(
                        "Ўринбосар иштирокида",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: cGrayColor2,
                            fontFamily: 'Regular'),
                      ),
                      //    <-- label
                      value: true,
                      onChanged: (newValue) {},
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Бекор қилиш",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: cGrayColor2,
                              fontFamily: 'Regular'),
                        ),
                        color: cBackButtonColor,
                        elevation: 0,
                        height: 70.h,
                        textColor: cGrayColor2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(cRadius22.r)),
                      ),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Юбориш",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: cWhiteColor,
                              fontFamily: 'Regular'),
                        ),
                        color: cFirstColor,
                        elevation: 0,
                        height: 70.h,
                        textColor: cGrayColor2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(cRadius22.r)),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageFromCamera(String key) async {
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera, maxHeight: 1024, maxWidth: 1024);
    setState(() {
      if (key == "0") {
        _imageFile = File(pickedFile!.path);
      } else if (key == "1") {
        _imageFile1 = File(pickedFile!.path);
      } else if (key == "2") {
        _imageFile2 = File(pickedFile!.path);
      } else if (key == "3") {
        _imageFile3 = File(pickedFile!.path);
      } else if (key == "4") {
        _imageFile4 = File(pickedFile!.path);
      } else if (key == "5") {
        _imageFile5 = File(pickedFile!.path);
      }
    });
  }
}
