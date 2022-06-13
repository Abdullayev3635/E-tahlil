/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_left.svg
  String get arrowLeft => 'assets/icons/arrow_left.svg';

  /// File path: assets/icons/call.svg
  String get call => 'assets/icons/call.svg';

  /// File path: assets/icons/close_icon.svg
  String get closeIcon => 'assets/icons/close_icon.svg';

  /// File path: assets/icons/cloud_icon.svg
  String get cloudIcon => 'assets/icons/cloud_icon.svg';

  /// File path: assets/icons/corp.svg
  String get corp => 'assets/icons/corp.svg';

  /// File path: assets/icons/default_image.svg
  String get defaultImage => 'assets/icons/default_image.svg';

  /// File path: assets/icons/ellipse.svg
  String get ellipse => 'assets/icons/ellipse.svg';

  /// File path: assets/icons/filter_icon.svg
  String get filterIcon => 'assets/icons/filter_icon.svg';

  /// File path: assets/icons/finger-scan.svg
  String get fingerScan => 'assets/icons/finger-scan.svg';

  /// File path: assets/icons/fingerprint-svgrepo-com.svg
  String get fingerprintSvgrepoCom =>
      'assets/icons/fingerprint-svgrepo-com.svg';

  /// File path: assets/icons/history.svg
  String get history => 'assets/icons/history.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/ic_close_red.svg
  String get icCloseRed => 'assets/icons/ic_close_red.svg';

  /// File path: assets/icons/ic_delete.svg
  String get icDelete => 'assets/icons/ic_delete.svg';

  /// File path: assets/icons/ic_eye_slash.svg
  String get icEyeSlash => 'assets/icons/ic_eye_slash.svg';

  /// File path: assets/icons/ic_lock.svg
  String get icLock => 'assets/icons/ic_lock.svg';

  /// File path: assets/icons/ic_shield-security.svg
  String get icShieldSecurity => 'assets/icons/ic_shield-security.svg';

  /// File path: assets/icons/icon_success.svg
  String get iconSuccess => 'assets/icons/icon_success.svg';

  /// File path: assets/icons/logout.svg
  String get logout => 'assets/icons/logout.svg';

  /// File path: assets/icons/lounch_icon.svg
  String get lounchIcon => 'assets/icons/lounch_icon.svg';

  /// File path: assets/icons/person.svg
  String get person => 'assets/icons/person.svg';

  /// File path: assets/icons/placeholder.svg
  String get placeholder => 'assets/icons/placeholder.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/search_icon.svg
  String get searchIcon => 'assets/icons/search_icon.svg';

  /// File path: assets/icons/send_icon.svg
  String get sendIcon => 'assets/icons/send_icon.svg';

  /// File path: assets/icons/svgtahlil.svg
  String get svgtahlil => 'assets/icons/svgtahlil.svg';

  /// File path: assets/icons/warning_icon.svg
  String get warningIcon => 'assets/icons/warning_icon.svg';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/image_children.jpg
  AssetGenImage get imageChildren =>
      const AssetGenImage('assets/images/image_children.jpg');

  /// File path: assets/images/logoTahlil.png
  AssetGenImage get logoTahlil =>
      const AssetGenImage('assets/images/logoTahlil.png');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale = 1.0,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;
}
