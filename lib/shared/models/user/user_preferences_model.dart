class UserPreferences {
  final String language; // es | en
  final String currency; // COP | USD
  final NotificationPreferences notifications;

  const UserPreferences({
    required this.language,
    required this.currency,
    required this.notifications,
  });

  factory UserPreferences.fromJson(Map<String, dynamic>? json) {
    return UserPreferences(
      language: json?['language'] ?? 'es',
      currency: json?['currency'] ?? 'COP',
      notifications: NotificationPreferences.fromJson(json?['notifications']),
    );
  }

  Map<String, dynamic> toJson() => {
    'language': language,
    'currency': currency,
    'notifications': notifications.toJson(),
  };
}

class NotificationPreferences {
  final bool email;
  final bool push;
  final bool sms;

  const NotificationPreferences({
    required this.email,
    required this.push,
    required this.sms,
  });

  factory NotificationPreferences.fromJson(Map<String, dynamic>? json) {
    return NotificationPreferences(
      email: json?['email'] ?? true,
      push: json?['push'] ?? true,
      sms: json?['sms'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {'email': email, 'push': push, 'sms': sms};
}
