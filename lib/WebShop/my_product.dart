import 'package:flutter/material.dart';
import 'api.dart';

class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final double rate;
  final int count;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.rate,
    required this.count,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: double.tryParse(json["price"].toString()) ?? 0,
      rate: double.tryParse(json["rating"]["rate"].toString()) ?? 0,
      count: json["rating"]["count"],
    );
  }
}

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Container(
          height: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 10),
              Expanded(  // **fix overflow chỗ này**
                child: Text(
                  "Tìm laptop, PC, gaming...",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          buildFlashSaleBanner(),

          Expanded(
            child: FutureBuilder<List<Product>>(
              future: testApi.getAllProduct(),
              builder: (context, snap) {
                if (snap.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snap.hasError) {
                  return Center(child: Text("Lỗi: ${snap.error}"));
                }
                return buildGrid(snap.data!);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFlashSaleBanner() {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.orange],
        ),
        borderRadius: BorderRadius.circular(10),
      ),

      child: const Center(
        child: Text(
          "🔥 FLASH SALE - DEAL CỰC SỐC 🔥",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(offset: Offset(1, 1), color: Colors.black38),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGrid(List<Product> ls) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: ls.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.64,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (_, i) => buildShopeeItem(ls[i]),
    );
  }

  Widget buildShopeeItem(Product p) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(8)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(p.image, fit: BoxFit.cover),
                ),
              ),

              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(8)),
                  ),
                  child: const Text(
                    "-15%",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 4,
                left: 4,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white.withOpacity(0.7),
                  child: const Icon(Icons.favorite_border,
                      size: 16, color: Colors.red),
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    Text(
                      "\$${p.price}",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 4),

                    Text(
                      "\$${(p.price * 1.2).toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 14),
                    Text(" ${p.rate}   "),

                    Text(
                      "Đã bán ${p.count}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.green,
                  ),
                  child: const Text(
                    "FREESHIP XTRA",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
