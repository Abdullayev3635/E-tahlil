import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'features/app.dart';

void main() {
  runZonedGuarded(() {
    runApp(const AppProvider());
  }, (error, stacktrace) {
    log('runZonedGuarded Errors: $error');
  });
}
