import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/product_model.dart';
import 'package:tugas_akhir/pages/home/home_page.dart';
import 'package:tugas_akhir/providers/wishlist_provider.dart';
import 'package:tugas_akhir/providers/product_provider.dart';
import 'package:tugas_akhir/pages/product_pages.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishListProvider wishlistProvider = Provider.of<WishListProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    
     return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product),
          ),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.galleries[0].url,
              width: 80,
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
                  product.name,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 20,
                  ),
                ),

                Text(
                    NumberFormat.simpleCurrency(name: 
                    'Rp.',decimalDigits:0).format(product.price),
                    style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 20),
                    ),
                // Text(
                //   'Rp. ${product.price}',
                //   style: primaryTextStyle.copyWith(
                //     fontWeight: semibold,
                //     fontSize: 20,
                //   ),
                // ),
              ],
              
            ),
            
          ),
          
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/remove.png',
              width: 20,
            ),
          ),
        ],
      ),
      ),
    );
  }
}
