import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class Network {
  final _baseUrl = 'http://34.31.232.86/';
  Future<List<Person>?> get read async {
    final url = '${_baseUrl}cr/read';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return _personsFromJson(response.body);
    }
    return null;
  }

  Future<void> write(
    Person person,
  ) async {
    print("${person.name} - ${person.surName}");
    final bodi = jsonEncode(person.toJson());
    print(bodi);
    final url = '${_baseUrl}cr/write';
    final uri = Uri.parse(url);
    await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: bodi,
    );
    print("dah masok");
  }

  // Future<bool> check(Person person) async {
  //   final url = '${_baseUrl}cr/check';
  //   final uri = Uri.parse(url);
  //   final bodi = jsonEncode(
  //       <String, String>{'name': person.name, 'surName': person.surName});

  //   final response = await http.post(
  //     uri,
  //     body: bodi,
  //   );

  //   switch (response.statusCode) {
  //     case 200:
  //       return true;
  //     default:
  //       return false;
  //   }
  // }

  Future<void> update(
    Person person,
  ) async {
    final url = '${_baseUrl}ud/update';
    final uri = Uri.parse(url);
    await http.post(
      uri,
      body: person.toJson,
    );
  }

  Future<void> delete(
    Person person,
  ) async {
    final url = '${_baseUrl}ud/delete';
    final uri = Uri.parse(url);
    await http.post(
      uri,
      body: {
        "id": person.id.toString(),
      },
    );
  }

  List<Person> _personsFromJson(String str) {
    return List<Person>.from(
      json.decode(str).map(
            (x) => Person.fromJson(x),
          ),
    );
  }
}
