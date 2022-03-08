import 'package:etahlil/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lock/presentation/pages/lock_page.dart';
import 'login/presentation/pages/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return App();
  }
}

class App extends StatelessWidget {
  SharedPreferences sharedPreferences = di.get();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = sharedPreferences.getString('id') ?? "";
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        home: id == "" ? LoginPage.screen() : PasswordScreen.screen(),
      ),
    );
  }
}
