import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_assignment_app/providers/user_provider.dart';
import 'package:flutter_assignment_app/screens/order_success_screen.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? myUserId;
  final _formkey = GlobalKey<FormState>();
  bool _address = false;
  final FlutterLocalization _localization = FlutterLocalization.instance;
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
        myUserId!,
      )
          .then((value) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 800),
            reverseDuration: const Duration(milliseconds: 400),
            child: const OrderSuccessfulScreen(),
          ),
          // MaterialPageRoute(
          //   builder: (context) => const OrderSuccessfulScreen(),
          // ),
        );
      });
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(AppLocale.apiErrorText.getString(context)),
            content: Text(AppLocale.apiErrorContent.getString(context)),
            actions: [
              TextButton(
                child:
                    Text(AppLocale.apiErrorTextOkayButton.getString(context)),
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

  Future checkAddress() async {
    final data = Provider.of<UserProvider>(context, listen: false).userData;
    if (data.isNotEmpty) {
      _firstNameController.text = data[0].billing.firstName;
      _lastNameController.text = data[0].billing.lastName;
      _addressController.text = data[0].billing.address1;
      _cityController.text = data[0].billing.city;
      _stateController.text = data[0].billing.state;
      _phoneController.text = data[0].billing.phone;
      _emailController.text = data[0].billing.email!;
      _address = true;
      _sFirstNameController.text = data[0].shipping.firstName;
      _sLastNameController.text = data[0].shipping.lastName;
      _sAddressController.text = data[0].shipping.address1;
      _sCityController.text = data[0].shipping.city;
      _sStateController.text = data[0].shipping.state;
    }
  }

  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).getCartLineItems();
    Provider.of<UserProvider>(context, listen: false).fetchMyData();
    checkAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myUserId = Provider.of<UserProvider>(context, listen: false).userId;
    return Directionality(
      textDirection: _localization.currentLocale == const Locale("en", "US")
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocale.checkOutItems.getString(context)),
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
                    AppLocale.checkoutBilling.getString(context),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14.sp,
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
                        hintText:
                            AppLocale.firstNameHintText.getString(context),
                        hintStyle: TextStyle(
                            fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
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
                        hintText: AppLocale.lastNameHintText.getString(context),
                        hintStyle: TextStyle(
                            fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
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
                        hintText:
                            AppLocale.addressLineHintText.getString(context),
                        hintStyle: TextStyle(
                            fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(8.h),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocale.addressLineValidationText
                              .getString(context);
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
                        hintText: AppLocale.cityHintText.getString(context),
                        hintStyle: TextStyle(
                            fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(8.h),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocale.cityValidationText
                              .getString(context);
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
                        hintText: AppLocale.stateHintText.getString(context),
                        hintStyle: TextStyle(
                            fontSize: 12.sp, color: const Color(0xFF9EA3A2)),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(8.h),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocale.stateValidationText
                              .getString(context);
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
                              hintText:
                                  AppLocale.phoneHintText.getString(context),
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
                                return AppLocale.phoneValidationText
                                    .getString(context);
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
                        hintText: AppLocale.emailHintText.getString(context),
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
                        AppLocale.checkoutShipping.getString(context),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14.sp,
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
                                  hintText: AppLocale.firstNameHintText
                                      .getString(context),
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
                                          return AppLocale
                                              .firstNameValidationText
                                              .getString(context);
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
                                  hintText: AppLocale.lastNameHintText
                                      .getString(context),
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
                                          return AppLocale
                                              .lastNameValidationText
                                              .getString(context);
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
                                  hintText: AppLocale.addressLineHintText
                                      .getString(context),
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
                                          return AppLocale
                                              .addressLineValidationText
                                              .getString(context);
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
                                  hintText:
                                      AppLocale.cityHintText.getString(context),
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
                                          return AppLocale.cityValidationText
                                              .getString(context);
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
                                  hintText: AppLocale.stateHintText
                                      .getString(context),
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
                                          return AppLocale.stateValidationText
                                              .getString(context);
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
                              AppLocale.checkoutPlaceOrderButton
                                  .getString(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.lexend().fontFamily,
                                fontSize: 14,
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
      ),
    );
  }
}
