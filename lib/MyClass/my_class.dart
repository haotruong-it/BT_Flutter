
import 'package:flutter/material.dart';

class MyClass extends StatelessWidget {
  const MyClass({super.key});

  final List<Map<String, dynamic>> classes = const [
    {
      'title': 'XML và ứng dụng - Nhóm 1',
      'code': '2025-2026.1.TIN4583.001',
      'students': 58,
      'imageUrl': 'https://images.unsplash.com/photo-1765909583424-c0d93ec4d527?q=80&w=1598&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Lập trình ứng dụng cho các thiết bị di động',
      'code': '2025-2026.1.TIN4403.006',
      'students': 55,
      'imageUrl': 'https://images.unsplash.com/photo-1765197567983-990f26165af1?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
  

    {
      'title': 'Lập trình ứng dụng cho các thiết bị di động',
      'code': '2025-2026.1.TIN4403.005',
      'students': 52,
      'imageUrl': 'https://plus.unsplash.com/premium_photo-1697537045484-757c549388d2?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Lập trình ứng dụng cho các thiết bị di động',
      'code': '2025-2026.1.TIN4403.004',
      'students': 50,
      'imageUrl': 'https://images.unsplash.com/photo-1765707886539-6d57024ddc2f?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Lập trình ứng dụng cho các thiết bị di động',
      'code': '2025-2026.1.TIN4403.003',
      'students': 52,
      'imageUrl': 'https://images.unsplash.com/photo-1761839259946-2d80f8e72e18?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
  
  ];

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: ListView.builder(
      itemCount: classes.length,
      itemBuilder: (context, index) {
        final item = classes[index];
        return Card(
  elevation: 3,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6), 
  clipBehavior: Clip.hardEdge,
  child: Stack(
    children: [
      // Ảnh nền cao 130
      Image.network(
        item['imageUrl'],
        height: 130, 
        width: double.infinity,
        fit: BoxFit.cover,
      ),

      Container(
        height: 130,
        color: Colors.black.withOpacity(0.3),
      ),

      Padding(
        padding: EdgeInsets.all(12), 
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    item['code'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '${item['students']} học viên',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Colors.white),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('Chỉnh sửa'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Xóa'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
);

        },
      ),
    );
  }
}
