import 'package:flutter/material.dart';
import 'package:shop_referral_app/mainNavigation.dart';

void main() {
  runApp(const ShopReferralApp());
}

class ShopReferralApp extends StatelessWidget {
  const ShopReferralApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Referral',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF16865C),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9F8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

