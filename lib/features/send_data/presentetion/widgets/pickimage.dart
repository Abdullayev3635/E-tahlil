import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

Widget pickedImage(File? _imageFile, Future<void> function) {
  return Expanded(
    child: InkWell(
        onTap: () async => function,
        child: _imageFile == null
            ? SvgPicture.asset('assets/icons/default_image.svg')
            : ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.file(_imageFile, fit: BoxFit.fill))),
    flex: 1,
  );
}