





import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/hello_screen.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/models/my_product.dart';
import 'package:shopping_application/providers/cart_provider.dart';
import 'package:shopping_application/providers/favorite_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تحميل الكميات مع معالجة حالة null
  await MyProducts.loadQuantities();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // علشان نقدر نغير اللغة من أي مكان في الأبلكيشن
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        locale: _locale, // اللغة المختارة
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
           fontFamily: "Suwannaphum",
          scaffoldBackgroundColor: Colors.grey.shade100,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}

