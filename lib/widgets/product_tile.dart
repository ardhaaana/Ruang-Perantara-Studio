import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/product_model.dart';
import 'package:tugas_akhir/pages/product_pages.dart';
import 'package:tugas_akhir/theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
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
        margin: EdgeInsets.only(
          right: defaultMargin,
          left: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:
                  Image.network(
                    product.galleries[0].url,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
              
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Kategori",
                  //    style: primaryTextStyle.copyWith(
                  //     fontSize: 12,
                  //     fontWeight: semibold,
                  //   ),
                  //   ),
                  Text(
                    product.category.name,
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.name,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
