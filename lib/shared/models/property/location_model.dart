class PropertyLocation {
  final String address;
  final String city;
  final String state;
  final String country;
  final double lat;
  final double lng;

  const PropertyLocation({
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.lat,
    required this.lng,
  });

  factory PropertyLocation.fromJson(Map<String, dynamic> json) {
    return PropertyLocation(
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'address': address,
        'city': city,
        'state': state,
        'country': country,
        'lat': lat,
        'lng': lng,
      };
}
