import 'package:flutter/material.dart';
import 'package:p2/detail.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  dynamic _productField(TextEditingController controller, String label) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  void save() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductDetail(
              kode: _kodeController.text,
              nama: _namaController.text,
              harga: int.parse(_hargaController.text),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: const Icon(Icons.menu),
        ),
        title: const Text("ProductForm"),
        actions: const [Icon(Icons.person)],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              _productField(_kodeController, "Kode Product"),
              _productField(_namaController, "Nama Product"),
              _productField(_hargaController, "Harga Product"),
              ElevatedButton(
                  onPressed: () {
                    save();
                  },
                  child: const Text("Save")),
              Placeholder(
                fallbackHeight: 1000,
              )
            ],
          ),
        ),
      ),
    );
  }
}
