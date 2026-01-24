class PropertyDetails {
  final int bedrooms;
  final int bathrooms;
  final int parking;
  final double area;
  final double? lotArea;
  final int? floors;
  final int? yearBuilt;
  final bool furnished;

  const PropertyDetails({
    required this.bedrooms,
    required this.bathrooms,
    required this.parking,
    required this.area,
    this.lotArea,
    this.floors,
    this.yearBuilt,
    required this.furnished,
  });

  factory PropertyDetails.fromJson(Map<String, dynamic> json) {
    return PropertyDetails(
      bedrooms: json['bedrooms'] ?? 0,
      bathrooms: json['bathrooms'] ?? 0,
      parking: json['parking'] ?? 0,
      area: (json['area'] as num).toDouble(),
      lotArea: json['lotArea'] != null
          ? (json['lotArea'] as num).toDouble()
          : null,
      floors: json['floors'],
      yearBuilt: json['yearBuilt'],
      furnished: json['furnished'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'parking': parking,
        'area': area,
        'lotArea': lotArea,
        'floors': floors,
        'yearBuilt': yearBuilt,
        'furnished': furnished,
      };
}
