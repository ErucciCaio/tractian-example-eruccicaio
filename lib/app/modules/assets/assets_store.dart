import 'package:exampleapp/app/models/Asset.dart';
import 'package:exampleapp/app/models/Location.dart';
import 'package:exampleapp/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'assets_store.g.dart';

class AssetsStore = _AssetsStoreBase with _$AssetsStore;

abstract class _AssetsStoreBase with Store {
  final HomeStore homeStore = Modular.get();

  @observable
  bool filterEnergy = false;
  @observable
  bool filterCritical = false;

  @observable
  TextEditingController controllerSearch = TextEditingController();

  @observable
  List<Location> filteredLocationsList = [];
  @observable
  List<Asset> filteredAssetsList = [];

  searchLists() {
    filteredAssetsList = [];
    filteredLocationsList = [];
    String search = controllerSearch.text.trim();
    filterCritical || filterEnergy
        ? null
        : homeStore.currentCompanyLocationList.where((location) => location.name!.toLowerCase().contains(search.toLowerCase())).forEach((location) {
            !filteredLocationsList.contains(location) ? filteredLocationsList.add(location) : null;
            addAllParents(location: location);
          });
    filterEnergy
        ? filterCritical
            ? homeStore.currentCompanyAssetList.where((asset) => asset.name!.toLowerCase().contains(search.toLowerCase()) && asset.status == "alert" && asset.sensorType == "energy").forEach((asset) {
                !filteredAssetsList.contains(asset) ? filteredAssetsList.add(asset) : null;
                addAllParents(asset: asset);
              })
            : homeStore.currentCompanyAssetList.where((asset) => asset.name!.toLowerCase().contains(search.toLowerCase()) && asset.sensorType == "energy").forEach((asset) {
                !filteredAssetsList.contains(asset) ? filteredAssetsList.add(asset) : null;
                addAllParents(asset: asset);
              })
        : filterCritical
            ? homeStore.currentCompanyAssetList.where((asset) => asset.name!.toLowerCase().contains(search.toLowerCase()) && asset.status == "alert").forEach((asset) {
                !filteredAssetsList.contains(asset) ? filteredAssetsList.add(asset) : null;
                addAllParents(asset: asset);
              })
            : homeStore.currentCompanyAssetList.where((asset) => asset.name!.toLowerCase().contains(search.toLowerCase())).forEach((asset) {
                !filteredAssetsList.contains(asset) ? filteredAssetsList.add(asset) : null;
                addAllParents(asset: asset);
              });
  }

  addAllParents({Asset? asset, Location? location}) {
    if (asset != null) {
      homeStore.currentCompanyAssetList.where((element) => element.companyId == homeStore.selectedCompany!.id).forEach(
        (parentAsset) {
          if (asset.parentId != null && asset.parentId == parentAsset.id && !filteredAssetsList.contains(parentAsset)) {
            filteredAssetsList.add(parentAsset);
            addAllParents(asset: parentAsset);
          }
        },
      );
      homeStore.currentCompanyLocationList.where((element) => element.companyId == homeStore.selectedCompany!.id).forEach(
        (parentLocation) {
          if (asset.locationId != null && asset.locationId == parentLocation.id && !filteredLocationsList.contains(parentLocation)) {
            filteredLocationsList.add(parentLocation);
            addAllParents(location: parentLocation);
          }
        },
      );
    }
    if (location != null) {
      homeStore.currentCompanyLocationList.where((element) => element.companyId == homeStore.selectedCompany!.id).forEach(
        (parentLocation) {
          if (location.parentId != null && location.parentId == parentLocation.id && !filteredLocationsList.contains(parentLocation)) {
            filteredLocationsList.add(parentLocation);
            addAllParents(location: parentLocation);
          }
        },
      );
    }
  }
}
