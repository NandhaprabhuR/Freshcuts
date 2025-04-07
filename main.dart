import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart'; // For SystemChrome
import 'firebase_options.dart';
import 'Screens/cart.dart';
import 'Screens/customerpage.dart';
import 'Screens/cart_provider.dart';
import 'Screens/auth_wrapper.dart';
import 'Screens/auth_provider.dart' as local_auth;
import 'Screens/theme_provider.dart';
import 'Screens/profile.dart'; // Import ProfilePage
import 'Screens/yourorders.dart'; // Import YourOrdersPage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set the app to full-screen mode (hide status bar and navigation bar)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarBrightness: Brightness.light, // For iOS
      statusBarIconBrightness: Brightness.dark, // Dark icons for light background
      systemNavigationBarColor: Colors.transparent, // Transparent navigation bar
      systemNavigationBarIconBrightness: Brightness.dark, // Dark icons for navigation
    ),
  );

  runApp(const FreshCutsApp());
}

class FreshCutsApp extends StatelessWidget {
  const FreshCutsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => local_auth.AuthProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fresh Cuts',
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => AuthWrapper(),
              '/customer': (context) => CustomerPage(),
              '/cart': (context) => CartPage(),
              '/profile': (context) => ProfilePage(),
              '/your_orders': (context) => YourOrdersPage(),
            },
          );
        },
      ),
    );
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent, // Make AppBar transparent
      elevation: 0, // Remove AppBar shadow
      foregroundColor: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent, // Make AppBar transparent
      elevation: 0, // Remove AppBar shadow
      foregroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}