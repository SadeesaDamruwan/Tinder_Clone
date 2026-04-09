import 'package:flutter/material.dart';

class ChatViewScreen extends StatelessWidget {
  const ChatViewScreen({super.key});

  final Color mainMagenta = const Color(0xFFE94057);

  @override
  Widget build(BuildContext context) {
    // Receiving arguments if you wanted to pass the name/image dynamically
    // For now, let's assume we're chatting with Chloe
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: BackButton(color: mainMagenta),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/id/177/100'),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Chloe', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Online now', style: TextStyle(color: Colors.green, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildBubble("Hey! How was your day? 😊", false),
                _buildBubble("It was great! Just finished a project.", true),
                _buildBubble("That coffee place sounds amazing, should we go?", false),
                _buildBubble("Definitely! How about Friday?", true),
              ],
            ),
          ),
          // --- INPUT AREA ---
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.grey[200]!))),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
                    child: const TextField(
                      decoration: InputDecoration(hintText: 'Type a message...', border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  backgroundColor: mainMagenta,
                  child: const Icon(Icons.send, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isMe ? mainMagenta : Colors.grey[100],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isMe ? 20 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 20),
          ),
        ),
        child: Text(text, style: TextStyle(color: isMe ? Colors.white : Colors.black87)),
      ),
    );
  }
}