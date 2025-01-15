class Asset {
  String? companyId;
  String? id;
  String? name;
  String? gatewayId;
  String? locationId;
  String? parentId;
  String? sensorId;
  String? sensorType;
  String? status;

  Asset(this.id, this.gatewayId, this.locationId, this.name, this.parentId, this.sensorId, this.sensorType, this.status);

  Asset.fromAPI(Map<String, dynamic> api, String company) {
    companyId = company;
    id = api["id"];
    name = api["name"];
    gatewayId = api["gatewayId"];
    locationId = api["locationId"];
    parentId = api["parentId"];
    sensorId = api["sensorId"];
    sensorType = api["sensorType"];
    status = api["status"];
  }
}
