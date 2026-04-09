import 'package:flutter/material.dart';

class ExploreCategoryScreen extends StatelessWidget {
  final String categoryTitle;
  final String headerImageUrl;

  const ExploreCategoryScreen({
    super.key,
    required this.categoryTitle,
    required this.headerImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    const Color mainMagenta = Color(0xFFE94057);
    const Color bgColor = Color(0xFFFFF5F8);

    // Dummy data for the grid of profiles
    final List<Map<String, String>> profiles = [
      {'name': 'Alex, 23', 'image': 'https://picsum.photos/seed/p1/400/600'},
      {'name': 'Sam, 26', 'image': 'https://picsum.photos/seed/p2/400/600'},
      {'name': 'Jordan, 22', 'image': 'https://picsum.photos/seed/p3/400/600'},
      {'name': 'Taylor, 25', 'image': 'https://picsum.photos/seed/p4/400/600'},
      {'name': 'Casey, 24', 'image': 'https://picsum.photos/seed/p5/400/600'},
      {'name': 'Riley, 27', 'image': 'https://picsum.photos/seed/p6/400/600'},
    ];

    return Scaffold(
      backgroundColor: bgColor,
      // We use a CustomScrollView to get that cool expanding header effect
      body: CustomScrollView(
        slivers: [
          // --- The Expanding Header ---
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: bgColor,
            iconTheme: const IconThemeData(color: mainMagenta),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                categoryTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 10)],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(headerImageUrl, fit: BoxFit.cover),
                  // Dark gradient overlay so the white text is always readable
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- The Grid of Profiles ---
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.75, // Makes the cards taller than they are wide
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return _buildProfileGridCard(profiles[index]);
                },
                childCount: profiles.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widget to build individual profile cards ---
  Widget _buildProfileGridCard(Map<String, String> profile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
        image: DecorationImage(
          image: NetworkImage(profile['image']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(12),
        child: Text(
          profile['name']!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}