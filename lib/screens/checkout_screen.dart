import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/models/cart_model.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_assignment_app/screens/order_success_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formkey = GlobalKey<FormState>();
  bool _address = false;

  final InputBorder _formBorder = OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFFf16682).withOpacity(0.5)));
  var _isLoading = false;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _sFirstNameController = TextEditingController();
  final TextEditingController _sLastNameController = TextEditingController();
  final TextEditingController _sAddressController = TextEditingController();
  final TextEditingController _sCityController = TextEditingController();
  final TextEditingController _sStateController = TextEditingController();

  Future<void> _saveForm() async {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formkey.currentState!.save();

    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<CartProvider>(context, listen: false)
          .createOrder(
        _firstNameController.text,
        _lastNameController.text,
        _addressController.text,
        _cityController.text,
        _stateController.text,
        _phoneController.text,
        _emailController.text,
        _address,
        _sFirstNameController.text,
        _sLastNameController.text,
        _sAddressController.text,
        _sCityController.text,
        _sStateController.text,
      )
          .then((value) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OrderSuccessfulScreen(),
          ),
        );
      });
    } catch (error) {
      print(error);
      await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('An Error Occured'),
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
    _formkey.currentState?.reset();
  }

  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).getCartLineItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out Items'),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Billing details',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 330.w,
                  child: TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      focusedBorder: _formBorder,
                      enabledBorder: _formBorder,
                      border: _formBorder,
                      hintText: "First name *",
                      hintStyle: TextStyle(
                          fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.h),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Valid Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 330.w,
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      focusedBorder: _formBorder,
                      enabledBorder: _formBorder,
                      border: _formBorder,
                      hintText: "Last name *",
                      hintStyle: TextStyle(
                          fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.h),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Valid Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 330.w,
                  child: TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      focusedBorder: _formBorder,
                      enabledBorder: _formBorder,
                      border: _formBorder,
                      hintText: "Street Address *",
                      hintStyle: TextStyle(
                          fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.h),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Valid address';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 330.w,
                  child: TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      focusedBorder: _formBorder,
                      enabledBorder: _formBorder,
                      border: _formBorder,
                      hintText: "Town / City  *",
                      hintStyle: TextStyle(
                          fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.h),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Valid city';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 330.w,
                  child: TextFormField(
                    controller: _stateController,
                    decoration: InputDecoration(
                      focusedBorder: _formBorder,
                      enabledBorder: _formBorder,
                      border: _formBorder,
                      hintText: "State / County *",
                      hintStyle: TextStyle(
                          fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.h),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Valid State';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 44.h,
                        width: 53.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color(0xFFf16682).withOpacity(0.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.r))),
                        child: Center(
                          child: Text(
                            '+971',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: GoogleFonts.lexend().fontFamily,
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 265.w,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          controller: _phoneController,
                          decoration: InputDecoration(
                            focusedBorder: _formBorder,
                            enabledBorder: _formBorder,
                            border: _formBorder,
                            hintText: "Phone Number *",
                            counterText: '',
                            hintStyle: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF9EA3A2)),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(8.h),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Valid Phone';
                            }
                            return null;
                          },
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 330.w,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      focusedBorder: _formBorder,
                      enabledBorder: _formBorder,
                      border: _formBorder,
                      hintText: "Email address *",
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
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: _address,
                        onChanged: (value) {
                          setState(() {
                            _address = value!;
                          });
                        }),
                    Text(
                      'Ship to a different address?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                _address
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: 330.w,
                            child: TextFormField(
                              controller: _sFirstNameController,
                              decoration: InputDecoration(
                                focusedBorder: _formBorder,
                                enabledBorder: _formBorder,
                                border: _formBorder,
                                hintText: "First name *",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: _address
                                  ? (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Valid Name';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            width: 330.w,
                            child: TextFormField(
                              controller: _sLastNameController,
                              decoration: InputDecoration(
                                focusedBorder: _formBorder,
                                enabledBorder: _formBorder,
                                border: _formBorder,
                                hintText: "Last name *",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: _address
                                  ? (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Valid Name';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            width: 330.w,
                            child: TextFormField(
                              controller: _sAddressController,
                              decoration: InputDecoration(
                                focusedBorder: _formBorder,
                                enabledBorder: _formBorder,
                                border: _formBorder,
                                hintText: "Street Address *",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: _address
                                  ? (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Valid address';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            width: 330.w,
                            child: TextFormField(
                              controller: _sCityController,
                              decoration: InputDecoration(
                                focusedBorder: _formBorder,
                                enabledBorder: _formBorder,
                                border: _formBorder,
                                hintText: "Town / City  *",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: _address
                                  ? (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Valid city';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            width: 330.w,
                            child: TextFormField(
                              controller: _sStateController,
                              decoration: InputDecoration(
                                focusedBorder: _formBorder,
                                enabledBorder: _formBorder,
                                border: _formBorder,
                                hintText: "State / County *",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF9EA3A2)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(8.h),
                              ),
                              validator: _address
                                  ? (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Valid State';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(height: 15.h),
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
                            'Place Order',
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
        ),
      ),
    );
  }
}
