// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:hatonet_demo/app/view/home/detail_home_page/home_page.dart';
import 'package:hatonet_demo/app/view/home/file_page/file_page.dart';
import 'package:hatonet_demo/app/view/home/interview_p%C3%A0ge/interview_page.dart';
import 'package:hatonet_demo/app/view/home/list_job_page/list_job_page.dart';
import 'package:hatonet_demo/app/view/home/setting_page/setting_page.dart';
import 'package:hatonet_demo/app/widget/navigation_drawer_widget.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  var _currentIndex = 0;
  int index = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ListJobPage(),
    FilePage(),
    InterviewPage(),
    SettingPage(),
  ];

  Color mainColor = const Color(0xFFE65C00);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        drawer: NavigationDrawerWidget(),
        backgroundColor: Colors.white,
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: const [
            HomePage(),
            ListJobPage(),
            FilePage(),
            InterviewPage(),
            SettingPage(),
          ],
          items: _navBarsItems(),
          navBarStyle: NavBarStyle.style3,
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/ic_layoutgrid_add.svg',
          width: 24,height: 24,
        ),
        iconSize: 24,
        title: ("Dashboard"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/ic_work.svg',
        ),
        title: ("Việc làm"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/ic_user_regular.svg',
        ),
        title: ("Hồ sơ"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/ic_calendar_check.svg',
        ),
        title: ("Phỏng vấn"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/icons/ic_setting_o.svg',
        ),
        title: ("Cài đặt"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
