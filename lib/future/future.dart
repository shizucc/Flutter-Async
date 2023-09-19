import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CobaFuture extends StatefulWidget {
  const CobaFuture({super.key});

  @override
  State<CobaFuture> createState() => _CobaFutureState();
}

class _CobaFutureState extends State<CobaFuture> {
  Future function1() async {
    print("Hai");
    // Loading
    await Future.delayed(Duration(seconds: 10));
    print("Data Selesai di load");
  }

  Future<List<Map<String, dynamic>>> function2() async {
    // Tentukan Link API
    await Future.delayed(Duration(seconds: 3));
    String linkApi = 'http://localhost:8080/Flutter/index.php';
    // Proses API
    // - Ngecek Koneksi
    Uri uriApi = Uri.parse(linkApi);
    final response = await http.get(uriApi);

    if (response.statusCode == 200) {
      print("Berhasil Menghubungi server");
      final List<dynamic> content = json.decode(response.body);

      final List<Map<String, dynamic>> content2 =
          List<Map<String, dynamic>>.from(content.map((item) {
        return {
          'id': item['id'] as String,
          'nama': item['nama'] as String,
          'jurusan': item['jurusan'] as String,
        };
      }));
      return content2;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Future"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Text("Data Mahasiswa"),
            FutureBuilder(
                future: function2(),
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    print("Error");
                    return Text("Internet error");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    print("Loading data...");
                    return const CircularProgressIndicator();
                  } else {
                    var mahasiswa = snapshot.data ?? [];
                    mahasiswa.forEach((item) {
                      print("$item");
                    });
                    return Text("Data berhasil diload");
                  }
                }))
          ],
        ),
      ),
    );
  }
}
