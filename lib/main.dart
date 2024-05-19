import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/home_page.dart';
import 'screens/profile_page.dart';
import 'screens/favorites_page.dart';
import 'screens/bucket_screen.dart'; // Updated import
import 'screens/notifications_page.dart';
import 'screens/login_page.dart';
import 'screens/sign_up_page.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_page.dart';
import 'models/bucket_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  stripe.Stripe.publishableKey = "your_publishable_key"; // Set your Stripe publishable key here
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData customLightTheme = ThemeData(
      primarySwatch: Colors.blue,
      textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      ),
    );

    ThemeData customDarkTheme = ThemeData.dark().copyWith(
      textTheme: GoogleFonts.latoTextTheme(
        ThemeData.dark().textTheme,
      ),
    );

    return ChangeNotifierProvider(
      create: (context) => BucketModel(),
      child: MaterialApp(
        title: 'Travel App',
        theme: customLightTheme,
        darkTheme: customDarkTheme,
        home: SplashScreen(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          // Add other supported locales here
        ],
        routes: {
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/profile': (context) => ProfilePage(),
          '/favorites': (context) => FavoritesPage(),
          '/bucket': (context) => BucketScreen(), // Updated route
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
