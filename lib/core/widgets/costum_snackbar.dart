import 'package:flutter/material.dart';

class CustomSnackBar {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ScaffoldState scaffoldState;
  final Key key;

  CustomSnackBar({required this.key, required this.scaffoldKey, required this.scaffoldState})
      : assert(true);

  void showSnackBar(final msg) {
    showSnackBarIml(text: "Error: $msg", color: Colors.black12);
  }

  ScaffoldState? get _state {
    return scaffoldState;
  }

  void showSnackBarIml({
    required String text,
    Duration duration = const Duration(hours: 1),
    required Color color,
    bool action = true,
  }) {
    hideAll();
    final snackBar = SnackBar(
      key: key,
      content: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: "Medium",),
      ),
      backgroundColor: color,
      duration: duration,
    );
    _state?.showSnackBar(snackBar);
  }

  void hideAll() {
    _state?.removeCurrentSnackBar();
  }
}
