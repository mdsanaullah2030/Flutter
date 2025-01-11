
class ManuItems {
  final int id;
  final double dipositB;
  final String packages;
  final String profitB;
  final String referralB;
  ManuItems({
    required this.id,
    required this.dipositB,
    required this.packages,
    required this.profitB,
    required this.referralB,
  });

  // Factory constructor for creating a Location instance from JSON
  factory ManuItems.fromJson(Map<String, dynamic> json) {
    return ManuItems(
      id: json['id'],
      dipositB: json['dipositB'],
      packages: json['packages'],
      profitB: json['profitB'],
      referralB: json['referralB'],

    );
  }

  // Method for converting a Location instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dipositB': dipositB,
      'packages': packages,
      'profitB': profitB,
      'referralB': referralB,
    };
  }
}