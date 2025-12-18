import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  const MyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Top bar icons ---
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.notifications_none, size: 28),
                  SizedBox(width: 16),
                  Icon(Icons.person_outline, size: 28),
                ],
              ),
              const SizedBox(height: 20),

              // --- Welcome text ---
              const Text(
                "Welcome,",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Ryan Trương",
                style: TextStyle(fontSize: 28, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // --- Search bar ---
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- Saved places title ---
              const Text(
                "Saved Places",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // --- Grid of images ---
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: const [
                    PlaceCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1511735643442-503bb3bd348a"),
                    PlaceCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1503264116251-35a269479413"),
                    PlaceCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1528909514045-2fa4ac7a08ba"),
                    PlaceCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1507525428034-b723cf961d3e"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String imageUrl;

  const PlaceCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}