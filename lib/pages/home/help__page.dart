import 'package:flutter/material.dart';

import 'package:flutter/services.Dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:tugas_akhir/providers/auth_provider.dart';
import 'package:tugas_akhir/providers/product_provider.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:provider/provider.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
    appBar: AppBar(
      title: Text('Bantuan'),
      backgroundColor: backgroundColor2,
    ),
    body: Center(
      child: Text('Jika ingin melakukan konsultasi dalam pembuatan desain interior dapat menghubungi nomor Whatsapp = 0895326290907 dan email = ruangperantara@gmail.com')
    ),
    
    
  );
  
  
  }  
}

