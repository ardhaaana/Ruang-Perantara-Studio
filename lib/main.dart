import 'package:flutter/material.dart';
import 'package:tugas_akhir/pages/cart_pages.dart';
import 'package:tugas_akhir/pages/checkout_page.dart';
import 'package:tugas_akhir/pages/checkout_success_page.dart';
import 'package:tugas_akhir/pages/edit_profile.dart';
import 'package:tugas_akhir/pages/history_page.dart';
import 'package:tugas_akhir/pages/home/help__page.dart';
import 'package:tugas_akhir/pages/home/main_page.dart';
import 'package:tugas_akhir/pages/home/wishlist_page.dart';
import 'package:tugas_akhir/pages/home/transfer.dart';
import 'package:tugas_akhir/pages/product_pages.dart';
import 'package:tugas_akhir/pages/sign_in_page.dart';
import 'package:tugas_akhir/pages/sign_up_page.dart';
import 'package:tugas_akhir/pages/splash_page.dart';
import 'package:tugas_akhir/providers/auth_provider.dart';
import 'package:tugas_akhir/providers/transfer_provider.dart';
import 'package:tugas_akhir/providers/cart_provider.dart';
import 'package:tugas_akhir/providers/product_provider.dart';
import 'package:tugas_akhir/providers/transaction_provider.dart';
import 'package:tugas_akhir/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransferProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (contex) => SplashPage(),
          '/sign-in': (contex) => SignInPage(),
          '/sign-up': (contex) => SignUpPage(),
          '/home': (contex) => MainPage(),
          '/edit-profile': (contex) => EditProfilePage(),
          '/cart': (contex) => CartPage(),
          '/checkout': (contex) => CheckoutPage(),
          '/checkout-success': (contex) => CheckoutSuccessPage(),
          '/transfer':(contex) => TransferPage(),
          '/history':(contex) => HistoryPage(),
          '/help':(contex) => HelpPage(),
          '/wishlist':(contex) => WishListPage(),
        },
      ),
    );
  }
}
