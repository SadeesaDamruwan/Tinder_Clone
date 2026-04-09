import 'package:flutter/material.dart';
import 'explore_category_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // Theme Colors
  final Color mainMagenta = const Color(0xFFE94057);
  final Color bgColor = const Color(0xFFFFF5F8);
  final Color textDark = const Color(0xFF2C1E31);
  final Color textGrey = const Color(0xFF757575);

  String activeVibe = 'Foodies';

  final List<Map<String, dynamic>> allVibes = [
    {'title': 'Foodies', 'icon': Icons.restaurant},
    {'title': 'Travelers', 'icon': Icons.flight},
    {'title': 'Art', 'icon': Icons.palette},
    {'title': 'Music', 'icon': Icons.music_note},
    {'title': 'Fitness', 'icon': Icons.fitness_center},
    {'title': 'Pets', 'icon': Icons.pets},
    {'title': 'Gaming', 'icon': Icons.videogame_asset},
    {'title': 'Movies', 'icon': Icons.movie},
    {'title': 'Nature', 'icon': Icons.terrain},
    {'title': 'Coffee', 'icon': Icons.coffee},
    {'title': 'Photography', 'icon': Icons.camera_alt},
    {'title': 'Dancing', 'icon': Icons.celebration},
  ];

  void _showAllVibes() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50, height: 5,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              Text('All Trending Vibes', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textDark)),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: allVibes.length,
                  itemBuilder: (context, index) {
                    return _buildVibeCircle(allVibes[index]['title'], allVibes[index]['icon'], isModal: true);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'The Kinetic Gallery',
          style: TextStyle(color: mainMagenta, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.5),
        ),
        actions: [
          IconButton(icon: Icon(Icons.tune_rounded, color: mainMagenta), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text('Welcome to Explore', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: textDark, letterSpacing: -1)),
            const SizedBox(height: 6),
            Text('Discover your next connection in the gallery.', style: TextStyle(fontSize: 14, color: textGrey)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: mainMagenta.withOpacity(0.08), borderRadius: BorderRadius.circular(30)),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: mainMagenta),
                  hintText: 'Search interests or vibes...',
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 15),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 25),
            _buildFeaturedCard(),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: _buildSmallCard(context, 'Coffee Date', 'https://picsum.photos/id/43/300/400')),
                const SizedBox(width: 15),
                Expanded(child: _buildSmallCard(context, 'Sporty', 'https://picsum.photos/id/73/300/400')),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: _buildSmallCard(context, 'Gamers', 'https://picsum.photos/id/96/300/400')),
                const SizedBox(width: 15),
                Expanded(child: _buildSmallCard(context, 'Free Tonight', 'https://picsum.photos/id/348/300/400')),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Trending Vibes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textDark)),
                GestureDetector(
                  onTap: _showAllVibes,
                  child: Text('View All', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainMagenta)),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildVibeCircle(allVibes[index]['title'], allVibes[index]['icon']);
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const Text('© 2024 The Kinetic Gallery. All rights reserved.', style: TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Privacy Policy', style: TextStyle(fontSize: 11, color: Colors.grey[400], decoration: TextDecoration.underline)),
                      const SizedBox(width: 15),
                      Text('Terms of Service', style: TextStyle(fontSize: 11, color: Colors.grey[400], decoration: TextDecoration.underline)),
                      const SizedBox(width: 15),
                      Text('Cookie Policy', style: TextStyle(fontSize: 11, color: Colors.grey[400], decoration: TextDecoration.underline)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: _buildNewBottomNav(context),
    );
  }

  Widget _buildVibeCircle(String title, IconData icon, {bool isModal = false}) {
    bool isActive = activeVibe == title;
    return GestureDetector(
      onTap: () {
        setState(() { activeVibe = title; });
        if (isModal) Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
              width: 65, height: 65,
              decoration: BoxDecoration(
                color: isActive ? mainMagenta : mainMagenta.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: isActive ? Colors.white : mainMagenta, size: 28),
            ),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(color: textDark, fontSize: 11, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedCard() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ExploreCategoryScreen(categoryTitle: 'Free Tonight', headerImageUrl: 'https://picsum.photos/id/64/800/1000')));
      },
      child: Container(
        height: 400, width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), image: const DecorationImage(image: NetworkImage('https://picsum.photos/id/64/800/1000'), fit: BoxFit.cover)),
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(12), padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.85), borderRadius: BorderRadius.circular(24)),
          width: double.infinity,
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('FREE TONIGHT', style: TextStyle(color: mainMagenta, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
              const SizedBox(height: 4),
              Text('Looking for Love', style: TextStyle(color: textDark, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text('Found in the heart of the city • 2 miles away', style: TextStyle(color: textGrey, fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallCard(BuildContext context, String title, String imageUrl) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreCategoryScreen(categoryTitle: title, headerImageUrl: imageUrl)));
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 180, decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withOpacity(0.8)])),
          alignment: Alignment.bottomLeft, padding: const EdgeInsets.all(16),
          child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  // --- UPDATED BOTTOM NAV ---
  Widget _buildNewBottomNav(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: _buildBottomNavItem(icon: Icons.local_fire_department_rounded, label: 'Discover', isActive: false),
          ),
          _buildBottomNavItem(icon: Icons.search_rounded, label: 'Explore', isActive: true),
          // --- UPDATED CHAT LINK ---
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/chats'),
            child: _buildBottomNavItem(icon: Icons.chat_bubble_rounded, label: 'Chat', isActive: false),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/profile'),
            borderRadius: BorderRadius.circular(30),
            child: _buildBottomNavItem(icon: Icons.person_rounded,
                label: 'Profile',
                isActive: false),
          ),

        ],
      ),
    );
  }

  Widget _buildBottomNavItem({required IconData icon, required String label, required bool isActive}) {
    final Color activeColor = mainMagenta;
    final Color inactiveColor = Colors.grey[400]!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? activeColor : inactiveColor, size: 28),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: isActive ? activeColor : inactiveColor, fontSize: 10, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}