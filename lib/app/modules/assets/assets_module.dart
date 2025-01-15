import 'package:exampleapp/app/modules/assets/assets_store.dart';
import 'package:exampleapp/app/modules/assets/pages/assets_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AssetsModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => AssetsStore());
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => AssetsPage());
  }
}
