import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/models/user_model.dart';
import 'package:flutter_assignment_app/providers/user_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileUpdateWidget extends StatefulWidget {
  const ProfileUpdateWidget({super.key});

  @override
  State<ProfileUpdateWidget> createState() => _ProfileUpdateWidgetState();
}

class _ProfileUpdateWidgetState extends State<ProfileUpdateWidget> {
  bool _isDatafetching = false;
  bool _isLoading = false;
  final _updateFormKey = GlobalKey<FormState>();
  final InputBorder _formBorder = OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFFf16682).withOpacity(0.5)));
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _updateForm() async {
    final isValid = _updateFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _updateFormKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<UserProvider>(context, listen: false).updateProfile(
        _emailController.text,
        _firstNameController.text,
        _lastNameController.text,
        _userNameController.text,
      );
    } catch (error) {
      print(error);
      errorBox();
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    _updateFormKey.currentState?.reset();
  }

  Future getUserData() async {
    setState(() {
      _isDatafetching = true;
    });
    await Provider.of<UserProvider>(context, listen: false)
        .fetchProfile()
        .then((value) {
      print(value);
      _emailController.text = value['emailId'] ?? '';
      _firstNameController.text = value['firstName'] ?? '';
      _lastNameController.text = value['lastName'] ?? '';
      _userNameController.text = value['userName'] ?? '';
      setState(() {
        _isDatafetching = false;
      });
      return null;
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isDatafetching
        ? SizedBox(
            height: 100.h,
            width: 360.w,
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        : Form(
            key: _updateFormKey,
            child: Padding(
              padding: EdgeInsets.all(10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    'Update Your Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
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
                            fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
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
                            fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
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
                      controller: _userNameController,
                      decoration: InputDecoration(
                        focusedBorder: _formBorder,
                        enabledBorder: _formBorder,
                        border: _formBorder,
                        hintText: "username *",
                        hintStyle: TextStyle(
                            fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        focusedBorder: _formBorder,
                        enabledBorder: _formBorder,
                        border: _formBorder,
                        hintText: "E-mail *",
                        hintStyle: TextStyle(
                            fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
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
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 50.h,
                    width: 330.w,
                    child: ElevatedButton(
                      onPressed: _updateForm,
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
                              'Update',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.lexend().fontFamily,
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
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
