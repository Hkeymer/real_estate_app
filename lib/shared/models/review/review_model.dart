import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;

  // Relaciones
  final String propertyId;
  final String reviewerId; // user
  final String agentId;    // owner / agent

  // Contenido
  final int rating;        // 1 - 5
  final String comment;

  // Estado
  final bool published;

  // Auditoría
  final DateTime createdAt;
  final DateTime updatedAt;

  const Review({
    required this.id,
    required this.propertyId,
    required this.reviewerId,
    required this.agentId,
    required this.rating,
    required this.comment,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(String id, Map<String, dynamic> json) {
    return Review(
      id: id,
      propertyId: json['propertyId'],
      reviewerId: json['reviewerId'],
      agentId: json['agentId'],
      rating: json['rating'],
      comment: json['comment'],
      published: json['published'] ?? true,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'propertyId': propertyId,
      'reviewerId': reviewerId,
      'agentId': agentId,
      'rating': rating,
      'comment': comment,
      'published': published,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
