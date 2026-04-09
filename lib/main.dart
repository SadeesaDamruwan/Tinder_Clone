import 'package:flutter/material.dart';

// Import all your screens here so main.dart acts as the routing hub
import 'screens/login_screen.dart'; // Make sure this matches your actual file name!
import 'screens/phone_login_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/explore_screen.dart';
import 'screens/chat_list_screen.dart';
import 'screens/chat_view_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDE8F3),
        primaryColor: const Color(0xFFE94057),
        useMaterial3: true,
      ),

      // --- ROUTING SYSTEM UPDATE ---
      // Instead of using 'home:', we define an initial route
      initialRoute: '/',

      // We map string paths to our actual screen widgets
      routes: {
        '/': (context) => const TinderLoginScreen(),
        '/phone_login': (context) => const PhoneLoginScreen(),
        '/discover': (context) => const DiscoverScreen(),
        '/explore': (context) => const ExploreScreen(),
        '/chats': (context) => const ChatListScreen(),
        '/chat_view': (context) => const ChatViewScreen(),
        '/profile': (context) => const ProfileScreen(), // <-- ADD THIS
        '/settings': (context) => const SettingsScreen(), //
        // As you build more screens, just add them here:
        // '/otp_verify': (context) => const OtpScreen(),
        // '/main_app': (context) => const MainSwipeScreen(),
      },
    );
  }
}