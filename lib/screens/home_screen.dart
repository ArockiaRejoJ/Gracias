import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_assignment_app/widgets/cart_screen_body.dart';
import 'package:flutter_assignment_app/widgets/home_screen_body.dart';
import 'package:flutter_assignment_app/widgets/profile_screen.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final List<Widget> _body = [
    const HomeScreenBody(),
    const CartScreenBody(),
    const ProfileScreenBody(),
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _localization.currentLocale == const Locale("en", "US")
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.subject,
                size: 26.sp,
                color: fontColor,
              ),
            ),
          ),
          centerTitle: true,
          title: SizedBox(
              height: 40.h,
              width: 100.w,
              child: Image.asset(
                'assets/images/Grasias-Logo-2-01.png',
                fit: BoxFit.fitHeight,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_sharp))
          ],
        ),
        body: _body[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          backgroundColor: Colors.white,
          onTap: _selectPage,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 16.sp,
            color: Theme.of(context).primaryColor,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 16.sp,
            color: Colors.black26,
          ),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.maps_home_work_outlined,
                size: 18.sp,
                color: Colors.black26,
              ),
              activeIcon: Icon(
                Icons.maps_home_work_outlined,
                size: 18.sp,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket_outlined,
                size: 18.sp,
                color: Colors.black26,
              ),
              activeIcon: Icon(
                Icons.shopping_basket_outlined,
                size: 18.sp,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
                size: 18.sp,
                color: Colors.black26,
              ),
              activeIcon: Icon(
                Icons.settings_outlined,
                size: 18.sp,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
