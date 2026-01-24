class AgentProfile {
  final String? licenseNumber;
  final String? agencyName;
  final String? bio;
  final int? experienceYears;
  final List<String> specialties;
  final double rating;
  final int reviewsCount;

  const AgentProfile({
    this.licenseNumber,
    this.agencyName,
    this.bio,
    this.experienceYears,
    this.specialties = const [],
    this.rating = 0,
    this.reviewsCount = 0,
  });

  factory AgentProfile.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const AgentProfile();

    return AgentProfile(
      licenseNumber: json['licenseNumber'],
      agencyName: json['agencyName'],
      bio: json['bio'],
      experienceYears: json['experienceYears'],
      specialties: List<String>.from(json['specialties'] ?? []),
      rating: json['rating'] != null
          ? (json['rating'] as num).toDouble()
          : 0,
      reviewsCount: json['reviewsCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'licenseNumber': licenseNumber,
        'agencyName': agencyName,
        'bio': bio,
        'experienceYears': experienceYears,
        'specialties': specialties,
        'rating': rating,
        'reviewsCount': reviewsCount,
      };
}
