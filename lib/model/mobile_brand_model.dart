class Brand {
  final int id;
  final String mobileBrand;

  Brand({required this.id, required this.mobileBrand});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(id: json['id'], mobileBrand: json['mobileBrand']);
  }
}
