class Address {
  Address({
    required this.formattedAddress,
    required this.placeName,
    required this.placeId,
    required this.latitude,
    required this.longitude,
  });

  String formattedAddress;
  double latitude;
  double longitude;
  String placeId;
  String placeName;
}
