import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;
  final InputBorder _formBorder = OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFFf16682).withOpacity(0.5)));

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });
    // try {
    //   // await Provider.of<CartProvider>(context, listen: false)
    //   //     .createOrder(
    //   //   _firstNameController.text,
    //   //   _lastNameController.text,
    //   //   _addressController.text,
    //   //   _cityController.text,
    //   //   _stateController.text,
    //   //   _phoneController.text,
    //   //   _emailController.text,
    //   //   _address,
    //   //   _sFirstNameController.text,
    //   //   _sLastNameController.text,
    //   //   _sAddressController.text,
    //   //   _sCityController.text,
    //   //   _sStateController.text,
    //   // )
    //   //     .then(
    //   //       (value) => Navigator.pushReplacement(
    //   //     context,
    //   //     MaterialPageRoute(
    //   //       builder: (context) => const OrderSuccessfulScreen(),
    //   //     ),
    //   //   ),
    //   // );
    // } catch (error) {
    //   print(error);
    //   await showDialog(
    //     context: context,
    //     builder: (ctx) {
    //       return AlertDialog(
    //         title: const Text('An Error Occured'),
    //         content: const Text('Something went Wrong'),
    //         actions: [
    //           TextButton(
    //             child: const Text('Okay'),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           )
    //         ],
    //       );
    //     },
    //   );
    // }
    //}
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 690.h,
        width: 360.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg-image.png'),
                opacity: 0.5,
                fit: BoxFit.fitHeight)),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            SizedBox(
              height: 60.h,
              width: 200.w,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(height: 20.h),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                                'SignUp',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.lexend().fontFamily,
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
