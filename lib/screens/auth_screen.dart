import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/user_provider.dart';
import 'package:flutter_assignment_app/screens/splash_screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
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
              MaterialPageRoute(
                builder: (context) => const SplashScreen(),
              ),
            ),
          );
    } catch (error) {
      print(error);
      errorBox();
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    _formKey.currentState?.reset();
  }

  Future<void> _registerForm() async {
    final isValid = _registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _registerFormKey.currentState!.save();

    setState(() {
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
          .then((value) => register = false);
    } catch (error) {
      print(error);
      errorBox();
    }
    setState(() {
      _isLoading = false;
    });
    _registerFormKey.currentState?.reset();
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
                                hintText: "First Name *",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Valid First Name';
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
                                hintText: "Last Name *",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Valid Last Name';
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
                                hintText: "username *",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Valid username';
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
                                hintText: "E-mail *",
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
                                  return 'Please valid E-mail';
                                } else if (!regex.hasMatch(value)) {
                                  return 'Enter your valid E-mail';
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
                                  hintText: "Password *",
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
                                  return 'Enter valid password';
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
                                  hintText: "Confirm *",
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
                                  return 'Enter Valid Confirm Password';
                                } else if (value != _passwordController.text) {
                                  return ("Password Mismatched");
                                }
                                return null;
                              },
                            ),
                          ),
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
                                      'Register',
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
                                'Login?',
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
                                hintText: "username or email *",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Valid username or email';
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
                                  hintText: "Password *",
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
                                  return 'Enter valid password';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20.w, 0.h, 5.w, 0.h),
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
                                        'Remember me',
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
                                Padding(
                                  padding: EdgeInsets.only(top: 3.h),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Forget password ?',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                        ),
                                      )),
                                )
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
                                      'SignIn',
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
                                'Create New Account?',
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

  void errorBox() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('An Error Occurred'),
          content: const Text('Something went Wrong'),
          actions: [
            TextButton(
              child: const Text('Okay'),
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
