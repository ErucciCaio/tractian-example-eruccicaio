class Location {
  String? companyId;
  String? id;
  String? name;
  String? parentId;

  Location(this.companyId, this.id, this.name, this.parentId);

  Location.fromAPI(Map<String, dynamic> api, String company) {
    companyId = company;
    id = api["id"];
    name = api["name"];
    parentId = api["parentId"];
  }
}
