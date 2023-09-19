import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String kode;
  final String nama;
  final int harga;
  const ProductDetail(
      {super.key, required this.kode, required this.nama, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Product"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("Kode product is $kode hehe"),
            Text("Nama Produk is $nama"),
            Text("Harga Produk is $harga"),
          ],
        ),
      ),
    );
  }
}
