import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:url_launcher/url_launcher.dart';

const consumerKey = 'ck_e1d88868beb9cef9d0ed575917dcc03400e3036c';
const secretKey = 'cs_9b9a71b92643bb2114dd303059642a335d3202e4';

const engBaseUrl = 'https://gracias.ae';

const arbBaseUrl = 'https://gracias.ae/ar';

const midUrl = 'wp-json/wc/v3';

// final FlutterLocalization _localization = FlutterLocalization.instance;

// String baseUrl = _localization.currentLocale == const Locale("en", "US")
//     ? 'https://gracias.ae/wp-json/wc/v3'
//     : 'https://gracias.ae/ar/wp-json/wc/v3';

void launchWhatsApp() async {
  if (!await launchUrl(
      Uri.parse(
          "https://api.whatsapp.com/send/?phone=971557188002&text&type=phone_number&app_absent=0"),
      mode: LaunchMode.externalApplication)) {
    throw 'Could not launch ';
  }
}

void launchFacebook() async {
  if (!await launchUrl(Uri.parse("https://www.facebook.com/gracias.ae"),
      mode: LaunchMode.externalApplication)) {
    throw 'Could not launch ';
  }
}

void launchInstagram() async {
  if (!await launchUrl(
      Uri.parse("https://www.instagram.com/gracias.ae?igsh=bjNqMXplZDU4dGZj"),
      mode: LaunchMode.externalApplication)) {
    throw 'Could not launch ';
  }
}

void launchPlayStore() async {
  if (!await launchUrl(
      Uri.parse(
          "https://play.google.com/store/apps/details?id=com.gracias.app"),
      mode: LaunchMode.externalApplication)) {
    throw 'Could not launch ';
  }
}
