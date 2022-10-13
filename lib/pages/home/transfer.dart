// import 'package:flutter/material.dart';
// import 'package:tugas_akhir/providers/transfer_provider.dart';
// import 'package:tugas_akhir/services/transfer_service.dart';
// import 'package:tugas_akhir/theme.dart';
// import 'package:tugas_akhir/widgets/loading_button.dart';
// import 'package:provider/provider.dart';

// class TransferPage extends StatefulWidget {
//   @override
//   State<TransferPage> createState() => _TransferPage();
// }

// class _TransferPage extends State<TransferPage> {

//   TextEditingController nameController = TextEditingController(text: '');
//   TextEditingController numberController = TextEditingController(text: '');
//   TextEditingController emailController = TextEditingController(text: '');
//   //TextEditingController photoController = TextEditingController(text: '');

//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     TransferProvider transferProvider = Provider.of<TransferProvider>(context);

//     handleUpload() async {
//       setState(() {
//         isLoading = true;
//       });
//       if (await transferProvider.index(
//         email: emailController.text,
//         name: nameController.text,
//         number_rekening: numberController.text,
//         //photo: photoController.text,
//       )) {
//         Navigator.pushNamed(context, '/transfer');
//            ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: successcolor,
//             content: Text(
//               'Upload Berhasil',
//               textAlign: TextAlign.center,
//             ),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: alertColor,
//             content: Text(
//               'Upload Gagal',
//               textAlign: TextAlign.center,
//             ),
//           ),
//         );
//       }
//       setState(() {
//         isLoading = false;
//       });
//     }

//     Widget header() {
//       return Container(
//         margin: EdgeInsets.only(top: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Ruang Perantara Studio",
//               style: primaryTextStyle.copyWith(
//                 fontSize: 24,
//                 fontWeight: semibold,
//               ),
//             ),
//             SizedBox(
//               height: 2,
//             ),
//             Text(
//               "Upload Bukti Bayar",
//                style: primaryTextStyle.copyWith(
//                 fontSize: 24,
//                 fontWeight: semibold,
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//     Widget namaInput() {
//       return Container(
//         //margin: EdgeInsets.only(top: 70),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Nama Pemilik Rekening",
//               style: primaryTextStyle.copyWith(
//                 fontSize: 16,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 50,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               decoration: BoxDecoration(
//                 color: backgroundColor1,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         style: primaryTextStyle,
//                         controller: nameController,
//                         decoration: InputDecoration.collapsed(
//                           hintText: 'Masukan Nama Pemilik Rekening',
//                           hintStyle: subtitleTextStyle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//     Widget rekeningInput() {
//       return Container(
//         //margin: EdgeInsets.only(top: 70),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Nomor Rekening",
//               style: primaryTextStyle.copyWith(
//                 fontSize: 16,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 50,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               decoration: BoxDecoration(
//                 color: backgroundColor1,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         style: primaryTextStyle,
//                         controller: numberController,
//                         decoration: InputDecoration.collapsed(
//                           hintText: 'Masukan Nomor Rekening',
//                           hintStyle: subtitleTextStyle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//  Widget emailInput() {
//       return Container(
//         //margin: EdgeInsets.only(top: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Email",
//               style: primaryTextStyle.copyWith(
//                 fontSize: 16,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 50,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               decoration: BoxDecoration(
//                 color: backgroundColor1,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
                  
//                     Expanded(
//                       child: TextFormField(
//                         style: primaryTextStyle,
//                         controller: emailController,
//                         decoration: InputDecoration.collapsed(
//                           hintText: 'Masukan Email',
//                           hintStyle: subtitleTextStyle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     Widget uploadButton() {
//       return Container(
//         height: 50,
//         width: double.infinity,
//         margin: EdgeInsets.only(top: 30),
//         child: TextButton(
//           onPressed: handleUpload,
//           style: TextButton.styleFrom(
//             backgroundColor: primaryColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//           child: Text(
//             'Upload',
//             style: primaryTextStyle.copyWith(
//               fontSize: 16,
//               fontWeight: medium,
//             ),
//           ),
//         ),
//       );
//     }

    
//     return Scaffold(
//       backgroundColor: backgroundColor1,
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Container(
//           margin: EdgeInsets.symmetric(
//             horizontal: defaultMargin,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               header(),
//               namaInput(),
//               rekeningInput(),
//               emailInput(),
//               isLoading ? LoadingButton() : uploadButton(),
//               Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

    
    
    

    // ignore_for_file: unused_import, use_key_in_widget_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, avoid_print, unused_field, prefer_is_empty

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
    
    class TransferPage extends StatefulWidget {
      @override
      _HomeState createState() => _HomeState();
    }
    
    class _HomeState extends State<TransferPage> {
    
      XFile image;
    
      List _images = [];
    
      final ImagePicker picker = ImagePicker();
    
      //we can upload image from camera or from gallery based on parameter
      Future sendImage(ImageSource media) async {
    
        var img = await picker.pickImage(source: media);
    
        var uri = "172.16.45.161/flutter_upload_image/create.php";
    
        var request = http.MultipartRequest('POST', Uri.parse(uri));
    
        if(img != null){
    
          var pic = await http.MultipartFile.fromPath("image", img.path);
    
          request.files.add(pic);
    
          await request.send().then((result) {
    
            http.Response.fromStream(result).then((response) {
    
              var message = jsonDecode(response.body);
    
              // show snackbar if input data successfully
              final snackBar = SnackBar(content: Text(message['message']));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
              //get new list images 
              getImageServer();
            });
    
          }).catchError((e) {
    
            print(e);
    
          });
        }
    
      }
    
      Future getImageServer() async {
        try{
    
          final response = await http.get(Uri.parse('172.16.45.161/flutter_upload_image/list.php'));
    
          if(response.statusCode == 200){
            final data = jsonDecode(response.body);
    
            setState(() {
              _images = data;
            });
          }
    
        }catch(e){
    
          print(e);
          
        }
      }
    
      @override
      void initState() {
        // ignore: todo
        // TODO: implement initState
        super.initState();
        getImageServer();
      }
    
      //show popup dialog
      void myAlert() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                title: Text('Please choose media to select'),
                content: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: [
                      ElevatedButton(
                        //if user click this button, user can upload image from gallery
                        onPressed: () {
                          Navigator.pop(context);
                          sendImage(ImageSource.gallery);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.image),
                            Text('From Gallery'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        //if user click this button. user can upload image from camera
                        onPressed: () {
                          Navigator.pop(context);
                          sendImage(ImageSource.camera);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera),
                            Text('From Camera'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Upload Bukti Transfer'),
            actions: [
              IconButton(
                onPressed: () => myAlert(), 
                icon: Icon(
                  Icons.upload
                  ),
              )],
          ),
          body: _images.length != 0 ? 
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            itemCount: _images.length,
            itemBuilder: (_, index){
              // return Padding(
              //   padding: EdgeInsets.all(10),
              //   child: Image(
              //     image: NetworkImage('http://192.168.1.13/flutter_upload_image/images/'+_images[index]['image']),
              //     fit: BoxFit.cover,
              //   ),
              // );
            }
          ) : Center(child: Text("No Image"),)
        );
      }
    }
