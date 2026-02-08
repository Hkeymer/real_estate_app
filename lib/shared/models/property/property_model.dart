import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_estate_app/core/enums/amenity.dart';
import 'package:real_estate_app/core/enums/offer_type.dart';
import 'package:real_estate_app/core/enums/property_type.dart';
import 'package:real_estate_app/core/enums/status.dart';
import 'package:real_estate_app/shared/models/property/location_model.dart';
import 'package:real_estate_app/shared/models/property/pricing_model.dart';
import 'package:real_estate_app/shared/models/property/property_details_model.dart';
import 'package:real_estate_app/shared/models/property/property_stats.dart';

class PropertyModel {
  final String id;
  final String code;

  final String title;
  final String description;
  final OfferType offerType;
  final PropertyType propertyType;
  final Status status;

  final PropertyPricing pricing;
  final PropertyLocation location;

  // Search & filters
  final String city;
  final double priceAmount;

  // Media
  final List<String> images;
  final String coverImage;
  final bool hasImages;
  final String? videoUrl;
  final String? virtualTourUrl;

  // Details
  final PropertyDetails details;
  final Amenity amenities;

  // Ownership
  final String agentId;
  final String? ownerId;
  final String createdBy;

  // Stats
  final PropertyStats stats;

  // Flags
  final bool isFeatured;
  final bool isVerified;

  // Publishing
  final bool published;
  final Timestamp? publishedAt;
  final Timestamp? expiresAt;

  // SEO
  final List<String> searchKeywords;

  // Audit
  final Timestamp createdAt;
  final Timestamp updatedAt;

  const PropertyModel({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.offerType,
    required this.propertyType,
    required this.status,
    required this.pricing,
    required this.location,
    required this.city,
    required this.priceAmount,
    required this.images,
    required this.coverImage,
    required this.hasImages,
    this.videoUrl,
    this.virtualTourUrl,
    required this.details,
    required this.amenities,
    required this.agentId,
    this.ownerId,
    required this.createdBy,
    required this.stats,
    required this.isFeatured,
    required this.isVerified,
    required this.published,
    this.publishedAt,
    this.expiresAt,
    required this.searchKeywords,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PropertyModel.fromJson(String id, Map<String, dynamic> json) {
    return PropertyModel(
      id: id,
      code: json['code'],
      title: json['title'],
      description: json['description'],
      offerType: json['offerType'],
      propertyType: json['propertyType'],
      status: json['status'],
      pricing: PropertyPricing.fromJson(json['pricing']),
      location: PropertyLocation.fromJson(json['location']),
      city: json['city'],
      priceAmount: (json['priceAmount'] as num).toDouble(),
      images: List<String>.from(json['images'] ?? []),
      coverImage: json['coverImage'],
      hasImages: json['hasImages'] ?? false,
      videoUrl: json['videoUrl'],
      virtualTourUrl: json['virtualTourUrl'],
      details: PropertyDetails.fromJson(json['details']),
      amenities: json['amenities'],
      agentId: json['agentId'],
      ownerId: json['ownerId'],
      createdBy: json['createdBy'],
      stats: PropertyStats.fromJson(json['stats']),
      isFeatured: json['isFeatured'] ?? false,
      isVerified: json['isVerified'] ?? false,
      published: json['published'] ?? false,
      publishedAt: json['publishedAt'],
      expiresAt: json['expiresAt'],
      searchKeywords: List<String>.from(json['searchKeywords'] ?? []),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'title': title,
    'description': description,
    'offerType': offerType,
    'propertyType': propertyType,
    'status': status,
    'pricing': pricing.toJson(),
    'location': location.toJson(),
    'city': city,
    'priceAmount': priceAmount,
    'images': images,
    'coverImage': coverImage,
    'hasImages': hasImages,
    'videoUrl': videoUrl,
    'virtualTourUrl': virtualTourUrl,
    'details': details.toJson(),
    'amenities': amenities,
    'agentId': agentId,
    'ownerId': ownerId,
    'createdBy': createdBy,
    'stats': stats.toJson(),
    'isFeatured': isFeatured,
    'isVerified': isVerified,
    'published': published,
    'publishedAt': publishedAt,
    'expiresAt': expiresAt,
    'searchKeywords': searchKeywords,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
