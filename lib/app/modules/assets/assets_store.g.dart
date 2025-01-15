// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AssetsStore on _AssetsStoreBase, Store {
  late final _$filterEnergyAtom =
      Atom(name: '_AssetsStoreBase.filterEnergy', context: context);

  @override
  bool get filterEnergy {
    _$filterEnergyAtom.reportRead();
    return super.filterEnergy;
  }

  @override
  set filterEnergy(bool value) {
    _$filterEnergyAtom.reportWrite(value, super.filterEnergy, () {
      super.filterEnergy = value;
    });
  }

  late final _$filterCriticalAtom =
      Atom(name: '_AssetsStoreBase.filterCritical', context: context);

  @override
  bool get filterCritical {
    _$filterCriticalAtom.reportRead();
    return super.filterCritical;
  }

  @override
  set filterCritical(bool value) {
    _$filterCriticalAtom.reportWrite(value, super.filterCritical, () {
      super.filterCritical = value;
    });
  }

  late final _$controllerSearchAtom =
      Atom(name: '_AssetsStoreBase.controllerSearch', context: context);

  @override
  TextEditingController get controllerSearch {
    _$controllerSearchAtom.reportRead();
    return super.controllerSearch;
  }

  @override
  set controllerSearch(TextEditingController value) {
    _$controllerSearchAtom.reportWrite(value, super.controllerSearch, () {
      super.controllerSearch = value;
    });
  }

  late final _$filteredLocationsListAtom =
      Atom(name: '_AssetsStoreBase.filteredLocationsList', context: context);

  @override
  List<Location> get filteredLocationsList {
    _$filteredLocationsListAtom.reportRead();
    return super.filteredLocationsList;
  }

  @override
  set filteredLocationsList(List<Location> value) {
    _$filteredLocationsListAtom.reportWrite(value, super.filteredLocationsList,
        () {
      super.filteredLocationsList = value;
    });
  }

  late final _$filteredAssetsListAtom =
      Atom(name: '_AssetsStoreBase.filteredAssetsList', context: context);

  @override
  List<Asset> get filteredAssetsList {
    _$filteredAssetsListAtom.reportRead();
    return super.filteredAssetsList;
  }

  @override
  set filteredAssetsList(List<Asset> value) {
    _$filteredAssetsListAtom.reportWrite(value, super.filteredAssetsList, () {
      super.filteredAssetsList = value;
    });
  }

  @override
  String toString() {
    return '''
filterEnergy: ${filterEnergy},
filterCritical: ${filterCritical},
controllerSearch: ${controllerSearch},
filteredLocationsList: ${filteredLocationsList},
filteredAssetsList: ${filteredAssetsList}
    ''';
  }
}
