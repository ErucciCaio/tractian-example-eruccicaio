import 'package:exampleapp/app/modules/assets/assets_module.dart';
import 'package:exampleapp/app/modules/assets/assets_store.dart';
import 'package:exampleapp/app/modules/home/home_module.dart';
import 'package:exampleapp/app/modules/home/home_store.dart';
import 'package:exampleapp/app/modules/start/start_module.dart';
import 'package:exampleapp/app/modules/start/start_page.dart';
import 'package:exampleapp/app/modules/start/start_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => StartStore());
    i.addLazySingleton(() => HomeStore());
    i.addLazySingleton(() => AssetsStore());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => StartPage(), transition: TransitionType.noTransition);
    r.module("/Start", module: StartModule(), transition: TransitionType.noTransition);
    r.module("/Home", module: HomeModule(), transition: TransitionType.noTransition);
    r.module("/Assets", module: AssetsModule(), transition: TransitionType.noTransition);
  }
}
