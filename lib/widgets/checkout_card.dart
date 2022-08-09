import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/keranjang_model.dart';
import 'package:tugas_akhir/theme.dart';

class CheckoutCard extends StatelessWidget {
  final KeranjangModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: boxcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
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
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Rp. ${cart.product.price}',
                  style: secondaryTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            'Jumlah : ${cart.quantity}',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
