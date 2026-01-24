class UserStats {
  final int propertiesPublished;
  final int favoritesCount;
  final int contactsCount;
  final int chatsCount;
  final int reviewsWritten;

  const UserStats({
    this.propertiesPublished = 0,
    this.favoritesCount = 0,
    this.contactsCount = 0,
    this.chatsCount = 0,
    this.reviewsWritten = 0,
  });

  factory UserStats.fromJson(Map<String, dynamic>? json) {
    return UserStats(
      propertiesPublished: json?['propertiesPublished'] ?? 0,
      favoritesCount: json?['favoritesCount'] ?? 0,
      contactsCount: json?['contactsCount'] ?? 0,
      chatsCount: json?['chatsCount'] ?? 0,
      reviewsWritten: json?['reviewsWritten'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'propertiesPublished': propertiesPublished,
        'favoritesCount': favoritesCount,
        'contactsCount': contactsCount,
        'chatsCount': chatsCount,
        'reviewsWritten': reviewsWritten,
      };
}
