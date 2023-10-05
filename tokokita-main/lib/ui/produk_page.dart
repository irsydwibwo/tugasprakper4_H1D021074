import 'package:flutter/material.dart';
import 'package:project_flutter/model/produk.dart';
import 'package:project_flutter/ui/produk_detail.dart';
import 'package:project_flutter/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);
  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Produk Irsyad'),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  child: const Icon(Icons.add, size: 26.0),
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProdukForm()));
                  },
                ))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.logout),
                onTap: () async {},
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            ItemProduk(
                produk: Produk(
                    id: 1,
                    kodeProduk: 'A111',
                    namaProduk: 'iPhone 15 Pro Max',
                    hargaProduk: 18200300)),
            ItemProduk(
                produk: Produk(
                    id: 2,
                    kodeProduk: 'A222',
                    namaProduk: 'Laptop Asus ROG',
                    hargaProduk: 35000000)),
            ItemProduk(
                produk: Produk(
                    id: 3,
                    kodeProduk: 'A333',
                    namaProduk: 'Rexus Daxa Air II Wireless',
                    hargaProduk: 650000)),
          ],
        ));
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      produk: produk,
                    )));
      },
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk!),
          subtitle: Text(produk.hargaProduk.toString()),
        ),
      ),
    );
  }
}
