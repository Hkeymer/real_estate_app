class UserLocation {
  final String city;
  final String? state;
  final String? country;

  const UserLocation({
    required this.city,
    this.state,
    this.country,
  });

  factory UserLocation.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const UserLocation(city: '');
    }

    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() => {
        'city': city,
        'state': state,
        'country': country,
      };
}
