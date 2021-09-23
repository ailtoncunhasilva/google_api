class Place {
  String? description;
  String? placeId;

  Place({this.description, this.placeId});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      description: json['description'],
      placeId: json['place_id'],
    );
  }
}
