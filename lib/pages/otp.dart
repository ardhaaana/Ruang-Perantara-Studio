// import 'package:flutter/material.dart';
// import 'package:email_auth/email_auth.dart';

// class OtpPage extends StatefulWidget{
//   @override 
//   _OtpPageState createState() => _OtpPageState();
//    EmailAuth emailAuth;
// }

// class _OtpPageState extends State<OtpPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();

// void sendOTP() async{
//   EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");
  
//   var res = await EmailAuth.sendOtp(recieverMail: _emailController.text);
//   if (res){
//     print("OTP Sent");
//   }else{
//     print("OTP Belum Terkirim");
//   }
// }

// void verifyOTP(){
//   var res = EmailAuth.validate(
//     recieverMail: _emailController.text, userOTP: _otpController.text);
//     if (res){
//       print("OTP verified");
//     }else{
//       print("invalid OTP");
//     }
// }

//   @override 
//   Widget build(BuildContext context){
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Verify Email"),
//       ),
//       body:
//         Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//               TextField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   hintText: "Enter email",
//                   labelText: "email",
//                   suffixIcon: TextButton(
//                     child: Text("Send OTP"),
//                     onPressed: ()=> sendOtp(),
//                   )),
//                 ),
//                 SizedBox(
//                   height: 30.0,
//                 ),
//                 TextField(
//                   controller: _otpController,
//                   keyboardType: TextInputType.number,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: "ENter OTP",
//                     labelText: "OTP",
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.0,
//                 ),
//                 ElevatedButton(
//                   child: Text("Verify OTP"),
//                   onPressed: ()=> verifyOTP(),
//                   )
//             ],
//               ),
        
            
//             ),
//         );
//   }
// }