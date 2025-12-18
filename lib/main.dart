import 'package:flutter/material.dart';
import 'DangNhapAPI/form_login.dart';
import 'ChangeColorApp/change_color_app.dart';
import 'ChangeNumberApp/change_number_app.dart';
import 'DangKyApp/dang_ky_app.dart';
import 'FeedBackPage/feedback_page.dart';
import 'MyLayout/my_layout.dart';
import 'WebShop/my_product.dart';
import 'BMI/BMI.dart';
import 'MyPlace/my_place.dart';
import 'MyClass/my_class.dart';
import 'NewApi/newspage.dart';
import 'DangNhapApp/dang_nhap_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeMenu(),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F4F8),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Menu Bài Tập',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff667eea), Color(0xff764ba2)],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildMenuItem(
            context,
            title: 'My Place',
            icon: Icons.place_rounded,
            color: Colors.orange,
            page: const Place(),
          ),
          buildMenuItem(
            context,
            title: 'My Class',
            icon: Icons.class_,
            color: Colors.blue,
            page: const MyClass(),
          ),
          buildMenuItem(
            context,
            title: 'Change Color',
            icon: Icons.color_lens,
            color: Colors.pink,
            page: const ChangeColorApp(),
          ),
          buildMenuItem(
            context,
            title: 'Change Number',
            icon: Icons.exposure_plus_1,
            color: Colors.green,
            page: const ChangeNumberApp(),
          ),
          buildMenuItem(
            context,
            title: 'Đăng nhập App',
            icon: Icons.login,
            color: Colors.deepPurple,
            page: const DangNhapPage(),
          ),
          buildMenuItem(
            context,
            title: 'Đăng nhập API',
            icon: Icons.api,
            color: Colors.teal,
            page: const FormDangNhap(),
          ),
          buildMenuItem(
            context,
            title: 'Đăng ký',
            icon: Icons.app_registration,
            color: Colors.indigo,
            page: const DangKyApp(),
          ),
          buildMenuItem(
            context,
            title: 'Feedback',
            icon: Icons.feedback,
            color: Colors.amber,
            page: const FeedbackPage(),
          ),
          buildMenuItem(
            context,
            title: 'My Layout',
            icon: Icons.dashboard_customize,
            color: Colors.cyan,
            page: const MyLayout(),
          ),
          buildMenuItem(
            context,
            title: 'Shop',
            icon: Icons.shopping_cart,
            color: Colors.redAccent,
            page: const MyProduct(),
          ),
          buildMenuItem(
            context,
            title: 'Tính BMI',
            icon: Icons.monitor_weight,
            color: Colors.brown,
            page: BMIPage(),
          ),
          buildMenuItem(
            context,
            title: 'News App',
            icon: Icons.newspaper,
            color: Colors.blueGrey,
            page: const MyNewsPage(),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required Widget page,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Material(
        borderRadius: BorderRadius.circular(18),
        elevation: 6,
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            child: Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(icon, size: 28, color: color),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
