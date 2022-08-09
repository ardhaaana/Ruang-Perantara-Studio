import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/product_model.dart';
import 'package:tugas_akhir/providers/cart_provider.dart';
import 'package:tugas_akhir/providers/wishlist_provider.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  ProductPage(this.product);
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
   
  ];

  List familiarShoes = [
   
   
   
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    WishListProvider wishlistProvider = Provider.of<WishListProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Future<void> showSuccesDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                 
                  SizedBox(
                    height: 12,
                  ),

                  Text(
                    'Desain berhasil ditambahkan',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: backgroundColor2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Lihat Keranjang',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffc4c4c4),
        ),
      );
    }

    Widget familiarShoesCart(String imageurl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageurl),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left_outlined,
                  ),
                  
                ),
                Text(
              "Ruang Perantara Studio",
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
            ),
               
               
              ],
            ),
          ),
          //foto manual
          CarouselSlider(
            items: widget.product.galleries
                .map(
                  
                   (image) => Image.network(
                    image.url,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }


    Widget content() {
      int index = -1;
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 17,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          widget.product.category.name,
                          style: secondaryTextStyle.copyWith(
                            fontSize: 13,
                          ),  
                        ),
                        
                      ],
                    ),
                  ),
                 
                ],
              ),
            ),
             Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    widget.product.description,
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: 2,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: backgroundColor1,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga : ',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  
                  Text(
                    NumberFormat.simpleCurrency(name: 
                    'Rp.',decimalDigits:0).format(widget.product.price),
                    style: secondaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semibold),
                    ),
                  
                ],
              ),
            ),
           
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 62,
                      child: TextButton(
                        onPressed: () {
                          cartProvider.addCart(widget.product);
                          wishlistProvider.setProduct(widget.product);

                      if (wishlistProvider.isWishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: successcolor,
                            content: Text(
                              'Ditambahkan di favorit',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              'Daftar barang terhapus dari favorit',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                        },
                        style: TextButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor,
                        ),
                        child: Text(
                          'Tambahkan ke favorit',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 62,
                      child: TextButton(
                        onPressed: () {
                          cartProvider.addCart(widget.product);
                          showSuccesDialog();
                        },
                        style: TextButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: alertColor,
                        ),
                        child: Text(
                          'Tambahkan ke keranjang',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
