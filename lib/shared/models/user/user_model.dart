import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:real_estate_app/shared/models/user/agent_profile_model.dart';
import 'package:real_estate_app/shared/models/user/user_preferences_model.dart';
import 'package:real_estate_app/shared/models/user/user_stats_model.dart';

import 'package:real_estate_app/shared/models/user/user_role_model.dart';

class AppUser {
  final String id;

  // Básico
  final String name;
  final String email;
  final UserRole role;
  final String? phone;
  final String? avatarUrl;

  // Estado
  final bool isActive;
  final bool isVerified;

  // Submodelos
  final UserStats stats;
  final UserPreferences preferences;
  final AgentProfile? agentProfile;

  // Auditoría
  final DateTime createdAt;
  final DateTime updatedAt;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.phone,
    this.avatarUrl,
    required this.isActive,
    required this.isVerified,
    required this.stats,
    required this.preferences,
    this.agentProfile,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AppUser.fromJson(String id, Map<String, dynamic> json) {
    return AppUser(
      id: id,
      name: json['name'],
      email: json['email'],
      role: UserRole.fromString(json['role']),
      phone: json['phone'],
      avatarUrl: json['avatarUrl'],
      isActive: json['isActive'] ?? true,
      isVerified: json['isVerified'] ?? false,
      stats: UserStats.fromJson(json['stats'] ?? {}),
      preferences: UserPreferences.fromJson(json['preferences'] ?? {}),
      agentProfile: json['agentProfile'] != null
          ? AgentProfile.fromJson(json['agentProfile'])
          : null,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role.value,
      'phone': phone,
      'avatarUrl': avatarUrl,
      'isActive': isActive,
      'isVerified': isVerified,
      'stats': stats.toJson(),
      'preferences': preferences.toJson(),
      'agentProfile': agentProfile?.toJson(),
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}

