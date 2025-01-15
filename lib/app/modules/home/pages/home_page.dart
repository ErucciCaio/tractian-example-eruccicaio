import 'package:exampleapp/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, this.title = 'HomePage'});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    double pad = MediaQuery.of(context).size.width * .05;
    return Scaffold(
      appBar: AppBar(elevation: 0, titleSpacing: 0, centerTitle: true, surfaceTintColor: null, automaticallyImplyLeading: false, backgroundColor: Color(0xFF17192D), title: SvgPicture.asset("assets/logo.svg")),
      body: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(pad / 2),
        child: SingleChildScrollView(
          child: Observer(builder: (context) {
            return Column(
              children: List.generate(
                store.startStore.listCompanies.length,
                (index) => Container(
                  width: pad * 19,
                  padding: EdgeInsets.all(pad),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ElevatedButton(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/companyIcon.svg"),
                        SizedBox(width: pad),
                        Text("${store.startStore.listCompanies[index].name} Unit", style: TextStyle(color: Colors.white, fontSize: 18)),
                      ],
                    ),
                    onPressed: () {
                      store.selectedCompany = store.startStore.listCompanies[index];
                      store.currentCompanyAssetList = store.startStore.listAssets.where((asset) => asset.companyId == store.selectedCompany!.id).toList();
                      store.currentCompanyLocationList = store.startStore.listLocations.where((location) => location.companyId == store.selectedCompany!.id).toList();
                      Modular.to.pushNamed("/Assets/");
                    },
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.resolveWith((states) => 0),
                      padding: WidgetStateProperty.resolveWith((states) => EdgeInsets.all(pad)),
                      backgroundColor: WidgetStateColor.resolveWith((states) => Color(0xFF2188FF)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
