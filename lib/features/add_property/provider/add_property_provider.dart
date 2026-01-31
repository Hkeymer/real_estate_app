import 'package:flutter/material.dart';

enum OfferType { sale, rent }

enum Currency { cop, usd }

enum PeriodType { month, week, day, night, hour }

enum PropertyType {
  apartment,
  house,
  villa,
  farm,
  commercial,
  office,
  warehouse,
  hotel,
  land,
  building,
}

class AddPropertyProvider extends ChangeNotifier {
  /// STEP CONTROL
  int _currentStep = 0;
  static const int totalSteps = 5;

  int get currentStep => _currentStep;

  OfferType offerType = OfferType.sale; // default correcto
  Currency? currency;
  PeriodType? period;

  bool _submitted = false;
  bool get submitted => _submitted;

  void submitStep() {
    _submitted = true;
    notifyListeners();
  }

  void nextStep() {
    if (_currentStep < totalSteps - 1) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index < totalSteps) {
      _currentStep = index;
      notifyListeners();
    }
  }

  /// STEP 1 – BASIC INFO
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool get hasPriceError => submitted && priceController.text.isEmpty;

  bool get hasPropertyNameError =>
      submitted && propertyNameController.text.isEmpty;

  bool get hasDescriptionError =>
      submitted && descriptionController.text.isEmpty;

  void setOfferType(OfferType type) {
    offerType = type;
    notifyListeners();
  }

  void setCurrency(Currency value) {
    currency = value;
    notifyListeners();
  }

  void setPeriod(PeriodType value) {
    period = value;
    notifyListeners();
  }

  /// STEP 2 – PROPERTY TYPE
  PropertyType? _propertyType;
  PropertyType? get propertyType => _propertyType;

  void setPropertyType(PropertyType type) {
    _propertyType = type;
    notifyListeners();
  }

  bool get hasPropertyTypeError => submitted && _propertyType == null;

  /// STEP 3 – DETAILS
  int? bedrooms;
  int? bathrooms;
  int? garage;
  int? yearBuilt;
  double? area;

  void setBedrooms(int value) {
    bedrooms = value;
    notifyListeners();
  }

  void setBathrooms(int value) {
    bathrooms = value;
    notifyListeners();
  }

  /// STEP 4 – AMENITIES
  final Set<String> amenities = {};

  void toggleAmenity(String amenity) {
    if (amenities.contains(amenity)) {
      amenities.remove(amenity);
    } else {
      amenities.add(amenity);
    }
    notifyListeners();
  }

  /// STEP 5 – LOCATION
  double? latitude;
  double? longitude;
  String? city;
  String? country;

  void setLocation({
    required double lat,
    required double lng,
    String? cityName,
    String? countryName,
  }) {
    latitude = lat;
    longitude = lng;
    city = cityName;
    country = countryName;
    notifyListeners();
  }

  /// VALIDATIONS
  bool isStepValid(int step) {
    switch (step) {
      case 0:
        return propertyNameController.text.isNotEmpty &&
            priceController.text.isNotEmpty &&
            descriptionController.text.isNotEmpty;
      case 1:
        return _propertyType != null;
      case 2:
        return bedrooms != null && bathrooms != null;
      case 3:
        return amenities.isNotEmpty;
      case 4:
        return latitude != null && longitude != null;
      default:
        return false;
    }
  }

  /// CLEANUP
  @override
  void dispose() {
    propertyNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
