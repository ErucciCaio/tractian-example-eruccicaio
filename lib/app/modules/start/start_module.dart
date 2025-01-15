import 'package:exampleapp/app/modules/start/start_page.dart';
import 'package:exampleapp/app/modules/start/start_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => StartStore());
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => StartPage());
  }
}
