import 'package:flutter/material.dart';
import '../screens/chat/chat_screen.dart';

class CompactChatWidget extends StatelessWidget {
  const CompactChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const ChatScreen()));
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF7BBB55), Color(0xFF6AA348)],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7BBB55).withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.chat_bubble_outline_rounded,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
