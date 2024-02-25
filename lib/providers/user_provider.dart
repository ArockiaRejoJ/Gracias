import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_assignment_app/models/user_model.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_assignment_app/utils/key_details.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _userData = [];

  List<UserModel> get userData {
    return [..._userData];
  }

  String? _token;
  String? _userId;
  String? _userName;
  String? _email;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  String? get userId {
    if (_userId != null) {
      return _userId;
    }
    return null;
  }

  String? get userName {
    if (_userName != null) {
      return _userName;
    }
    return null;
  }

  String? get userEmail {
    if (_email != null) {
      return _email;
    }
    return null;
  }

  bool isRemember = false;
  // user register using post method
  Future<void> register(String email, String firstName, String lastName,
      String userName, String password) async {
    try {
      final url = Uri.parse('https://gracias.ae/wp-json/wc/v3/customers');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': "application/x-www-form-urlencoded",
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
        },
        body: {
          'email': email,
          'first_name': firstName,
          'last_name': lastName,
          'username': userName,
          'password': password,
        },
      );
      final data = json.decode(response.body);

      if (data['code'] != null) {
        throw data['code'].toString();
      }
    } catch (error) {
      rethrow;
    }
  }

  //user otp verify using post method
  Future<void> login(String userName, String password, bool remember) async {
    try {
      final url = Uri.parse('https://gracias.ae/wp-json/jwt-auth/v1/token');

      final response = await http.post(url, body: {
        'username': userName,
        'password': password,
      });

      final data = json.decode(response.body);

      if (data['code'] != null) {
        throw data['code'].toString();
      }

      if (response.statusCode == 200) {
        if (remember == true) {
          isRemember = remember;
          _token = data['token'];
          _email = data['user_email'];
          _userName = data['user_display_name'];
          final prefs = await SharedPreferences.getInstance();
          final userData = json.encode({
            'userToken': _token,
            'userEmail': _email,
            'userName': _userName,
          });
          prefs.setString('userData', userData);
          notifyListeners();
        } else {
          _token = data['token'];
          _email = data['user_email'];
          _userName = data['user_display_name'];
        }
        return;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future fetchMyData() async {
    final url = Uri.parse('https://gracias.ae/wp-json/wp/v2/users/me');
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $_token'},
      );
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        _userId = data['id'].toString();
        if (isRemember) {
          final prefs = await SharedPreferences.getInstance();
          final userData = json.encode({
            'userId': _userId,
            'userToken': _token,
            'userEmail': _email,
            'userName': _userName,
          });
          prefs.setString('userData', userData);
        }
        notifyListeners();
      }
      return _userId!;
    } catch (error) {
      rethrow;
    }
  }

  //auto login checking
  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData')!);

    _token = extractedUserData['userToken'] as String?;
    _userId = extractedUserData['userId'] as String?;
    // _firstName = extractedUserData['userFirstName'] as String?;
    // _lastName = extractedUserData['userLastName'] as String?;
    _userName = extractedUserData['userName'] as String?;
    _email = extractedUserData['userEmail'] as String?;


    notifyListeners();

    return true;
  }

  //logout from device
  Future<void> logout() async {
    _token = null;
    _userId = null;
    _userName = null;
    _email = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future fetchProfile() async {
    final url =
        Uri.parse('https://gracias.ae//wp-json/wc/v3/customers/$_userId');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
        },
      );
      final data = json.decode(response.body);

      Map<String, dynamic> profileData = {
        "id": data['id'],
        "firstName": data['first_name'],
        "lastName": data['last_name'],
        "userName": data['username'],
        "emailId": data['email'],
      };
      if (response.statusCode == 200) {
        _userData = [UserModel.fromJson(data)];
      }
      notifyListeners();
      return profileData;
    } catch (error) {
      rethrow;
    }
  }

  // user profile update using PUT method
  Future<void> updateProfile(
      String email, String firstName, String lastName, String userName) async {
    try {
      final url =
          Uri.parse('https://gracias.ae/wp-json/wc/v3/customers/$_userId');
      final response = await http.put(
        url,
        headers: {
          'Content-Type': "application/x-www-form-urlencoded",
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
        },
        body: {
          'email': email,
          'first_name': firstName,
          'last_name': lastName,
          'username': userName,
        },
      );
      final data = json.decode(response.body);
    } catch (error) {
      rethrow;
    }
  }

  // user Address update using PUT method
  Future<void> updateAddress(
    String firstName,
    String lastName,
    String address,
    String city,
    String state,
    String phone,
    String email,
    bool newShipping,
    String sFirstName,
    String sLastName,
    String sAddress,
    String sCity,
    String sState,
  ) async {
    Map<String, dynamic> billingData = {
      "first_name": firstName,
      "last_name": lastName,
      "address_1": address,
      "city": city,
      "state": state,
      "email": email,
      "phone": phone
    };
    Map<String, dynamic> shippingData = newShipping
        ? {
            'first_name': sFirstName,
            'last_name': sLastName,
            'address_1': sAddress,
            'city': sCity,
            "state": sState,
          }
        : {
            "first_name": firstName,
            "last_name": lastName,
            "address_1": address,
            "city": city,
            "state": state,
          };

    final Map<String, dynamic> addressData = {
      "billing": billingData,
      "shipping": shippingData,
    };
    try {
      final url =
          Uri.parse('https://gracias.ae/wp-json/wc/v3/customers/$_userId');
      //         .replace(queryParameters: {
      //   '_fields[]': ['billing', 'shipping'],
      // });
      final response = await http.put(
        url,
        headers: {
          'Content-Type': "application/json",
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
        },
        body: jsonEncode(addressData),
      );
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        _userData = [UserModel.fromJson(data)];
      }
      return;
    } catch (error) {
      rethrow;
    }
  }
}
