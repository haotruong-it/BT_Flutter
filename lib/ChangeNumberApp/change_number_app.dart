import 'package:flutter/material.dart';

class ChangeNumberApp extends StatefulWidget {
  const ChangeNumberApp({super.key});

  @override
  State<ChangeNumberApp> createState() => _ChangeNumberAppState();
}

class _ChangeNumberAppState extends State<ChangeNumberApp> {
  int number = 0;

  void increase() {
    setState(() {
      number++;
    });
  }

  void decrease() {
    setState(() {
      number--;
    });
  }

  void reset() {
    setState(() {
      number = 0;
    });
  }

  Color getTextColor() {
    if (number > 0) return Colors.green;
    if (number < 0) return Colors.red;
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: myBody(),
    );
  }

  myAppBar() {
    return AppBar(
      title: const Text('📱 Ứng dụng Đếm Số'),
      backgroundColor: Colors.blue,
      centerTitle: true,
    );
  }

  myBody() {
    return Container(
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Giá trị hiện tại:"),
          Text(
            "$number",
            style: TextStyle(
              fontSize: 60,
              color: getTextColor(),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decrease,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Giảm"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: reset,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text("Đặt lại"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: increase,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Tăng"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
