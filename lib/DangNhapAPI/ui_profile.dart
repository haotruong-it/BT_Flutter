import 'package:tonghop_baitap/DangNhapAPI/Model/profile_user.dart';
import 'package:tonghop_baitap/DangNhapAPI/Service/auth_service.dart';
import 'package:flutter/material.dart';

class UIProfile extends StatefulWidget {
  const UIProfile({super.key});

  @override
  State<UIProfile> createState() => _UIProfileState();
}

class _UIProfileState extends State<UIProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: myBody(),
    );
  }

  // ================= APP BAR =================
  PreferredSizeWidget myAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Profile"),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,

      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await authService.logout();
            if (!mounted) return;
            Navigator.pop(context); // quay về form đăng nhập
          },
        ),
      ],
    );
  }

  // ================= BODY =================
  Widget myBody() {
    return FutureBuilder<ProfileUser?>(
      future: authService.getProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("Không có thông tin người dùng"));
        }

        final user = snapshot.data!;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // AVATAR
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.image),
              ),

              const SizedBox(height: 16),

              // NAME
              Text(
                user.fullName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Chip(
                label: Text("Role: ${user.role}"),
                backgroundColor: Colors.blueGrey.shade100,
              ),

              const SizedBox(height: 20),

              // INFO CARD
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    infoTile(Icons.cake, "Tuổi", user.age.toString()),
                    infoTile(Icons.person, "Giới tính", user.genderVN),
                    infoTile(Icons.email, "Email", user.email),
                    infoTile(Icons.phone, "SĐT", user.phone),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ================= INFO TILE =================
  Widget infoTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(title),
      subtitle: Text(value),
    );
  }
}
