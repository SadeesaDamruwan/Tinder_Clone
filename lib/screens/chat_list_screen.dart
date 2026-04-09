import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  final Color mainMagenta = const Color(0xFFE94057);
  final Color bgColor = const Color(0xFFFFF5F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('The Kinetic Gallery', style: TextStyle(color: mainMagenta, fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: Icon(Icons.tune_rounded, color: mainMagenta), onPressed: () {})],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('New Matches', '12 New'),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              children: [
                _buildMatchItem('Likes You', 'https://picsum.photos/id/1/100', isLikesYou: true),
                _buildMatchItem('Sienna', 'https://picsum.photos/id/1024/100'),
                _buildMatchItem('Marcus', 'https://picsum.photos/id/1005/100'),
                _buildMatchItem('Eleanor', 'https://picsum.photos/id/1012/100'),
              ],
            ),
          ),
          _buildSectionHeader('Messages', null),
          Expanded(
            child: ListView(
              children: [
                _buildMessageTile(context, 'Chloe', 'That coffee place sounds a...', 'JUST NOW', 'https://picsum.photos/id/177/100', isUnread: true),
                _buildMessageTile(context, 'James', 'Haha, no way! I was literally ther...', '2H AGO', 'https://picsum.photos/id/338/100'),
                _buildMessageTile(context, 'Amara', 'You matched! Say something ch...', 'YESTERDAY', 'https://picsum.photos/id/342/100'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildSectionHeader(String title, String? badge) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: mainMagenta.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Text(badge, style: TextStyle(color: mainMagenta, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
        ],
      ),
    );
  }

  Widget _buildMatchItem(String name, String imageUrl, {bool isLikesYou = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          CircleAvatar(radius: 38, backgroundImage: NetworkImage(imageUrl), backgroundColor: isLikesYou ? mainMagenta : Colors.transparent),
          const SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: isLikesYou ? mainMagenta : Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildMessageTile(BuildContext context, String name, String msg, String time, String img, {bool isUnread = false}) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, '/chat_view'), // Go to chat
      leading: CircleAvatar(radius: 30, backgroundImage: NetworkImage(img)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(msg, overflow: TextOverflow.ellipsis),
      trailing: Text(time, style: const TextStyle(color: Colors.grey, fontSize: 11)),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
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
          InkWell(onTap: () => Navigator.pushNamed(context, '/discover'), child: _navItem(Icons.local_fire_department_rounded, 'Discover', false)),
          InkWell(onTap: () => Navigator.pushNamed(context, '/explore'), child: _navItem(Icons.search_rounded, 'Explore', false)),
          _navItem(Icons.chat_bubble_rounded, 'Chat', true),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/profile'),
            borderRadius: BorderRadius.circular(30),
            child: _navItem(Icons.person_rounded,'Profile', false),
          ),

        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    final color = isActive ? mainMagenta : Colors.grey[400]!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 28),
        Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}