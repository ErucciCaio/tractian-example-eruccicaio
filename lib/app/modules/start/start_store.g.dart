// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartStore on _StartStoreBase, Store {
  late final _$listCompaniesAtom =
      Atom(name: '_StartStoreBase.listCompanies', context: context);

  @override
  List<Company> get listCompanies {
    _$listCompaniesAtom.reportRead();
    return super.listCompanies;
  }

  @override
  set listCompanies(List<Company> value) {
    _$listCompaniesAtom.reportWrite(value, super.listCompanies, () {
      super.listCompanies = value;
    });
  }

  late final _$listLocationsAtom =
      Atom(name: '_StartStoreBase.listLocations', context: context);

  @override
  List<Location> get listLocations {
    _$listLocationsAtom.reportRead();
    return super.listLocations;
  }

  @override
  set listLocations(List<Location> value) {
    _$listLocationsAtom.reportWrite(value, super.listLocations, () {
      super.listLocations = value;
    });
  }

  late final _$listAssetsAtom =
      Atom(name: '_StartStoreBase.listAssets', context: context);

  @override
  List<Asset> get listAssets {
    _$listAssetsAtom.reportRead();
    return super.listAssets;
  }

  @override
  set listAssets(List<Asset> value) {
    _$listAssetsAtom.reportWrite(value, super.listAssets, () {
      super.listAssets = value;
    });
  }

  late final _$carregarDadosAsyncAction =
      AsyncAction('_StartStoreBase.carregarDados', context: context);

  @override
  Future<bool> carregarDados() {
    return _$carregarDadosAsyncAction.run(() => super.carregarDados());
  }

  @override
  String toString() {
    return '''
listCompanies: ${listCompanies},
listLocations: ${listLocations},
listAssets: ${listAssets}
    ''';
  }
}
