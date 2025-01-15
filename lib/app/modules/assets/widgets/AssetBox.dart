import 'package:exampleapp/app/models/Asset.dart';
import 'package:exampleapp/app/modules/assets/assets_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class AssetBox extends StatelessWidget {
  AssetBox(this.asset);
  final AssetsStore store = Modular.get();
  final Asset asset;

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
              store.filteredAssetsList.where((subAsset) => subAsset.parentId == asset.id).isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(right: pad / 2),
                      child: SvgPicture.asset("assets/arrowDown.svg"),
                    )
                  : Container(),
              SvgPicture.asset(asset.sensorId != null ? "assets/componentIcon.svg" : "assets/assetIcon.svg"),
              SizedBox(width: pad / 2),
              Text(asset.name!, style: TextStyle(color: Color(0xFF77818C), fontSize: 14)),
              asset.sensorId != null
                  ? Padding(
                      padding: EdgeInsets.only(left: pad / 2),
                      child: SvgPicture.asset(
                        asset.sensorType == "energy"
                            ? asset.status == "operating"
                                ? "assets/energyIconOperating.svg"
                                : "assets/energyIconAlert.svg"
                            : asset.status == "operating"
                                ? "assets/vibrationIconOperating.svg"
                                : "assets/vibrationIconAlert.svg",
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        store.filteredAssetsList.where((subAsset) => subAsset.parentId == asset.id).isNotEmpty
            ? Wrap(
                direction: Axis.vertical,
                children: List.generate(
                  store.filteredAssetsList.where((subAsset) => subAsset.parentId == asset.id).length,
                  (index) => IntrinsicHeight(
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: pad / 1.5), child: VerticalDivider(width: pad / 4, color: Color(0xFFD8DFE6))),
                        Container(margin: EdgeInsets.only(top: pad / 2), child: AssetBox(store.filteredAssetsList.where((subAsset) => subAsset.parentId == asset.id).toList()[index])),
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
