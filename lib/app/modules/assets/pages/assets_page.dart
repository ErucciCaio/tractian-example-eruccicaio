import 'package:exampleapp/app/modules/assets/assets_store.dart';
import 'package:exampleapp/app/modules/assets/widgets/AssetBox.dart';
import 'package:exampleapp/app/modules/assets/widgets/LocationBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class AssetsPage extends StatefulWidget {
  final String title;
  const AssetsPage({super.key, this.title = 'AssetsPage'});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  AssetsStore store = Modular.get();
  @override
  void initState() {
    super.initState();
    store.searchLists();
  }

  @override
  Widget build(BuildContext context) {
    double pad = MediaQuery.of(context).size.width * .05;
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          centerTitle: true,
          surfaceTintColor: null,
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF17192D),
          title: Text("Assets", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        body: Container(
          padding: EdgeInsets.all(pad / 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(offset: Offset(-2.5, 3.5), color: Colors.black12)]),
                  child: TextFormField(
                    controller: store.controllerSearch,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    onChanged: (text) => store.searchLists(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFEAEFF3),
                      labelText: "Search Location, Component or Asset",
                      labelStyle: TextStyle(color: Color(0xFF8E98A3), fontSize: 14),
                      prefixIcon: Icon(Icons.search, color: Color(0xFF8E98A3), size: 20),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ),
                SizedBox(height: pad),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(border: Border.all(color: Color(0xFFD8DFE6)), borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                          onPressed: () {
                            store.filterEnergy = !store.filterEnergy;
                            store.searchLists();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(store.filterEnergy ? "assets/energyFilterOn.svg" : "assets/energyFilterOff.svg"),
                              SizedBox(width: pad / 4),
                              Text("Energy Sensors", style: TextStyle(color: store.filterEnergy ? Colors.white : Color(0xFF77818C), fontSize: 14)),
                            ],
                          ),
                          style: ButtonStyle(
                            elevation: WidgetStateProperty.resolveWith((states) => 0),
                            backgroundColor: WidgetStateColor.resolveWith((states) => store.filterEnergy ? Color(0xFF2188FF) : Colors.white),
                            padding: WidgetStateProperty.resolveWith((states) => EdgeInsets.all(pad / 2)),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ),
                      SizedBox(width: pad / 2),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(border: Border.all(color: Color(0xFFD8DFE6)), borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                          onPressed: () {
                            store.filterCritical = !store.filterCritical;
                            store.searchLists();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(store.filterCritical ? "assets/criticalFilterOn.svg" : "assets/criticalFilterOff.svg"),
                              SizedBox(width: pad / 4),
                              Text("Critical Status", style: TextStyle(color: store.filterCritical ? Colors.white : Color(0xFF77818C), fontSize: 14)),
                            ],
                          ),
                          style: ButtonStyle(
                            elevation: WidgetStateProperty.resolveWith((states) => 0),
                            padding: WidgetStateProperty.resolveWith((states) => EdgeInsets.all(pad / 2)),
                            backgroundColor: WidgetStateColor.resolveWith((states) => store.filterCritical ? Color(0xFF2188FF) : Colors.white),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: pad / 2),
                Divider(),
                SizedBox(height: pad / 2),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: pad / 2,
                        direction: Axis.vertical,
                        children: List.generate(
                          store.filteredLocationsList.where((location) => location.companyId == store.homeStore.selectedCompany!.id && location.parentId == null).length,
                          (index) {
                            return LocationBox(store.filteredLocationsList.where((location) => location.companyId == store.homeStore.selectedCompany!.id && location.parentId == null).toList()[index]);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: pad / 2),
                        child: Wrap(
                          spacing: pad / 2,
                          direction: Axis.vertical,
                          children: List.generate(
                            store.filteredAssetsList.where((asset) => asset.companyId == store.homeStore.selectedCompany!.id && asset.parentId == null && asset.locationId == null).length,
                            (index) {
                              return AssetBox(store.filteredAssetsList.where((asset) => asset.companyId == store.homeStore.selectedCompany!.id && asset.parentId == null && asset.locationId == null).toList()[index]);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: pad / 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
