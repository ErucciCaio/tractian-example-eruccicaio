import 'dart:convert';

import 'package:exampleapp/app/models/Asset.dart';
import 'package:exampleapp/app/models/Company.dart';
import 'package:exampleapp/app/models/Location.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;

abstract class _StartStoreBase with Store {
  void initialize() async {
    await carregarDados();
    await Modular.to.pushNamed("/Home/");
  }

  @observable
  List<Company> listCompanies = [];
  @observable
  List<Location> listLocations = [];
  @observable
  List<Asset> listAssets = [];

  @action
  Future<bool> carregarDados() async {
    final response = await http.get(Uri.parse("https://fake-api.tractian.com/companies"));
    var data = await jsonDecode(response.body.toString());
    (data as List).forEach((company) => listCompanies.add(Company.fromAPI(company)));
    listCompanies.forEach((company) async {
      final resLocations = await http.get(Uri.parse("https://fake-api.tractian.com/companies/${company.id}/locations"));
      final resAssets = await http.get(Uri.parse("https://fake-api.tractian.com/companies/${company.id}/assets"));
      var dataLocations = jsonDecode(resLocations.body.toString());
      (dataLocations as List).forEach((location) => listLocations.add(Location.fromAPI(location, company.id!)));
      var dataAssets = jsonDecode(resAssets.body.toString());
      (dataAssets as List).forEach((asset) => listAssets.add(Asset.fromAPI(asset, company.id!)));
    });
    return true;
  }
}
