import 'package:flutter/material.dart';
import 'package:real_estate_app/core/enums/amenity.dart';
import 'package:real_estate_app/core/enums/currency.dart';
import 'package:real_estate_app/core/enums/offer_type.dart';
import 'package:real_estate_app/core/enums/period_type.dart';
import 'package:real_estate_app/core/enums/property_type.dart';
import 'package:real_estate_app/shared/models/property/location_model.dart';
import 'package:real_estate_app/shared/models/property/property_details_model.dart';

class AddPropertyProvider extends ChangeNotifier {
  /// STEP CONTROL
  int _currentStep = 0;
  static const int totalSteps = 5;

  int get currentStep => _currentStep;

  OfferType offerType = OfferType.sale;
  Currency currency = Currency.cop;
  PeriodType period = PeriodType.month;

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

  /// STEP 3 – DETAILS (CONTROLLERS)
  final TextEditingController bedroomsController = TextEditingController();
  final TextEditingController bathroomsController = TextEditingController();
  final TextEditingController garageSizeController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController lotAreaController = TextEditingController();
  final TextEditingController floorsController = TextEditingController();
  final TextEditingController yearBuiltController = TextEditingController();
  final TextEditingController strataController = TextEditingController();
  final TextEditingController administrationFeeController =
      TextEditingController();

  /// selects / switches
  AreaUnit areaUnit = AreaUnit.sqm;
  PropertyCondition condition = PropertyCondition.used;
  bool furnished = false;
  bool petsAllowed = false;
  bool hasBalcony = false;
  bool hasTerrace = false;
  bool hasGarden = false;
  bool hasBarbecue = false;

  PropertyDetails buildPropertyDetails() {
    return PropertyDetails(
      bedrooms: int.tryParse(bedroomsController.text) ?? 0,
      bathrooms: int.tryParse(bathroomsController.text) ?? 0,
      parking: int.tryParse(garageSizeController.text) ?? 0,
      area: double.tryParse(areaController.text) ?? 0,
      lotArea: lotAreaController.text.isNotEmpty
          ? double.tryParse(lotAreaController.text)
          : null,
      areaUnit: areaUnit,
      floors: floorsController.text.isNotEmpty
          ? int.tryParse(floorsController.text)
          : null,
      yearBuilt: yearBuiltController.text.isNotEmpty
          ? int.tryParse(yearBuiltController.text)
          : null,
      furnished: furnished,
      condition: condition,
      strata: strataController.text.isNotEmpty
          ? int.tryParse(strataController.text)
          : null,
      administrationFee: administrationFeeController.text.isNotEmpty
          ? double.tryParse(administrationFeeController.text)
          : null,
      petsAllowed: petsAllowed,
      hasBalcony: hasBalcony,
      hasTerrace: hasTerrace,
      hasGarden: hasGarden,
      hasBarbecue: hasBarbecue,
    );
  }

  void setFurnished(bool value) {
    furnished = value;
    notifyListeners();
  }

  void setPetsAllowed(bool value) {
    petsAllowed = value;
    notifyListeners();
  }

  void setHasBalcony(bool value) {
    hasBalcony = value;
    notifyListeners();
  }

  void setHasTerrace(bool value) {
    hasTerrace = value;
    notifyListeners();
  }

  void setAreaUnit(AreaUnit value) {
    areaUnit = value;
    notifyListeners();
  }

  void setCondition(PropertyCondition value) {
    condition = value;
    notifyListeners();
  }

  void setHasGarden(bool value) {
    hasGarden = value;
    notifyListeners();
  }

  void setHasBarbecue(bool value) {
    hasBarbecue = value;
    notifyListeners();
  }

  bool get hasBedroomsError =>
      submitted &&
      bedroomsController.text.isEmpty &&
      bedroomsController.text != '0';
  bool get hasBathroomsError =>
      submitted &&
      bathroomsController.text.isEmpty &&
      bathroomsController.text != '0';
  bool get hasParkingError =>
      submitted &&
      garageSizeController.text.isEmpty &&
      garageSizeController.text != '0';
  bool get hasAreaError =>
      submitted && areaController.text.isEmpty && areaController.text != '0';

  /// STEP 4 – AMENITIES
  final Set<Amenity> amenities = {};

  void toggleAmenity(Amenity amenity) {
    if (amenities.contains(amenity)) {
      amenities.remove(amenity);
    } else {
      amenities.add(amenity);
    }
    notifyListeners();
  }

  /// STEP 5 – LOCATION
  final TextEditingController searchAddressController = TextEditingController();

  List<PropertyLocation> places = [];
  PropertyLocation? selectedPlace;

  double? latitude;
  double? longitude;
  String? address;
  String? city;
  String? state;
  String? country;

  void selectPlace(PropertyLocation place) {
    selectedPlace = place;
    searchAddressController.text = place.address;
    places = [];
    notifyListeners();
  }

  void setResolvedLocation({required double lat, required double lng}) {
    latitude = lat;
    longitude = lng;

    address = selectedPlace?.address;
    city = selectedPlace?.city;
    state = selectedPlace?.state;
    country = selectedPlace?.country;

    notifyListeners();
  }

  void setPlaces(List<PropertyLocation> results) {
    places = results;
    notifyListeners();
  }

  bool get hasLocationError =>
      submitted && searchAddressController.text.isEmpty;

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
        return bedroomsController.text.isNotEmpty &&
            bathroomsController.text.isNotEmpty &&
            areaController.text.isNotEmpty;
      case 3:
        return amenities.isNotEmpty;
      case 4:
        return searchAddressController.text.isNotEmpty;
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

    bedroomsController.dispose();
    bathroomsController.dispose();
    garageSizeController.dispose();
    areaController.dispose();
    lotAreaController.dispose();
    floorsController.dispose();
    yearBuiltController.dispose();
    strataController.dispose();
    administrationFeeController.dispose();

    searchAddressController.dispose();

    super.dispose();
  }
}
