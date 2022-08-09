import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/product_model.dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:tugas_akhir/models/transaction_model.dart';
import 'package:tugas_akhir/providers/auth_provider.dart';
import 'package:tugas_akhir/pages/history_page.dart';
import 'package:tugas_akhir/pages/checkout_page.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor3,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            child: Row(
              children: [
                ClipOval(
                  // child: Image.asset(
                  //   'assets/image_profile.png',
                  //   width: 64,
                  // ),
                ),
                SizedBox(
                  width: 16,
                ),
               
               
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: backgroundColor3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Akun',
                style: primaryTextStyle.copyWith(
                    fontWeight: semibold, fontSize: 25),
              ),
              Text(
                'Selamat Datang, ${user.name}',
                 style: primaryTextStyle.copyWith(
                 fontSize: 16,
                 fontWeight: semibold,
                 ),
                ),
              Text(
                '@${user.email}',
                style: subtitleTextStyle.copyWith(
                fontSize: 16,
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem(
                  'Profil',
                  
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/history');
                },
                child: menuItem(
                'Histori Pembelian',
              ),
              
            ),

            
             GestureDetector(
              onTap:() {
                Navigator.pushNamed(context, "/wishlist");
              },
              child: menuItem(
                'Favorit',
              ),
            ),

            GestureDetector(
              onTap:() {
                Navigator.pushNamed(context, "/help");
              },
              child: menuItem(
                'Bantuan',
              ),
            ),
              SizedBox(
                height: 30,
              ),
           
               GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                  child: menuItem(
                    'Logout',
                  ),
                ),
                
              // Text(
              //   'General',
              //   style: primaryTextStyle.copyWith(
              //       fontWeight: semibold, fontSize: 16),
              // ),
              // menuItem(
              //   'Privacy & Policy',
              // ),
              // menuItem(
              //   'Term Of Service',
              // ),
              // menuItem(
              //   'Rate App',
              // ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
