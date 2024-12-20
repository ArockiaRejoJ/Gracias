import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_assignment_app/screens/app_drawer_screen.dart';
import 'package:flutter_assignment_app/screens/search_screen.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_assignment_app/widgets/cart_screen_body.dart';
import 'package:flutter_assignment_app/widgets/home_screen_body.dart';
import 'package:flutter_assignment_app/widgets/profile_screen_body.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final int? selectedPage;
  const HomeScreen({this.selectedPage, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  var scaffoldKey = GlobalKey<ScaffoldState>();

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
  void initState() {
    super.initState();
    if (widget.selectedPage != null) {
      _selectedPageIndex = widget.selectedPage!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _localization.currentLocale == const Locale("en", "US")
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: PopScope(
        canPop: false,
        onPopInvoked: (bool values) async {
          await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.r))),
                content: Text(
                  AppLocale.exitAlert.getString(context),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: GoogleFonts.lexend().fontFamily,
                      fontWeight: FontWeight.w600),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      AppLocale.exitNoButton.getString(context),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18.sp,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text(
                      AppLocale.exitYesButton.getString(context),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.sp,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Scaffold(
          key: scaffoldKey,
          drawer: const AppDrawerScreen(false),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            leading: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
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
                'assets/images/logo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: SearchPage(_localization.currentLocale ==
                                const Locale("en", "US")
                            ? false
                            : true));
                  },
                  icon: Icon(
                    Icons.search,
                    size: 20.sp,
                    color: Colors.black26,
                  )),
              Consumer<CartProvider>(builder: (context, cartData, _) {
                return Badge(
                  alignment: Alignment.topRight,
                  backgroundColor: Theme.of(context).primaryColor,
                  label: Text('${cartData.cartProdductItems.length}'),
                  offset: Offset(-8.w, 6.h),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedPageIndex = 1;
                      });
                    },
                    icon: Icon(
                      Icons.shopping_basket_outlined,
                      size: 18.sp,
                      color: Colors.black26,
                    ),
                  ),
                );
              }),
              SizedBox(width: 10.w),
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
                label: AppLocale.homeLabel.getString(context),
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
                label: AppLocale.cartLabel.getString(context),
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
                label: AppLocale.profileLabel.getString(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
