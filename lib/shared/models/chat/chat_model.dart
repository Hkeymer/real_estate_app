import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String id;

  // Relaciones
  final String propertyId;
  final String buyerId;   // interesado
  final String ownerId;   // agente / propietario

  // Estado
  final bool isActive;

  // Último mensaje (optimización UI)
  final String? lastMessage;
  final DateTime? lastMessageAt;
  final String? lastSenderId;

  // Auditoría
  final DateTime createdAt;
  final DateTime updatedAt;

  const Chat({
    required this.id,
    required this.propertyId,
    required this.buyerId,
    required this.ownerId,
    required this.isActive,
    this.lastMessage,
    this.lastMessageAt,
    this.lastSenderId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Chat.fromJson(String id, Map<String, dynamic> json) {
    return Chat(
      id: id,
      propertyId: json['propertyId'],
      buyerId: json['buyerId'],
      ownerId: json['ownerId'],
      isActive: json['isActive'] ?? true,
      lastMessage: json['lastMessage'],
      lastSenderId: json['lastSenderId'],
      lastMessageAt: json['lastMessageAt'] != null
          ? (json['lastMessageAt'] as Timestamp).toDate()
          : null,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'propertyId': propertyId,
      'buyerId': buyerId,
      'ownerId': ownerId,
      'isActive': isActive,
      'lastMessage': lastMessage,
      'lastSenderId': lastSenderId,
      'lastMessageAt':
          lastMessageAt != null ? Timestamp.fromDate(lastMessageAt!) : null,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
