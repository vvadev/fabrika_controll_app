class CustomerClass {
  final String customerID;
  String name;
  String comment = '';

  CustomerClass({
    required this.name,
    required this.customerID,
    this.comment = '',
  });

  factory CustomerClass.fromJson(Map<String, dynamic> json) {
    return CustomerClass(
      name: json['name'],
      customerID: json['customerID'],
      comment: json['comment'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'customerID': customerID,
      'comment': comment,
    };
  }
}
