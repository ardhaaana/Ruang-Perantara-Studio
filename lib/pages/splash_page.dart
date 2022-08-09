import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tugas_akhir/providers/product_provider.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/RP1.png'))),
        ),
      ),
    );
  }
}
