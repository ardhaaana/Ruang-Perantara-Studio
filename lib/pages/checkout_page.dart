import 'package:flutter/material.dart';
import 'package:tugas_akhir/providers/auth_provider.dart';
import 'package:tugas_akhir/providers/cart_provider.dart';
import 'package:tugas_akhir/providers/transaction_provider.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:tugas_akhir/widgets/checkout_card.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleCheckout() async {
      if (await transactionProvider.checkout(
        authProvider.user.token,
        cartProvider.carts,
        cartProvider.totalPrice()
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }
    }

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        elevation: 0,
        centerTitle: true,
        title: Text('Detail Pesanan'),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Pesanan',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => CheckoutCard(cart),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: boxcolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rekening Pembayaran',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/bri.png',
                          width: 40,
                        ),
                        
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BRI',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                          ),
                        ),
                        
                        Text(
                          '9256788787978976',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        
                      ],
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: boxcolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pembayaran ',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Harga Produk',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
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
                    //   style: primaryTextStyle.copyWith(fontWeight: medium),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pengiriman',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      'Email',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jumlah',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                    NumberFormat.simpleCurrency(name: 
                    'Rp.',decimalDigits:0).format(cartProvider.totalItems()),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                    // Text(
                    //   '${cartProvider.totalItems()}',
                    //   style: primaryTextStyle.copyWith(fontWeight: medium),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: secondaryTextStyle.copyWith(fontWeight: semibold),
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
                    //   style: secondaryTextStyle.copyWith(fontWeight: semibold),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Divider(
            thickness: 1,
            color: Color(0xff2E3141),
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: defaultMargin,
            ),
            child: TextButton(
              onPressed: handleCheckout,
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Proses',
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
