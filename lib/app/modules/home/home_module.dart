import 'package:exampleapp/app/modules/home/home_store.dart';
import 'package:exampleapp/app/modules/home/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => HomeStore());
  }

  @override
  void routes(r) {
    r.child("/", child: (context) => HomePage());
  }
}
