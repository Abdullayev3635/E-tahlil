import 'dart:convert';
import 'package:etahlil/core/errors/failures.dart';
import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/core/widgets/costum_toast.dart';
import 'package:etahlil/di/dependency_injection.dart';
import 'package:etahlil/features/send_data/data/models/send_model.dart';
import 'package:etahlil/features/send_data/presentetion/bloc/send_data_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SendData extends StatefulWidget {
  final int categoryId;
  final int subCategoryId;

  const SendData(
      {Key? key, required this.categoryId, required this.subCategoryId})
      : super(key: key);

  static Widget screen(int catId, int subCatId) => BlocProvider(
        create: (context) => di<SendDataBloc>(),
        child: SendData(
          categoryId: catId,
          subCategoryId: subCatId,
        ),
      );

  @override
  _SendDataState createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {
  File? _imageFile0,
      _imageFile1,
      _imageFile2,
      _imageFile3,
      _imageFile4,
      _imageFile5;
  String sana0 = "",
      sana1 = "",
      sana2 = "",
      sana3 = "",
      sana4 = "",
      sana5 = "",
      latLang0 = "41.21021020,70.12125485",
      latLang1 = "41.21021020,70.12125485",
      latLang2 = "41.21021020,70.12125485",
      latLang3 = "41.21021020,70.12125485",
      latLang4 = "41.21021020,70.12125485",
      latLang5 = "41.21021020,70.12125485";

  List<int>? imageBytes;
  String? imageString;

  final _picker = ImagePicker();
  TextEditingController subject = TextEditingController();
  TextEditingController text = TextEditingController();

  late SendDataBloc _bloc;

  bool checkOrin = true;

  late List<SendModel> images = [];

  @override
  void initState() {
    _bloc = BlocProvider.of<SendDataBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    subject.dispose();
    text.dispose();
    _bloc.close();
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
                height: 140.h,
                decoration: BoxDecoration(
                    color: cFirstColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(cRadius16.r),
                        bottomRight: Radius.circular(cRadius16.r))),
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
                    SizedBox(
                      width: 30.w,
                    )
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
                    pickedImage(_imageFile0, "0"),
                    SizedBox(
                      width: 12.w,
                    ),
                    pickedImage(_imageFile1, "1"),
                    SizedBox(
                      width: 12.w,
                    ),
                    pickedImage(_imageFile2, "2"),
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
                    pickedImage(_imageFile3, "3"),
                    SizedBox(
                      width: 12.w,
                    ),
                    pickedImage(_imageFile4, "4"),
                    SizedBox(
                      width: 12.w,
                    ),
                    pickedImage(_imageFile5, "5"),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                decoration: BoxDecoration(
                    color: cBackColor,
                    borderRadius: BorderRadius.circular(cRadius12),
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
                    borderRadius: BorderRadius.circular(cRadius12),
                    border: Border.all(color: cFirstColor, width: 1.5.w)),
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
                    value: checkOrin,
                    onChanged: (newValue) {
                      checkOrin = newValue!;
                      setState(() {});
                    },
                    controlAffinity: ListTileControlAffinity.leading,
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
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
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
                            borderRadius: BorderRadius.circular(cRadius12.r)),
                      ),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          addFile();
                        },
                        child: BlocBuilder<SendDataBloc, SendDataState>(
                          builder: (context, state) {
                            if (state is NoConnectionSendData) {
                              CustomToast.showToast(
                                  "Интернет билан алоқа йўқ илтимос алоқани текширинг!");
                            } else if (state is SendDataFailure) {
                              CustomToast.showToast(
                                  "Маълумотлар юкланишда хатолик юз берди!");
                            }
                            if (state is SendDataSuccess) {
                              WidgetsBinding.instance
                                  ?.addPostFrameCallback((_) {
                                Navigator.of(context).pop();
                              });
                            }
                            if (state is SendDataInitial) {
                              return Text(
                                "Юбориш",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: cWhiteColor,
                                    fontFamily: 'Regular'),
                              );
                            } else if (state is SendDataLoading) {
                              return CupertinoTheme(
                                data: CupertinoTheme.of(context)
                                    .copyWith(primaryColor: cWhiteColor),
                                child: const CupertinoActivityIndicator(),
                              );
                            } else {
                              return Text(
                                "Юбориш",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: cWhiteColor,
                                    fontFamily: 'Regular'),
                              );
                            }
                          },
                          bloc: _bloc,
                        ),
                        color: cFirstColor,
                        elevation: 0,
                        height: 70.h,
                        textColor: cGrayColor2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(cRadius12.r)),
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

  Widget pickedImage(File? _imageFile, String key) {
    return Expanded(
      child: InkWell(
        onTap: () async => _pickImageFromCamera(key),
        child: _imageFile == null
            ? SvgPicture.asset('assets/icons/default_image.svg')
            : Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.file(
                      _imageFile,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        if (key == "0") {
                          _imageFile0 = null;
                        } else if (key == "1") {
                          _imageFile1 = null;
                        } else if (key == "2") {
                          _imageFile2 = null;
                        } else if (key == "3") {
                          _imageFile3 = null;
                        } else if (key == "4") {
                          _imageFile4 = null;
                        } else if (key == "5") {
                          _imageFile5 = null;
                        }
                        setState(() {});
                      },
                      child: SvgPicture.asset(
                        "assets/icons/close_icon.svg",
                        width: 18.w,
                        height: 18.h,
                      ),
                    ),
                  ),
                ],
              ),
      ),
      flex: 1,
    );
  }

  Future<void> _pickImageFromCamera(String key) async {
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera, maxHeight: 1024, maxWidth: 1024);
    setState(() {
      if (key == "0") {
        _imageFile0 = File(pickedFile!.path);
        sana0 = DateTime.now().toString();
      } else if (key == "1") {
        _imageFile1 = File(pickedFile!.path);
        sana1 = DateTime.now().toString();
      } else if (key == "2") {
        _imageFile2 = File(pickedFile!.path);
        sana2 = DateTime.now().toString();
      } else if (key == "3") {
        _imageFile3 = File(pickedFile!.path);
        sana3 = DateTime.now().toString();
      } else if (key == "4") {
        _imageFile4 = File(pickedFile!.path);
        sana4 = DateTime.now().toString();
      } else if (key == "5") {
        _imageFile5 = File(pickedFile!.path);
        sana5 = DateTime.now().toString();
      }
    });
  }

  void addFile() async {
    try {
      images.clear();
      if (_imageFile0 != null) {
        imageBytes = _imageFile0!.readAsBytesSync();
        imageString = base64Encode(imageBytes!);
        images
            .add(SendModel(latLang: latLang0, sana: sana0, image: imageString));
      }
      if (_imageFile1 != null) {
        imageBytes = _imageFile1!.readAsBytesSync();
        imageString = base64Encode(imageBytes!);
        images
            .add(SendModel(latLang: latLang1, sana: sana1, image: imageString));
      }
      if (_imageFile2 != null) {
        imageBytes = _imageFile2!.readAsBytesSync();
        imageString = base64Encode(imageBytes!);
        images
            .add(SendModel(latLang: latLang2, sana: sana2, image: imageString));
      }
      if (_imageFile3 != null) {
        imageBytes = _imageFile3!.readAsBytesSync();
        imageString = base64Encode(imageBytes!);
        images
            .add(SendModel(latLang: latLang3, sana: sana3, image: imageString));
      }
      if (_imageFile4 != null) {
        imageBytes = _imageFile4!.readAsBytesSync();
        imageString = base64Encode(imageBytes!);
        images
            .add(SendModel(latLang: latLang4, sana: sana4, image: imageString));
      }
      if (_imageFile5 != null) {
        imageBytes = _imageFile5!.readAsBytesSync();
        imageString = base64Encode(imageBytes!);
        images
            .add(SendModel(latLang: latLang5, sana: sana5, image: imageString));
      }
      _bloc.add(
        SendDataToServerEvent(
          userId: 2,
          subId: widget.categoryId,
          subCategoryId: widget.subCategoryId,
          presenceOfDeputy: checkOrin ? 1 : 0,
          title: subject.text,
          text: text.text,
          images: images,
        ),
      );
    } on InputFormatterFailure {
      debugPrint("Малумотлар юкланишда ҳатолик");
      return;
    }
  }
}
