import 'package:exampleapp/app/models/Location.dart';
import 'package:exampleapp/app/modules/assets/assets_store.dart';
import 'package:exampleapp/app/modules/assets/widgets/AssetBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class LocationBox extends StatelessWidget {
  LocationBox(this.location);
  final AssetsStore store = Modular.get();
  final Location location;

  @override
  Widget build(BuildContext context) {
    double pad = MediaQuery.of(context).size.width * .05;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: pad * 17,
          padding: EdgeInsets.all(pad / 1.5),
          decoration: BoxDecoration(border: Border.all(color: Color(0xFFD8DFE6)), borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              store.filteredLocationsList.where((sublocation) => sublocation.parentId == location.id).isNotEmpty || store.filteredAssetsList.where((subAsset) => subAsset.locationId == location.id).isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(right: pad / 2),
                      child: SvgPicture.asset("assets/arrowDown.svg"),
                    )
                  : Container(),
              SvgPicture.asset("assets/locationIcon.svg"),
              SizedBox(width: pad / 2),
              Text(location.name!, style: TextStyle(color: Color(0xFF77818C), fontSize: 14)),
            ],
          ),
        ),
        store.filteredLocationsList.where((sublocation) => sublocation.parentId == location.id).isNotEmpty
            ? Wrap(
                direction: Axis.vertical,
                children: List.generate(
                  store.filteredLocationsList.where((sublocation) => sublocation.parentId == location.id).length,
                  (index) => IntrinsicHeight(
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: pad / 1.5), child: VerticalDivider(width: pad / 4, color: Color(0xFFD8DFE6))),
                        Container(margin: EdgeInsets.only(top: pad / 2), child: LocationBox(store.filteredLocationsList.where((sublocation) => sublocation.parentId == location.id).toList()[index])),
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
        store.filteredAssetsList.where((subAsset) => subAsset.locationId == location.id).isNotEmpty
            ? Wrap(
                direction: Axis.vertical,
                children: List.generate(
                  store.filteredAssetsList.where((subAsset) => subAsset.locationId == location.id).length,
                  (index) => IntrinsicHeight(
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: pad / 1.5), child: VerticalDivider(width: pad / 4, color: Color(0xFFD8DFE6))),
                        Container(margin: EdgeInsets.only(top: pad / 2), child: AssetBox(store.filteredAssetsList.where((subAsset) => subAsset.locationId == location.id).toList()[index])),
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
