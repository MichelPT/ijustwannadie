class Person {
  String? name;
  String? surName;
  int? id;

  Person({required this.name, required this.surName, required this.id});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surName = json['surName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surName'] = this.surName;
    return data;
  }
}

// class Person {
//   final String name;
//   final String surName;
//   final int? id;
// Person({
//     required this.name,
//     required this.surName,
//     required this.id,
//   });
// factory Person.fromJson(Map<String, dynamic> json) {
//     return Person(
//       id: json["id"],
//       name: json["name"],
//       surName: json["surName"],
//     );
//   }
// Map<String, dynamic> get toJson => {
//         "id": id.toString(),
//         "name": name,
//         "surName": surName,
//       };
// }