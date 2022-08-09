import 'package:flutter/material.dart';
import 'package:tugas_akhir/providers/wishlist_provider.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:tugas_akhir/widgets/wishlist_cart.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishListProvider wishlistProvider = Provider.of<WishListProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        centerTitle: true,
        title: Text(
          'Favorit desain',
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              SizedBox(
                height: 23,
              ),
              Text(
                'Data favorit kosong',
                style: primaryTextStyle.copyWith(
                  fontSize: 25,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () { Navigator.pushNamed(context, '/home');},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Kembali ke home',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: wishlistProvider.wishlist
                .map(
                  (product) => WishlistCard(product),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // emptyWishlist(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content(),
      ],
    );
  }
}
