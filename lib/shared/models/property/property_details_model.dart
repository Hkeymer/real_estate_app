enum PropertyCondition { newProperty, used, renovated }

enum AreaUnit { sqm, sqft }

class PropertyDetails {
  final int bedrooms;
  final int bathrooms;
  final int parking;

  /// Áreas
  final double area; // área construida
  final double? lotArea;
  final AreaUnit areaUnit;

  /// Características físicas
  final int? floors;
  final int? yearBuilt;
  final bool furnished;
  final PropertyCondition condition;

  /// Extras relevantes
  final int? strata; // LATAM
  final double? administrationFee;
  final bool petsAllowed;
  final bool hasBalcony;
  final bool hasTerrace;
  final bool hasGarden;
  final bool hasBarbecue;

  const PropertyDetails({
    required this.bedrooms,
    required this.bathrooms,
    required this.parking,
    required this.area,
    required this.areaUnit,
    this.lotArea,
    this.floors,
    this.yearBuilt,
    required this.furnished,
    required this.condition,
    this.strata,
    this.administrationFee,
    required this.petsAllowed,
    required this.hasBalcony,
    required this.hasTerrace,
    required this.hasGarden,
    required this.hasBarbecue,
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
      areaUnit: AreaUnit.values.byName(json['areaUnit'] ?? 'sqm'),
      floors: json['floors'],
      yearBuilt: json['yearBuilt'],
      furnished: json['furnished'] ?? false,
      condition: PropertyCondition.values.byName(json['condition'] ?? 'used'),
      strata: json['strata'],
      administrationFee: json['administrationFee'] != null
          ? (json['administrationFee'] as num).toDouble()
          : null,
      petsAllowed: json['petsAllowed'] ?? false,
      hasBalcony: json['hasBalcony'] ?? false,
      hasTerrace: json['hasTerrace'] ?? false,
      hasGarden: json['hasGarden'] ?? false,
      hasBarbecue: json['hasBarbecue'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'bedrooms': bedrooms,
    'bathrooms': bathrooms,
    'parking': parking,
    'area': area,
    'lotArea': lotArea,
    'areaUnit': areaUnit.name,
    'floors': floors,
    'yearBuilt': yearBuilt,
    'furnished': furnished,
    'condition': condition.name,
    'strata': strata,
    'administrationFee': administrationFee,
    'petsAllowed': petsAllowed,
    'hasBalcony': hasBalcony,
    'hasTerrace': hasTerrace,
    'hasGarden': hasGarden,
    'hasBarbecue': hasBarbecue,
  };
}
