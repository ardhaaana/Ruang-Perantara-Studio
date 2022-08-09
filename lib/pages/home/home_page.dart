import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:tugas_akhir/providers/auth_provider.dart';
import 'package:tugas_akhir/providers/product_provider.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:tugas_akhir/widgets/product_card.dart';
import 'package:tugas_akhir/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/RP1.png',
              width: 60,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ruang Perantara Studio',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            ),
           
          ],
        ),
      );
    }

    // Widget categories() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: defaultMargin,
    //     ),
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: [
    //           SizedBox(
    //             width: defaultMargin,
    //           ),
             
    //           Container(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 12,
    //               vertical: 10,
    //             ),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(12),
    //               border: Border.all(
    //                 color: subtitleColor,
    //               ),
    //               color: transparentColor,
    //             ),
    //             child: Text(
    //               'Rumah',
    //               style: subtitleTextStyle.copyWith(
    //                 fontSize: 13,
    //                 fontWeight: medium,
    //               ),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 12,
    //               vertical: 10,
    //             ),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(12),
    //               border: Border.all(
    //                 color: subtitleColor,
    //               ),
    //               color: transparentColor,
    //             ),
    //             child: Text(
    //               'Aula',
    //               style: subtitleTextStyle.copyWith(
    //                 fontSize: 13,
    //                 fontWeight: medium,
    //               ),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 12,
    //               vertical: 10,
    //             ),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(12),
    //               border: Border.all(
    //                 color: subtitleColor,
    //               ),
    //               color: transparentColor,
    //             ),
    //             child: Text(
    //               'Kantor',
    //               style: subtitleTextStyle.copyWith(
    //                 fontSize: 13,
    //                 fontWeight: medium,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget popularProductTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Kategori Desain',
          style: primaryTextStyle.copyWith(
            fontSize: 27,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Desain Interior',
          style: primaryTextStyle.copyWith(
            fontSize: 27,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: productProvider.products
              .map(
                (product) => ProductTile(product),
              )
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        //categories(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
