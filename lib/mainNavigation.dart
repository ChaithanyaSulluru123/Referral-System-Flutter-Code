// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shop_referral_app/screens/my_referrals.dart';
import 'package:shop_referral_app/screens/my_wallet.dart';
import 'package:shop_referral_app/screens/refer_new_shop.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    AddNewShopScreen(),
    MyReferralsScreen(),
    MyWalletScreen(),

  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(child: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
    ),
    bottomNavigationBar: NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index){
        setState(() {
          selectedIndex = index;
        });
      },
      destinations: const[
        NavigationDestination(icon: Icon(Icons.add_business_outlined),
        selectedIcon: Icon(Icons.add_business),
        label: "Add Shop",
      ),
      NavigationDestination(icon: Icon(Icons.store_outlined),
        selectedIcon: Icon(Icons.store),
        label: "My Referrals",
      ),
      NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined),
        selectedIcon: Icon(Icons.account_balance_outlined),
        label: "My Wallet",
      ),     
      ]),
    );
  }
}