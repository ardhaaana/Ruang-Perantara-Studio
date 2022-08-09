import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/product_model.dart';
import 'package:tugas_akhir/models/transaction_model.dart';
import 'package:tugas_akhir/providers/cart_provider.dart';
import 'package:tugas_akhir/providers/transaction_provider.dart';
import 'package:tugas_akhir/providers/product_provider.dart';
import 'package:tugas_akhir/theme.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir/widgets/product_card.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context);
  
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(
          0,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
             ClipRRect(
            borderRadius: BorderRadius.circular(12),
            // child: Image.network(
            //   transaction.galleries[0].url,
            //   width: 20,
            // ),
          ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status Pembelian : " + transaction.status,
                    style: alertTextStyle.copyWith(
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    "ID Transaksi : " + transaction.id.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    "Pembayaran : " + transaction.payment.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                   Text(
                    NumberFormat.simpleCurrency(name: 'Total Harga :' +
                    'Rp.',decimalDigits:0).format(transaction.total_price),
                    style: blackTextStyle,
                    ), 
                  // Text(
                  //   "Total Harga : " + 'Rp. ${transaction.total_price}',
                  //   style: blackTextStyle,
                  // ),
                  // Text(
                  //   "Tanggal Transaksi : " + transaction.DateFormat('dd-MM-yyyy').createdAt.toString(),
                  //   style: 
                  //   primaryTextStyle.copyWith(
                  //     fontWeight: medium,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}