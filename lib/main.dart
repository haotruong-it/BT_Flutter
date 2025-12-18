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

      // ===== APP BAR =====
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
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

      // ===== DRAWER =====
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff667eea), Color(0xff764ba2)],
                ),
              ),
              child: Text(
                'Danh sách bài tập',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            buildDrawerItem(
              context,
              title: 'My Place',
              icon: Icons.place,
              page: const Place(),
            ),
            buildDrawerItem(
              context,
              title: 'My Class',
              icon: Icons.class_,
              page: const MyClass(),
            ),
            buildDrawerItem(
              context,
              title: 'Change Color',
              icon: Icons.color_lens,
              page: const ChangeColorApp(),
            ),
            buildDrawerItem(
              context,
              title: 'Change Number',
              icon: Icons.exposure_plus_1,
              page: const ChangeNumberApp(),
            ),
            buildDrawerItem(
              context,
              title: 'Đăng nhập App',
              icon: Icons.login,
              page: const DangNhapPage(),
            ),
            buildDrawerItem(
              context,
              title: 'Đăng nhập API',
              icon: Icons.api,
              page: const FormDangNhap(),
            ),
            buildDrawerItem(
              context,
              title: 'Đăng ký',
              icon: Icons.app_registration,
              page: const DangKyApp(),
            ),
            buildDrawerItem(
              context,
              title: 'Feedback',
              icon: Icons.feedback,
              page: const FeedbackPage(),
            ),
            buildDrawerItem(
              context,
              title: 'My Layout',
              icon: Icons.dashboard_customize,
              page: const MyLayout(),
            ),
            buildDrawerItem(
              context,
              title: 'Shop',
              icon: Icons.shopping_cart,
              page: const MyProduct(),
            ),
            buildDrawerItem(
              context,
              title: 'Tính BMI',
              icon: Icons.monitor_weight,
              page: BMIPage(),
            ),
            buildDrawerItem(
              context,
              title: 'News App',
              icon: Icons.newspaper,
              page: const MyNewsPage(),
            ),
          ],
        ),
      ),

      // ===== BODY =====
      body: const Center(
        child: Text(
          'Chào Mừng Bạn Đã Đến Với My Project!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  // ===== DRAWER ITEM =====
  Widget buildDrawerItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget page,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // đóng Drawer
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
    );
  }
}

