// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$selectedCompanyAtom =
      Atom(name: '_HomeStoreBase.selectedCompany', context: context);

  @override
  Company? get selectedCompany {
    _$selectedCompanyAtom.reportRead();
    return super.selectedCompany;
  }

  @override
  set selectedCompany(Company? value) {
    _$selectedCompanyAtom.reportWrite(value, super.selectedCompany, () {
      super.selectedCompany = value;
    });
  }

  late final _$currentCompanyLocationListAtom =
      Atom(name: '_HomeStoreBase.currentCompanyLocationList', context: context);

  @override
  List<Location> get currentCompanyLocationList {
    _$currentCompanyLocationListAtom.reportRead();
    return super.currentCompanyLocationList;
  }

  @override
  set currentCompanyLocationList(List<Location> value) {
    _$currentCompanyLocationListAtom
        .reportWrite(value, super.currentCompanyLocationList, () {
      super.currentCompanyLocationList = value;
    });
  }

  late final _$currentCompanyAssetListAtom =
      Atom(name: '_HomeStoreBase.currentCompanyAssetList', context: context);

  @override
  List<Asset> get currentCompanyAssetList {
    _$currentCompanyAssetListAtom.reportRead();
    return super.currentCompanyAssetList;
  }

  @override
  set currentCompanyAssetList(List<Asset> value) {
    _$currentCompanyAssetListAtom
        .reportWrite(value, super.currentCompanyAssetList, () {
      super.currentCompanyAssetList = value;
    });
  }

  @override
  String toString() {
    return '''
selectedCompany: ${selectedCompany},
currentCompanyLocationList: ${currentCompanyLocationList},
currentCompanyAssetList: ${currentCompanyAssetList}
    ''';
  }
}
