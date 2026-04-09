import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TinderLoginScreen extends StatelessWidget {
  const TinderLoginScreen({Key? key}) : super(key: key);

  // Define colors from the image
  static const Color tinderPink = Color(0xFFE94057);
  static const Color appleButtonColor = Color(0xFF8B1A1D); // Gradient start
  static const Color appleButtonGradientEnd = Color(0xFF5A1012); // Gradient end
  static const Color textColorGrey = Color(0xFF757575);
  static const Color linkColor = Color(0xFFE94057);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // --- Top Section: Logo ---
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.local_fire_department_rounded,
                        color: tinderPink,
                        size: 80,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'tinder',
                        style: TextStyle(
                          color: tinderPink,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // --- Middle Section: Legal Text and Login Buttons ---
              Column(
                children: [
                  // --- Legal Text ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          color: textColorGrey,
                          fontSize: 13,
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(text: 'By tapping Log In, you agree to our '),
                          TextSpan(
                            text: 'Terms',
                            style: const TextStyle(
                              color: linkColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(text: '. Learn how we process your data in our '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              color: linkColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Cookie Policy',
                            style: const TextStyle(
                              color: linkColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- Log in with Apple Button ---
                  _buildLoginButton(
                    context: context,
                    icon: Icons.apple, // Using built-in Apple icon
                    iconColor: Colors.white,
                    text: 'Log in with Apple',
                    onPressed: () {},
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [appleButtonColor, appleButtonGradientEnd],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 16),

                  // --- Log in with Facebook Button ---
                  _buildLoginButton(
                    context: context,
                    icon: Icons.facebook, // Using built-in Facebook icon
                    iconColor: const Color(0xFF1877F2), // Official Facebook Blue
                    text: 'Log in with Facebook',
                    onPressed: () {},
                    bgColor: Colors.white,
                    textColor: Colors.black87,
                  ),
                  const SizedBox(height: 16),

                  // --- Log in with Phone Number Button ---
                  _buildLoginButton(
                    context: context,
                    icon: Icons.smartphone, // Using built-in Smartphone icon
                    iconColor: tinderPink, // Matching the brand pink
                    text: 'Log in with Phone Number',
                    onPressed: () {
                      Navigator.pushNamed(context, '/phone_login');
                    },
                    bgColor: Colors.white,
                    textColor: Colors.black87,
                  ),
                  const SizedBox(height: 25),

                  // --- "Trouble logging in?" ---
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Trouble logging in?',
                      style: TextStyle(
                        color: textColorGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              // --- Bottom Section: Footer ---
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFooterLink('Privacy Policy'),
                        const SizedBox(width: 15),
                        _buildFooterLink('Terms of Service'),
                        const SizedBox(width: 15),
                        _buildFooterLink('Cookie Policy'),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      '© 2024 The Kinetic Gallery. All rights reserved.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Updated helper function to use IconData instead of String asset paths
  Widget _buildLoginButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
    Color? bgColor,
    Color textColor = Colors.black,
    Color? iconColor,
    BoxDecoration? decoration,
  }) {
    BoxDecoration finalDecoration = decoration ?? BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    );

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: finalDecoration,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 20,
              child: Icon(
                icon,
                size: 24,
                color: iconColor, // Apply color to the icon if provided
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: textColorGrey,
          fontSize: 12,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}