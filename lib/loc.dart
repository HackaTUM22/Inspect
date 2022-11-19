class Loc {
  final String lat;
  final String lng;

  Loc(this.lat, this.lng);

  Loc.fromJson(Map<String, dynamic> json)
      :lat = json['lat'],
  lng = json['lng'];


}