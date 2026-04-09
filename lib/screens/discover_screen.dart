import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  // Theme Colors
  final Color mainMagenta = const Color(0xFFE94057);
  final Color bgColor = const Color(0xFFFFF5F8);
  final Color textGrey = const Color(0xFF757575);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      // 1. TOP APP BAR
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        toolbarHeight: 70,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: mainMagenta, width: 2),
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/200'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          'The Kinetic Gallery',
          style: TextStyle(
            color: mainMagenta,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.tune_rounded, color: mainMagenta, size: 28),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),

      // 2. MAIN BODY
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: _buildUserCard(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(icon: Icons.replay, color: Colors.amber, size: 50, iconSize: 24),
                _buildActionButton(icon: Icons.close_rounded, color: Colors.redAccent, size: 65, iconSize: 35),
                _buildActionButton(icon: Icons.star_rounded, color: Colors.blueAccent, size: 50, iconSize: 24),
                _buildActionButton(icon: Icons.favorite_rounded, color: const Color(0xFF1CE5A1), size: 65, iconSize: 35),
                _buildActionButton(icon: Icons.flash_on_rounded, color: Colors.purpleAccent, size: 50, iconSize: 24),
              ],
            ),
          ),
        ],
      ),

      // 3. BOTTOM NAVIGATION BAR
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // --- WIDGET: THE USER CARD ---
  Widget _buildUserCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            spreadRadius: 5,
            offset: const Offset(0, 10),
          )
        ],
        image: const DecorationImage(
          image: NetworkImage('https://picsum.photos/id/64/800/1200'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.9),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 24,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Jessica, 24',
                      style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.verified, color: Colors.blue[300], size: 24),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.3)),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.info_outline_rounded, color: Colors.white, size: 20),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(Icons.location_on_rounded, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text('2 miles away', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildChip('PHOTOGRAPHY'),
                    const SizedBox(width: 8),
                    _buildChip('TRAVEL'),
                    const SizedBox(width: 8),
                    _buildChip('SUSHI'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.5),
      ),
    );
  }

  Widget _buildActionButton({required IconData icon, required Color color, required double size, required double iconSize}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Icon(icon, color: color, size: iconSize),
      ),
    );
  }

  // --- FIXED BOTTOM NAV ---
  Widget _buildBottomNav(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 1. ACTIVE Discover
          _buildNavItem(icon: Icons.local_fire_department_rounded, label: 'Discover', isActive: true),

          // 2. Explore
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/explore'),
            borderRadius: BorderRadius.circular(30),
            child: _buildNavItem(icon: Icons.search_rounded, label: 'Explore', isActive: false),
          ),

          // 3. Chat (Fixed logic)
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/chats'),
            borderRadius: BorderRadius.circular(30),
            child: _buildNavItem(
              icon: Icons.chat_bubble_rounded,
              label: 'Chat',
              isActive: false,
              hasNotification: true,
            ),
          ),

          // 4. Profile
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/profile'),
            borderRadius: BorderRadius.circular(30),
            child: _buildNavItem(icon: Icons.person_rounded,
                label: 'Profile',
                isActive: false),
            ),



        ],
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, required bool isActive, bool hasNotification = false}) {
    final color = isActive ? mainMagenta : Colors.grey[400]!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(icon, color: color, size: 28),
            if (hasNotification)
              Positioned(
                top: -2,
                right: -4,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: mainMagenta,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        )
      ],
    );
  }
}