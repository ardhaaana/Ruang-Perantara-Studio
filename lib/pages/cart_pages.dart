import 'package:flutter/material.dart';
import 'package:tugas_akhir/providers/cart_provider.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:tugas_akhir/widgets/cart_card.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        centerTitle: true,
        title: Text(
          'Keranjang',
        ),
        elevation: 0,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/empty-cart.png',
              width: 180,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Keranjang kosong',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
          
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
        children: cartProvider.carts
            .map(
              (cart) => CartCard(cart),
            )
            .toList(),
      );
    }

    Widget customButtomNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Pembelian',
                    style: primaryTextStyle,
                  ),
                  Text(
                    NumberFormat.simpleCurrency(name: 
                    'Rp.',decimalDigits:0).format(cartProvider.totalPrice()),
                    style: secondaryTextStyle.copyWith(
                        fontSize: 16, 
                        fontWeight: semibold),
                    ),
                  // Text(
                  //   'Rp. ${cartProvider.totalPrice()}',
                  //   style: secondaryTextStyle.copyWith(
                  //     fontSize: 16,
                  //     fontWeight: semibold,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 0.4,
              color: subtitleColor,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lanjut Beli',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: cartProvider.carts.length == 0 ? emptyCart() : content(),
      bottomNavigationBar:
          cartProvider.carts.length == 0 ? SizedBox() : customButtomNav(),
    );
  }
}
