import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/keranjang_model.dart';
import 'package:tugas_akhir/providers/cart_provider.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class CartCard extends StatelessWidget {
  final KeranjangModel cart;

  CartCard(this.cart);
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor1,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        children: [  
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              cart.product.galleries[0].url,
              width: 20,
            ),
              ),
              
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.product.name,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                    NumberFormat.simpleCurrency(name: 
                    'Rp.',decimalDigits:0).format(cart.product.price),
                     style: secondaryTextStyle,
                    ),
                    // Text(
                    //   'Rp. ${cart.product.price}',
                    //   style: secondaryTextStyle,
                    // ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  Text("Jumlah"),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                   GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/add.png',
                      width: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/delete.png',
                      width: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_remove.png',
                  width: 10,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Hapus Barang',
                  style: alertTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
