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
        padding: const EdgeInsets.fromLTRB(10, 3, 3, 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7BBB55).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'ChatBot',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    'lib/img/41409_250478.webp',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
