import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:tugas_akhir/providers/auth_provider.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:tugas_akhir/services/profile_service.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameController = TextEditingController();

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passController = TextEditingController();

  String _token = "";

  simpanHandler(UserModel user) async {
    user.name = nameController.text;
    user.email = emailController.text;
    user.username = usernameController.text;

    if (await ProfileService()
        .updateProfile(user, passController.text, usernameController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Berhasil Update Profile',
            textAlign: TextAlign.center,
          ),
        ),
      );
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profil',
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.check,
        //       color: primaryColor,
        //     ),
        //   ),
        // ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: nameController,
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '${user.name}',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: usernameController,
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '${user.username}',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: emailController,
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '${user.email}',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: passController,
              obscureText: true,
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget submitInput() {
      return Container(
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            ),
            child: Text(
              "Simpan", 
              style: secondaryTextStyle.copyWith(
                fontSize: 20,
              ),
              ),
            onPressed: (() {
              setState(() {
                _token = user.token;
              });
              simpanHandler(user);
            }),
          ));
    }

    Widget content() {
      return SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   width: 100,
              //   height: 100,
              //   margin: EdgeInsets.only(
              //     top: defaultMargin,
              //   ),
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
                  // image: DecorationImage(
                  //   image: AssetImage('assets/image_profile.png'),
                  // ),
              //   ),
              // ),
              nameInput(),
              usernameInput(),
              emailInput(),
              passInput(),
              submitInput()
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: true,
    );
  }
}