import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/user_provider.dart';
import 'package:flutter_assignment_app/screens/home_screen.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isError = false;
  String? errorMsg;
  bool isRegisterError = false;
  String? registerErrorMsg;
  bool _isLoading = false;
  bool _isChecked = false;
  bool register = false;
  bool _passwordVisible = true;
  final InputBorder _formBorder = OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFFf16682).withOpacity(0.5)));

  final _formKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _rUserNameController = TextEditingController();
  final TextEditingController _rEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();
  final textFieldFocusNode = FocusNode();
  void _toggleObscured() {
    setState(() {
      _passwordVisible = !_passwordVisible;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, dont unfocus
      }
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    setState(() {
      isError = false;
      _isLoading = true;
    });
    try {
      await Provider.of<UserProvider>(context, listen: false)
          .login(
            _userNameController.text,
            _passController.text,
            _isChecked,
          )
          .then(
            (value) => Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 800),
                reverseDuration: const Duration(milliseconds: 400),
                child: const HomeScreen(),
              ),
              // MaterialPageRoute(
              //   builder: (context) => const HomeScreen(),
              // ),
            ),
          );
    } catch (error) {
      setState(() {
        isError = true;
        errorMsg = error.toString();
      });
    }
    setState(() {
      _isLoading = false;
    });
    _formKey.currentState?.reset();
  }

  Future<void> _registerForm() async {
    final isValid = _registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    //_registerFormKey.currentState!.save();

    setState(() {
      isRegisterError = false;
      _isLoading = true;
    });
    try {
      await Provider.of<UserProvider>(context, listen: false)
          .register(
        _rEmailController.text,
        _firstNameController.text,
        _lastNameController.text,
        _rUserNameController.text,
        _passwordController.text,
      )
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocale.registerMessage.getString(context),
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 16.sp,
                  color: Colors.white),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            duration: const Duration(seconds: 2),
            padding:
                EdgeInsets.only(left: 15.w, top: 5.h, bottom: 5.h, right: 15.w),
          ),
        );
        register = false;
      });
    } catch (error) {
      setState(() {
        isRegisterError = true;
        registerErrorMsg = error.toString();
      });
    }
    setState(() {
      _isLoading = false;
    });
    _registerFormKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 690.h,
        width: 360.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg-image.png'),
                opacity: 0.5,
                fit: BoxFit.fitHeight)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35.h),
              SizedBox(
                height: 150.h,
                width: 340.w,
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(height: 10.h),
              register
                  ? Form(
                      key: _registerFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 330.w,
                            child: TextFormField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                focusedBorder: _formBorder,
                                enabledBorder: _formBorder,
                                border: _formBorder,
                                hintText: AppLocale.firstNameHintText
                                    .getString(context),
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocale.firstNameValidationText
                                      .getString(context);
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: 330.w,
                            child: TextFormField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                focusedBorder: _formBorder,
                                enabledBorder: _formBorder,
                                border: _formBorder,
                                hintText: AppLocale.lastNameHintText
                                    .getString(context),
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocale.lastNameValidationText
                                      .getString(context);
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: 330.w,
                            child: TextFormField(
                              controller: _rUserNameController,
                              decoration: InputDecoration(
                                focusedBorder: _formBorder,
                                enabledBorder: _formBorder,
                                border: _formBorder,
                                hintText: AppLocale.userNameHintText
                                    .getString(context),
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocale.userNameValidationText
                                      .getString(context);
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: 330.w,
                            child: TextFormField(
                              controller: _rEmailController,
                              decoration: InputDecoration(
                                focusedBorder: _formBorder,
                                enabledBorder: _formBorder,
                                border: _formBorder,
                                hintText:
                                    AppLocale.emailHintText.getString(context),
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: (value) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = RegExp(pattern.toString());
                                if (value!.isEmpty) {
                                  return AppLocale.emailValidationText
                                      .getString(context);
                                } else if (!regex.hasMatch(value)) {
                                  return AppLocale.emailValidationText2
                                      .getString(context);
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            // height: 50.h,
                            width: 330.w,
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: _passwordVisible,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: const Color(0xFF000000).withOpacity(0.5),
                              ),
                              decoration: InputDecoration(
                                  focusedBorder: _formBorder,
                                  enabledBorder: _formBorder,
                                  border: _formBorder,
                                  hintText: AppLocale.passwordHintText
                                      .getString(context),
                                  hintStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF9EA3A2)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.all(8.h),
                                  suffixIconColor:
                                      const Color(0xFF000000).withOpacity(0.3),
                                  suffixIcon: IconButton(
                                      icon: _passwordVisible
                                          ? Icon(
                                              Icons.lock_outline,
                                              size: 22.sp,
                                            )
                                          : Icon(
                                              Icons.lock_open_outlined,
                                              size: 22.sp,
                                            ),
                                      onPressed: _toggleObscured)),
                              validator: (value) {
                                // Pattern pattern =
                                //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                // RegExp regex = RegExp(pattern.toString());
                                if (value!.isEmpty) {
                                  return AppLocale.passwordValidationText
                                      .getString(context);
                                }
                                // else if (value.length < 8) {
                                //   return ("Password must be more than 7 characters");
                                // } else if (!regex.hasMatch(value)) {
                                //   return ("Password should contain upper,lower,digit and Special character ");
                                // }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            // height: 50.h,
                            width: 330.w,
                            child: TextFormField(
                              controller: _cPasswordController,
                              obscureText: _passwordVisible,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: const Color(0xFF000000).withOpacity(0.5),
                              ),
                              decoration: InputDecoration(
                                  focusedBorder: _formBorder,
                                  enabledBorder: _formBorder,
                                  border: _formBorder,
                                  hintText: AppLocale.cPasswordHintText
                                      .getString(context),
                                  hintStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF9EA3A2)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.all(8.h),
                                  suffixIconColor:
                                      const Color(0xFF000000).withOpacity(0.3),
                                  suffixIcon: IconButton(
                                      icon: _passwordVisible
                                          ? Icon(
                                              Icons.lock_outline,
                                              size: 22.sp,
                                            )
                                          : Icon(
                                              Icons.lock_open_outlined,
                                              size: 22.sp,
                                            ),
                                      onPressed: _toggleObscured)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocale.cPasswordValidationText1
                                      .getString(context);
                                } else if (value != _passwordController.text) {
                                  return AppLocale.cPasswordValidationText2
                                      .getString(context);
                                }
                                return null;
                              },
                            ),
                          ),
                          isRegisterError
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        15.w, 10.h, 0.w, 0.h),
                                    child: Text(
                                      registerErrorMsg!.replaceAll("-", " "),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12.sp,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          SizedBox(height: 20.h),
                          SizedBox(
                            height: 50.h,
                            width: 330.w,
                            child: ElevatedButton(
                              onPressed: _registerForm,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    )
                                  : Text(
                                      AppLocale.registerButton
                                          .getString(context),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.lexend().fontFamily,
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  register = false;
                                });
                              },
                              child: Text(
                                '${AppLocale.loginButton.getString(context)}?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.lexend().fontFamily,
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    )
                  : Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 330.w,
                            child: TextFormField(
                              controller: _userNameController,
                              decoration: InputDecoration(
                                focusedBorder: _formBorder,
                                enabledBorder: _formBorder,
                                border: _formBorder,
                                hintText:
                                    AppLocale.emailHintText.getString(context),
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocale.emailHintText
                                      .getString(context);
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            // height: 50.h,
                            width: 330.w,
                            child: TextFormField(
                              controller: _passController,
                              obscureText: _passwordVisible,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: const Color(0xFF000000).withOpacity(0.5),
                              ),
                              decoration: InputDecoration(
                                  focusedBorder: _formBorder,
                                  enabledBorder: _formBorder,
                                  border: _formBorder,
                                  hintText: AppLocale.passwordHintText
                                      .getString(context),
                                  hintStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF9EA3A2)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.all(8.h),
                                  suffixIconColor:
                                      const Color(0xFF000000).withOpacity(0.3),
                                  suffixIcon: IconButton(
                                      icon: _passwordVisible
                                          ? Icon(
                                              Icons.lock_outline,
                                              size: 22.sp,
                                            )
                                          : Icon(
                                              Icons.lock_open_outlined,
                                              size: 22.sp,
                                            ),
                                      onPressed: _toggleObscured)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocale.passwordValidationText
                                      .getString(context);
                                }
                                return null;
                              },
                            ),
                          ),
                          isError
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        15.w, 8.h, 0.w, 5.h),
                                    child: Text(
                                      errorMsg!
                                          .replaceAll("[jwt_auth]", "")
                                          .replaceAll("_", " "),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12.sp,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20.w, 10.h, 5.w, 0.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _isChecked
                                        ? InkWell(
                                            onTap: () {
                                              setState(() {
                                                _isChecked = false;
                                              });
                                            },
                                            child: Icon(
                                              Icons.check_box,
                                              size: 16.sp,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                _isChecked = true;
                                              });
                                            },
                                            child: Icon(
                                              Icons.check_box_outline_blank,
                                              size: 16.sp,
                                            ),
                                          ),
                                    SizedBox(width: 5.w),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.h),
                                      child: Text(
                                        AppLocale.rememberMe.getString(context),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 12.sp,
                                          color: const Color(0xFF252525),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 3.h),
                                //   child: TextButton(
                                //       onPressed: () {},
                                //       child: Text(
                                //         AppLocale.forgetPassword
                                //             .getString(context),
                                //         style: TextStyle(
                                //           fontWeight: FontWeight.w600,
                                //           fontFamily:
                                //               GoogleFonts.poppins().fontFamily,
                                //           fontSize: 12.sp,
                                //           color: Colors.black,
                                //         ),
                                //       )),
                                // )
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            height: 50.h,
                            width: 330.w,
                            child: ElevatedButton(
                              onPressed: _saveForm,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    )
                                  : Text(
                                      AppLocale.loginButton.getString(context),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.lexend().fontFamily,
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  register = true;
                                });
                              },
                              child: Text(
                                AppLocale.createAccount.getString(context),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.lexend().fontFamily,
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  errorBox(var error) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(AppLocale.apiErrorText.getString(context)),
          content: Text(error!),
          actions: [
            TextButton(
              child: Text(AppLocale.apiErrorTextOkayButton.getString(context)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
