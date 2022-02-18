import 'package:etahlil/core/utils/app_constants.dart';
import 'package:etahlil/features/home/presentation/pages/home.dart';
import 'package:etahlil/features/new_history/presentetion/pages/new_history.dart';
import 'package:etahlil/features/old_history/presentetion/pages/old_history.dart';
import 'package:etahlil/features/profile/presentation/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    _widgetOptions = <Widget>[
      const HomePage(),
      const NewHistory(),
      const OldHistory(),
      const Profile(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 80.h,
        margin: EdgeInsets.only(left: 18.w, right: 18.w, bottom: 23.h),
        decoration: BoxDecoration(
          color: cFirstColor,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: BottomNavigationBar(
          selectedFontSize: 13.sp,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: cBackColorIcon,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: cWhiteColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/history.svg',
                color: cBackColorIcon,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/history.svg',
                color: cWhiteColor,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/icon_success.svg',
                color: cBackColorIcon,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/icon_success.svg',
                color: cWhiteColor,
              ),
              label: 'Success',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                color: cBackColorIcon,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/profile.svg',
                color: cWhiteColor,
              ),
              label: 'Profile',
            ),
          ],
          selectedLabelStyle: const TextStyle(fontSize: 0),
          unselectedLabelStyle: const TextStyle(fontSize: 0),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconSize: 26,
          unselectedItemColor: cBackColorIcon,
          currentIndex: _selectedIndex,
          selectedItemColor: cWhiteColor,
          onTap: (index) {
            setState(() => _selectedIndex = index);
          },
        ),
      ),
    );
  }
}
