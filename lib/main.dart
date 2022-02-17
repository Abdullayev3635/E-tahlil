import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'di/dependency_injection.dart' as di;
import 'features/app.dart';

void main() async {
  di.init();
  runZonedGuarded(() {
    runApp(const AppProvider());
  }, (error, stacktrace) {
    log('runZonedGuarded Errors: $error');
  });
}
