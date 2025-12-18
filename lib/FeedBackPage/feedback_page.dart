import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  int? rating; // dùng int cho gọn

  void _submitFeedback() {
    final name = nameController.text.trim();
    final content = contentController.text.trim();

    if (name.isEmpty || content.isEmpty || rating == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đầy đủ thông tin'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Cảm ơn $name đã đánh giá $rating sao.\nNội dung: $content'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );

    nameController.clear();
    contentController.clear();
    setState(() {
      rating = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text("Gửi phản hồi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Họ tên
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Họ tên",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Đánh giá sao (menu)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      rating == null
                          ? "Chọn số sao đánh giá"
                          : "Đánh giá $rating sao",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  PopupMenuButton<int>(
                    onSelected: (value) {
                      setState(() {
                        rating = value;
                      });
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 1, child: Text("1 sao")),
                      PopupMenuItem(value: 2, child: Text("2 sao")),
                      PopupMenuItem(value: 3, child: Text("3 sao")),
                      PopupMenuItem(value: 4, child: Text("4 sao")),
                      PopupMenuItem(value: 5, child: Text("5 sao")),
                    ],
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Nội dung góp ý
            TextField(
              controller: contentController,
              maxLines: 4,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.edit_note),
                labelText: "Nội dung góp ý",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),

            // Nút gửi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _submitFeedback,
                child: const Text(
                  "Gửi phản hồi",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
