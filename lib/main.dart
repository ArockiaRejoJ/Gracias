import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/banner_provider.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_assignment_app/providers/category_provider.dart';
import 'package:flutter_assignment_app/providers/order_provider.dart';
import 'package:flutter_assignment_app/providers/product_provider.dart';
import 'package:flutter_assignment_app/providers/user_provider.dart';
import 'package:flutter_assignment_app/screens/auth_screen.dart';
import 'package:flutter_assignment_app/screens/splash_screens.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        MapLocale(
          'en',
          AppLocale.EN,
          countryCode: 'US',
          fontFamily: 'Font EN',
        ),
        MapLocale(
          'ar',
          AppLocale.AR,
          countryCode: 'AE',
          fontFamily: 'Font AE',
        ),
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProxyProvider<UserProvider, ProductProvider>(
          create: (_) => ProductProvider('', [], []),
          update: (context, auth, previousData) => ProductProvider(
            auth.token,
            previousData == null ? [] : previousData.productItems,
            previousData == null ? [] : previousData.productByCategoryById,
          ),
        ),
        ChangeNotifierProxyProvider(
          create: (_) => CategoryProvider([]),
          update: (context, auth, previousData) => CategoryProvider(
            previousData == null ? [] : previousData.categoryItems,
          ),
        ),
        ChangeNotifierProxyProvider<UserProvider, CartProvider>(
          create: (_) => CartProvider('', [], [], []),
          update: (context, auth, previousData) => CartProvider(
            auth.token,
            previousData == null ? [] : previousData.cartItems,
            previousData == null ? [] : previousData.cartProdductItems,
            previousData == null ? [] : previousData.lineItems,
          ),
        ),
        ChangeNotifierProxyProvider<UserProvider, OrderProvider>(
          create: (_) => OrderProvider('', []),
          update: (context, auth, previousData) => OrderProvider(
            auth.token,
            previousData == null ? [] : previousData.orderItems,
          ),
        ),
        ChangeNotifierProxyProvider(
          create: (_) => BannerProvider([]),
          update: (context, auth, previousData) => BannerProvider(
            previousData == null ? [] : previousData.bannerItems,
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Consumer<UserProvider>(
            builder: (context, auth, _) => MaterialApp(
              supportedLocales: _localization.supportedLocales,
              localizationsDelegates: _localization.localizationsDelegates,
              debugShowCheckedModeBanner: false,
              title: 'Gracias',
              theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  primaryColor: const Color(0xFFf16682),
                  useMaterial3: true,
                  fontFamily: _localization.fontFamily),
              home: auth.isAuth
                  ? const SplashScreen()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (context, authResultSnapshot) =>
                          const AuthScreen()),
            ),
          );
        },
      ),
    );
  }
}
