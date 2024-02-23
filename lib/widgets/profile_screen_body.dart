import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/user_provider.dart';
import 'package:flutter_assignment_app/screens/about_us_screen.dart';
import 'package:flutter_assignment_app/screens/auth_screen.dart';
import 'package:flutter_assignment_app/screens/order_screen.dart';
import 'package:flutter_assignment_app/screens/privacy_policy_screen.dart';
import 'package:flutter_assignment_app/screens/terms_and_conditions_screen.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_assignment_app/utils/key_details.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_assignment_app/widgets/address_form_widget.dart';
import 'package:flutter_assignment_app/widgets/profile_update_widget.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  bool isLoading = false;
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    isLoading = true;
    super.initState();
    Provider.of<UserProvider>(context, listen: false)
        .fetchMyData()
        .then((value) => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    return Padding(
      padding: EdgeInsets.all(15.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            auth.isAuth
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        minRadius: 30.r,
                        maxRadius: 30.r,
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.person,
                          size: 50.sp,
                          color: Colors.black26,
                        ),
                        // backgroundImage: NetworkImage(''),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${auth.userName}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${auth.userEmail}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                : InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AuthScreen()));
                    },
                    child: SizedBox(
                      height: 40.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.login,
                            size: 24.sp,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            AppLocale.loginButton.getString(context),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                _languageModalBottomSheet(context);
              },
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.language,
                      size: 24.sp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      AppLocale.countryLanguage.getString(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: auth.userId != null
                  ? () {
                      profileUpdate(context);
                    }
                  : null,
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      size: 24.sp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      AppLocale.profile.getString(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: auth.userId != null
                  ? () {
                      addressUpdate(context);
                    }
                  : null,
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.home_work_outlined,
                      size: 24.sp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      AppLocale.address.getString(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: auth.userId != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrdersScreen(auth.userId!),
                        ),
                      );
                    }
                  : null,
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 24.sp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      AppLocale.myOrders.getString(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.h),
            const Divider(),
            SizedBox(height: 5.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUsScreen(),
                  ),
                );
              },
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 24.sp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      AppLocale.aboutUs.getString(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicyScreen(),
                  ),
                );
              },
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.privacy_tip_outlined,
                      size: 24.sp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      AppLocale.privacyPolicy.getString(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermsAndConditionsScreen(),
                  ),
                );
              },
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 24.sp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      AppLocale.termsAndConditions.getString(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.h),
            const Divider(),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: launchPlayStore,
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 24.sp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      AppLocale.starRatting.getString(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                Share.share(
                  AppLocale.shareContent.getString(context),
                );
              },
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.ios_share,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      AppLocale.shareWithFriends.getString(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                logout(context);
              },
              child: SizedBox(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.logout,
                      size: 24.sp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      AppLocale.signOut.getString(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                '${AppLocale.appVersion.getString(context)} 1.0.3',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _languageModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 80.h,
          width: 360.w,
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  _localization.translate('en');
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'English',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  _localization.translate('ar', save: true);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'العربية',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  profileUpdate(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isDismissible: false,
      isScrollControlled: true,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
      builder: (BuildContext context) {
        return isLoading
            ? SizedBox(
                height: 100.h,
                width: 360.w,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  width: 360.w,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const ProfileUpdateWidget(),
                ),
              );
      },
    );
  }

  addressUpdate(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isDismissible: false,
      isScrollControlled: true,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
      builder: (BuildContext context) {
        return isLoading
            ? SizedBox(
                height: 100.h,
                width: 360.w,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  height: 640.h,
                  width: 360.w,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddressFormWidget(),
                ),
              );
      },
    );
  }

  void logout(BuildContext context) {
    final auth = Provider.of<UserProvider>(context, listen: false);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Directionality(
          textDirection: _localization.currentLocale == const Locale("en", "US")
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.r))),
            content: Text(
              AppLocale.logoutAlert.getString(context),
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
                  AppLocale.logoutYesButton.getString(context),
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  auth.logout();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()),
                      (route) => false);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
