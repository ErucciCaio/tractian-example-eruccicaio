import 'package:exampleapp/app/models/Asset.dart';
import 'package:exampleapp/app/models/Company.dart';
import 'package:exampleapp/app/models/Location.dart';
import 'package:exampleapp/app/modules/start/start_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final StartStore startStore = Modular.get();

  @observable
  Company? selectedCompany;

  @observable
  List<Location> currentCompanyLocationList = [];
  @observable
  List<Asset> currentCompanyAssetList = [];
}
