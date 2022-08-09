import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:tugas_akhir/providers/transaction_provider.dart';
import 'package:tugas_akhir/services/transaction_service.dart';
import 'package:tugas_akhir/models/transaction_model.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:tugas_akhir/widgets/transaction_card.dart';
import 'package:tugas_akhir/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../providers/auth_provider.dart';
import '../widgets/cart_card.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context);
    transactionProvider.getTransactions(user);
    print('jumlah produk homepage: ${transactionProvider.transactions.length}');

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        centerTitle: true,
        title: Text(
          'Histori Pembelian',
        ),
        elevation: 0,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/icon_empty_cart.png',
            //   width: 80,
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Keranjang Kosong',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            // Text(
            //   'Let\'s Find your favorite product',
            //   style: subtitleTextStyle,
            // ),
            Container(
              width: 154,
              height: 44,
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Kembali ke home',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: transactionProvider.transactions
            .map(
              (transaction) => TransactionCard(transaction),
            )
            .toList(),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: header(),
      body: transactionProvider.transactions.length == 0 ? emptyCart() : content(),
      bottomNavigationBar:
          transactionProvider.transactions.length == 0 ? SizedBox() : null,
    );
  }
}