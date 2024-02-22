import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/user_provider.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressFormWidget extends StatefulWidget {
  const AddressFormWidget({super.key});

  @override
  State<AddressFormWidget> createState() => _AddressFormWidgetState();
}

class _AddressFormWidgetState extends State<AddressFormWidget> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final _formkey = GlobalKey<FormState>();
  bool _address = false;
  bool _isDatafetching = false;
  bool isDataAvailable = false;
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
      await Provider.of<UserProvider>(context, listen: false).updateAddress(
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
      );
    } catch (error) {
      print(error);
      errorBox();
    }
    setState(() {
      _isLoading = false;
    });
    _formkey.currentState?.reset();
    Navigator.of(context).pop();
  }

  Future checkAddress() async {
    setState(() {
      _isDatafetching = true;
    });
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
      isDataAvailable = true;
    }
    setState(() {
      _isDatafetching = false;
    });
  }

  @override
  void initState() {
    super.initState();
    checkAddress();
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
            key: _formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15.h),
                child: Directionality(
                  textDirection:
                      _localization.currentLocale == const Locale("en", "US")
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocale.billingAddressTitle.getString(context),
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
                            hintText:
                                AppLocale.firstNameHintText.getString(context),
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
                            hintText:
                                AppLocale.lastNameHintText.getString(context),
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
                            hintText: AppLocale.addressLineHintText
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
                                fontSize: 12.sp,
                                color: const Color(0xFF9EA3A2)),
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
                            hintText:
                                AppLocale.stateHintText.getString(context),
                            hintStyle: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF9EA3A2)),
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
                                      color: const Color(0xFFf16682)
                                          .withOpacity(0.5)),
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
                                  hintText: AppLocale.phoneHintText
                                      .getString(context),
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
                            AppLocale.shippingAddressTitle.getString(context),
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
                                      hintText: AppLocale.cityHintText
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
                                                  .cityValidationText
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
                                              return AppLocale
                                                  .stateValidationText
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
                                  isDataAvailable
                                      ? AppLocale.updateAddressFormButton
                                          .getString(context)
                                      : AppLocale.addAddressFormButton
                                          .getString(context),
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

  void errorBox() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(AppLocale.apiErrorText.getString(context)),
          content: Text(AppLocale.apiErrorContent.getString(context)),
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
