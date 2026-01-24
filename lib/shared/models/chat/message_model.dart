import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_estate_app/shared/models/chat/message_type_model.dart';

class Message {
  final String id;

  // Relación
  final String chatId;
  final String senderId;
  final String receiverId;

  // Contenido
  final String text;
  final MessageType type;

  // Estado
  final bool isRead;

  // Auditoría
  final DateTime createdAt;

  const Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.type,
    required this.isRead,
    required this.createdAt,
  });

  factory Message.fromJson(String id, Map<String, dynamic> json) {
    return Message(
      id: id,
      chatId: json['chatId'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      text: json['text'],
      type: MessageType.fromString(json['type']),
      isRead: json['isRead'] ?? false,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'type': type.value,
      'isRead': isRead,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
