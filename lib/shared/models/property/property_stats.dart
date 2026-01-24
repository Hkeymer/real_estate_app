import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyStats {
  final int views;
  final int favorites;
  final int contacts;
  final int reviewsCount;
  final double ratingAverage;
  final Timestamp? lastContactAt;

  const PropertyStats({
    required this.views,
    required this.favorites,
    required this.contacts,
    required this.reviewsCount,
    required this.ratingAverage,
    this.lastContactAt,
  });

  factory PropertyStats.fromJson(Map<String, dynamic> json) {
    return PropertyStats(
      views: json['views'] ?? 0,
      favorites: json['favorites'] ?? 0,
      contacts: json['contacts'] ?? 0,
      reviewsCount: json['reviewsCount'] ?? 0,
      ratingAverage: json['ratingAverage'] != null
          ? (json['ratingAverage'] as num).toDouble()
          : 0,
      lastContactAt: json['lastContactAt'],
    );
  }

  Map<String, dynamic> toJson() => {
    'views': views,
    'favorites': favorites,
    'contacts': contacts,
    'reviewsCount': reviewsCount,
    'ratingAverage': ratingAverage,
    'lastContactAt': lastContactAt,
  };
}
