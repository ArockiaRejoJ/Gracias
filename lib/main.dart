import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/models/products_model.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_assignment_app/providers/category_provider.dart';
import 'package:flutter_assignment_app/providers/order_provider.dart';
import 'package:flutter_assignment_app/providers/product_provider.dart';
import 'package:flutter_assignment_app/screens/splash_screens.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

mixin AppLocale {
  static const String title = 'title';

  static const Map<String, dynamic> EN = {
    title: 'English',
  };
  static const Map<String, dynamic> AR = {
    title: 'العربية',
  };
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
        const MapLocale(
          'en',
          AppLocale.EN,
          countryCode: 'US',
          fontFamily: 'Font EN',
        ),
        const MapLocale(
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
          value: ProductsModel(),
        ),
        ChangeNotifierProxyProvider(
          create: (_) => ProductProvider([], []),
          update: (context, auth, previousData) => ProductProvider(
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
        ChangeNotifierProxyProvider(
          create: (_) => CartProvider([], [], [], ''),
          update: (context, auth, previousData) => CartProvider(
            previousData == null ? [] : previousData.cartItems,
            previousData == null ? [] : previousData.cartProdductItems,
            previousData == null ? [] : previousData.lineItems,
            null,
          ),
        ),
        ChangeNotifierProxyProvider(
          create: (_) => OrderProvider([]),
          update: (context, auth, previousData) => OrderProvider(
            previousData == null ? [] : previousData.orderItems,
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            supportedLocales: _localization.supportedLocales,
            localizationsDelegates: _localization.localizationsDelegates,
            debugShowCheckedModeBanner: false,
            title: 'Gracias',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                primaryColor: const Color(0xFFf16682),
                useMaterial3: true,
                fontFamily: _localization.fontFamily),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
