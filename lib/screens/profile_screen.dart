import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final Color mainMagenta = const Color(0xFFE94057);
  final Color bgColor = const Color(0xFFFFF5F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const BackButton(color: Colors.grey),
        title: Text('The Kinetic Gallery', style: TextStyle(color: mainMagenta, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // --- Profile Image with Match Badge ---
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: mainMagenta, width: 2)),
                    child: const CircleAvatar(radius: 80, backgroundImage: NetworkImage('https://picsum.photos/id/237/200')),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
                    child: Text('85% Match', style: TextStyle(color: mainMagenta, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('David, 28', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Text('Software Architect & Ocean Lover', style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 30),

            // --- Action Buttons ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircleAction(context, Icons.settings, 'SETTINGS', () => Navigator.pushNamed(context, '/settings')),
                _buildCircleAction(context, Icons.camera_alt, 'ADD MEDIA', () {}, isLarge: true),
                _buildCircleAction(context, Icons.edit, 'EDIT PROFILE', () {}),
              ],
            ),
            const SizedBox(height: 30),

            // --- Tinder Gold Card ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(colors: [Color(0xFF2C0212), Color(0xFF150109)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Icon(Icons.fireplace, color: Colors.amber, size: 30),
                    const SizedBox(width: 8),
                    const Text('Tinder Gold', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  ]),
                  const SizedBox(height: 10),
                  const Text('See who likes you', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text('Unlock 25+ matches waiting for you', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity, height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), gradient: const LinearGradient(colors: [Color(0xFFF1D596), Color(0xFFC9A35B)])),
                    child: const Center(child: Text('GET GOLD', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1))),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            // --- Stats ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat('4.2k', 'PROFILE VIEWS'),
                _buildStat('12', 'SUPER LIKES'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildCircleAction(BuildContext context, IconData icon, String label, VoidCallback onTap, {bool isLarge = false}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: isLarge ? 70 : 60, height: isLarge ? 70 : 60,
            decoration: BoxDecoration(color: isLarge ? mainMagenta : Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
            child: Icon(icon, color: isLarge ? Colors.white : mainMagenta),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
      ],
    );
  }

  Widget _buildStat(String val, String label) {
    return Column(children: [
      Text(val, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: mainMagenta)),
      Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
    ]);
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      height: 70,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem(context, Icons.local_fire_department_rounded, '/discover', false),
          _navItem(context, Icons.search_rounded, '/explore', false),
          _navItem(context, Icons.chat_bubble_rounded, '/chats', false),
          _navItem(context, Icons.person_rounded, '/profile', true),
        ],
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, String route, bool isActive) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Icon(icon, color: isActive ? mainMagenta : Colors.grey[300], size: 28),
    );
  }
}