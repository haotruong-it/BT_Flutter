import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key}); // Thêm key cho Widget

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final TextEditingController chieuCaoCtrl = TextEditingController();
  final TextEditingController canNangCtrl = TextEditingController();

  double? bmi;
  String phanLoai = "";

  @override
  void initState() {
    super.initState();
    // Thêm Listener để xóa kết quả khi người dùng nhập lại dữ liệu
    chieuCaoCtrl.addListener(_clearResultOnInput);
    canNangCtrl.addListener(_clearResultOnInput);
  }

  //  Hàm để xóa kết quả nếu BMI đang hiển thị (cải thiện UX)
  void _clearResultOnInput() {
    if (bmi != null) {
      setState(() {
        bmi = null;
        phanLoai = "";
      });
    }
  }

  // Giải phóng bộ nhớ của Controller
  @override
  void dispose() {
    chieuCaoCtrl.dispose();
    canNangCtrl.dispose();
    super.dispose();
  }

  void tinhBMI() {
    double? h = double.tryParse(chieuCaoCtrl.text);
    double? w = double.tryParse(canNangCtrl.text);

    // Cải tiến logic xử lý lỗi: Kiểm tra giá trị hợp lệ
    if (h == null || w == null || h <= 0 || w <= 0) {
      setState(() {
        bmi = null;
        phanLoai = "Dữ liệu không hợp lệ"; // Giữ lại text báo lỗi
      });

      // Hiển thị SnackBar để cảnh báo người dùng ngay lập tức
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Vui lòng nhập Chiều cao (cm) và Cân nặng (kg) hợp lệ!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Công thức tính BMI
    double heightMeter = h / 100;
    double result = w / (heightMeter * heightMeter);

    setState(() {
      bmi = double.parse(result.toStringAsFixed(2));

      // Phân loại kết quả BMI
      if (bmi! < 18.5) {
        phanLoai = "Thiếu cân";
      } else if (bmi! < 25) {
        phanLoai = "Bình thường";
      } else if (bmi! < 30) {
        phanLoai = "Thừa cân";
      } else {
        phanLoai = "Béo phì";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Tính chỉ số BMI"),
      ),
      body: SingleChildScrollView( //  Thêm SingleChildScrollView để tránh tràn màn hình
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Căn chỉnh nút
          children: [
            // Trường nhập Chiều cao
            TextField(
              controller: chieuCaoCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.height, color: Colors.teal),
                labelText: "Chiều cao (cm)",
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 15),
            
            // Trường nhập Cân nặng
            TextField(
              controller: canNangCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.monitor_weight, color: Colors.orange),
                labelText: "Cân nặng (kg)",
                labelStyle: TextStyle(color: Colors.orange),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Nút Tính BMI
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white, // Đảm bảo màu chữ trắng
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: tinhBMI,
              child: const Text(
                "TÍNH BMI", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              ),
            ),
            const SizedBox(height: 40),

            // --- Kết quả BMI ---
            if (bmi != null || phanLoai.isNotEmpty) // Hiển thị cả khi có lỗi
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.teal.shade100)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "KẾT QUẢ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.teal),
                    ),
                    const Divider(height: 15),
                    
                    Text(
                      bmi != null ? "Chỉ số BMI: $bmi" : phanLoai, // Hiển thị BMI hoặc thông báo lỗi
                      style: TextStyle(
                        fontSize: 22,
                        color: bmi != null ? Colors.redAccent : Colors.orange, // Màu đỏ cho BMI, màu cam cho lỗi
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    if (bmi != null) // Chỉ hiển thị phân loại khi BMI hợp lệ
                      Text(
                        "Phân loại: $phanLoai",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.pink,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
              
            const SizedBox(height: 30),
            const Text(
              'Phân loại BMI:\n< 18.5: Thiếu cân | 18.5–24.9: Bình thường | 25–29.9: Thừa cân | ≥ 30: Béo phì',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}