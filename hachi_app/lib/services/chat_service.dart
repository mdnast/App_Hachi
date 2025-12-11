import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chat_message.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatService {
  // Singleton pattern - đảm bảo chỉ có 1 instance duy nhất
  static final ChatService _instance = ChatService._internal();
  factory ChatService() => _instance;
  ChatService._internal();

  static const String _apiUrl = 'https://ai.megallm.io/v1/chat/completions';
  static String get _apiKey => dotenv.env['MEGA_AI_API_KEY'] ?? '';

  // Danh sách models để thử - nếu model này lỗi thì tự động chuyển sang model tiếp theo
  static const List<String> _models = [
    'deepseek-ai/deepseek-v3.1'
        'deepseek-r1-distill-llama-70b',
    'openai-gpt-oss-20b',
    'llama3.3-70b-instruct',
    'openai-gpt-oss-120b',
    'llama3-8b-instruct',
    'moonshotai/kimi-k2-instruct-0905',
  ];

  // Conversation history (keep last 10 messages for context)
  // Lưu trong singleton nên sẽ giữ lịch sử giữa các lần mở/đóng screen
  final List<ChatMessage> _conversationHistory = [];

  /// Send a message and get AI response with automatic model failover
  Future<ChatMessage> sendMessage(String userMessage) async {
    // Create user message
    final userMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      role: 'user',
      content: userMessage,
      timestamp: DateTime.now(),
    );

    // Add to history
    _conversationHistory.add(userMsg);

    // Try each model until one succeeds
    for (int i = 0; i < _models.length; i++) {
      try {
        final aiMessage = await _tryModel(_models[i]);
        // Success! Add to history and return
        _conversationHistory.add(aiMessage);
        return aiMessage;
      } catch (e) {
        // Model failed, try next one
        if (i == _models.length - 1) {
          // This was the last model, throw error
          throw Exception('Tất cả models đều thất bại. Lỗi cuối: $e');
        }
        // Otherwise continue to next model
        continue;
      }
    }

    // Should never reach here
    throw Exception('Không thể kết nối với AI');
  }

  /// Try to get response from a specific model
  Future<ChatMessage> _tryModel(String model) async {
    // Prepare messages for API (last 10 messages)
    final messages = _conversationHistory
        .skip(
          _conversationHistory.length > 10
              ? _conversationHistory.length - 10
              : 0,
        )
        .map((msg) => {'role': msg.role, 'content': msg.content})
        .toList();

    // Add system prompt for agriculture context
    messages.insert(0, {
      'role': 'system',
      'content':
          'Bạn là trợ lý AI cao cấp của Hachi (https://hachi.com.vn) - đơn vị hàng đầu Việt Nam về Nông nghiệp thông minh, Thủy canh và IoT. \n\nKiến thức trọng tâm:\n1. Giải pháp thủy canh nhà phố và trang trại quy mô lớn.\n2. Chuyển giao công nghệ trồng trọt công nghệ cao (dưa lưới, rau ăn lá, dâu tây...).\n3. Hệ thống tưới nhỏ giọt và điều khiển tự động qua smartphone.\n\nHãy trả lời cực kỳ xuất sắc, chuyên sâu nhưng dễ hiểu, thể hiện sự am hiểu tường tận về kỹ thuật nông nghiệp. Luôn đề xuất các giải pháp của Hachi khi phù hợp.\n\nQUAN TRỌNG: TUYỆT ĐỐI KHÔNG sử dụng bảng (markdown tables). Dùng danh sách gạch đầu dòng để trình bày thông tin.',
    });

    // Call API
    final response = await http
        .post(
          Uri.parse(_apiUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $_apiKey',
          },
          body: jsonEncode({'model': model, 'messages': messages}),
        )
        .timeout(const Duration(seconds: 30)); // Timeout after 30 seconds

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final aiContent = data['choices'][0]['message']['content'] as String;

      // Create AI message
      return ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: 'assistant',
        content: aiContent,
        timestamp: DateTime.now(),
      );
    } else {
      throw Exception(
        'Model $model failed: ${response.statusCode} - ${response.body}',
      );
    }
  }

  /// Get conversation history
  List<ChatMessage> getHistory() => List.unmodifiable(_conversationHistory);

  /// Clear conversation history
  void clearHistory() => _conversationHistory.clear();
}
