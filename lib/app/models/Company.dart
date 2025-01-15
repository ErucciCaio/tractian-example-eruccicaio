// ignore_for_file: file_names

class Company {
  String? id;
  String? name;

  Company(this.id, this.name);

  Company.fromAPI(Map<String, dynamic> api) {
    id = api["id"];
    name = api["name"];
  }
}
