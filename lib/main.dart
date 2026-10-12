import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StorePage(),
    );
  }
}

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<Map> products = [
    {"name": "تيشيرت اسود", "price": 79},
    {"name": "كاب", "price": 45},
    {"name": "حذاء", "price": 149},
    {"name": "ساعة", "price": 199},
    {"name": "حقيبة", "price": 89},
    {"name": "نظارة", "price": 60},
  ];
  List<Map> cart = [];

  int get total {
    int s = 0;
    for (var p in cart) s += p["price"] as int;
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("متجري الصغير 🛒"), backgroundColor: Colors.black87, centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: products.length,
              itemBuilder: (c, i) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.shopping_bag, size: 40),
                        Text(products[i]["name"], style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("${products[i]["price"]} ريال", style: TextStyle(color: Colors.green)),
                        ElevatedButton(onPressed: () {
                          setState(() { cart.add(products[i]); });
                        }, child: Text("أضف")),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text("المجموع: $total ريال - السلة: ${cart.length}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {},
                    child: Text("اطلب عبر واتساب", style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}