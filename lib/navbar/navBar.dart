import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:aspen/explore/explore.dart';
import 'package:sizer/sizer.dart';



class NavBarCode extends StatefulWidget {
  const NavBarCode({Key? key}) : super(key: key);

  @override
  _NavBarCodeState createState() => _NavBarCodeState();
}

class _NavBarCodeState extends State<NavBarCode> {
  int _currentIndex = 0;

  final List<NavBar> _navigations = [
    NavBar(
        icon: const Icon(Icons.indeterminate_check_box), view: const Explore()),
    NavBar(
        icon:const Icon(Icons.confirmation_number_outlined), view: Container()),
    NavBar(
        icon:const Icon(Icons.favorite), view: Container()),
    NavBar(
        icon:const Icon(Icons.person_2_outlined), view: Container()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabBar(),
    );
  }

  Widget _tabBar() {
    return PersistentTabView(
      context,
      screens: _navigations.map((e) => e.view).toList(),
      navBarHeight: 80,
      decoration:const NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color(0x0c1c186ff2),
              offset: Offset(15, -19),
              blurRadius: 20,
            )
          ]
      ),
      confineInSafeArea: true,
      navBarStyle: NavBarStyle.style6,
      items: [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.indeterminate_check_box),
            activeColorPrimary: _currentIndex == 0
                ?const Color(0xff186ff2)
                :const Color(0xff888888)),
        PersistentBottomNavBarItem(
            icon:const Icon(Icons.confirmation_number_outlined),
            activeColorPrimary: _currentIndex == 1
                ? const Color(0xff186ff2)
                :const  Color(0xff888888)),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.favorite),
            activeColorPrimary: _currentIndex == 2
                ?const Color(0xff186ff2)
                :const Color(0xff888888)),
        PersistentBottomNavBarItem(
            icon:const Icon(Icons.person_2_outlined),
            activeColorPrimary: _currentIndex == 3
                ?const Color(0xff186ff2)
                :const Color(0xff888888)),
      ],
      popActionScreens: PopActionScreensType.all,
      popAllScreensOnTapOfSelectedTab: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      onItemSelected: (v) {
        _currentIndex = v;
        if (mounted) setState(() {});
      },
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapAnyTabs: false,
    );
  }
}

class NavBar{
  Icon icon;
  Widget view;
  NavBar({required this.icon, required this.view});
}
