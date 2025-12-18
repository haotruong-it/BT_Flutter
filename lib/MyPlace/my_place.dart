import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  const Place({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView( // dùng ListView để cuộn được
        children: [
          block1(),
          block2(),
          block3(),
          block4(),
        ],
      ),
    );
  }

  // Block 1: Hình ảnh
  Widget block1() {
   return Image.network(
      "https://images.unsplash.com/photo-1747525667588-5e0eb9952c63?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      width: double.infinity,
      height: 300,
      fit: BoxFit.cover,
    );
  }

  // Block 2: Tiêu đề + địa điểm + rating
  Widget block2() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.star, color: Colors.red),
          const Text("41"),
        ],
      ),
    );
  }

   // Block 3: 3 nút CALL - ROUTE - SHARE
  Widget block3() {
    Color color = Colors.blue;

    Column buildButtonColumn(IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, "CALL"),
          buildButtonColumn(Icons.near_me, "ROUTE"),
          buildButtonColumn(Icons.share, "SHARE"),
        ],
      ),
    );
  }
  // Block 4: Mô tả
  Widget block4() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. "
        "Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. "
        "A gondola ride from Kandersteg, followed by a half-hour walk through pastures "
        "and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. "
        "Activities enjoyed here include rowing, and riding the summer toboggan run.",
        softWrap: true,
      ),
    );
  }
}

