import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color currentColor = Colors.purple;
  final List<Color> colors = [
    Colors.purple,
    Colors.orange,
    Colors.green,
    Colors.blue
  ];

  void changeColor() {
    final random = Random();
    setState(() {
      currentColor = colors[random.nextInt(colors.length)];
    });
  }

  void resetColor() {
    setState(() {
      currentColor = Colors.purple;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: myBody(),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text("🎨 Ứng dụng Đổi màu nền"),
      backgroundColor: Colors.green,
      centerTitle: true,
    );
  }

  Widget myBody() {
    return Container(
      color: currentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Màu sắc hiện tại",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            currentColor == Colors.purple
                ? "Tím"
                : currentColor == Colors.orange
                    ? "Cam"
                    : currentColor == Colors.green
                        ? "Xanh lá"
                        : "Xanh dương",
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: changeColor,
                child: const Text("Đổi màu"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: resetColor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text("Đặt lại"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
