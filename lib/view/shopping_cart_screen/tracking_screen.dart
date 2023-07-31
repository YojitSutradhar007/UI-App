import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/router/route_name.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../../widget/reuse_widget.dart';

class TrackingProduct extends StatelessWidget {
  TrackingProduct({Key? key}) : super(key: key);

  final TextEditingController _searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackIconButton(topPadding: 0),
              SearchWidget(
                textCtrl: _searchCtrl,
                onPressed: () {},
                child: IcnButton(
                  iconSize: 0,
                  onPressed: () {
                    context.push(RoutesName.filterScreen);
                  },
                  child: CrcleAvatar(
                    radius: 23,
                    color: ColorManager.blackColor,
                    child: Image.asset(
                      height: 20,
                      IconsAssets.barcodeLogo,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CardContainer(
                    allPadding: 14,
                    height: 150,
                    borderRadius: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const RichTxt(
                                text_1: "5645 4517 421\n", text_2: "Ena Express", textSize_1: 13, textSize_2: 10),
                            DesignText(text: "Transit", fontSize: 13, color: ColorManager.blackColor, padding: 0)
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichTxt(text_1: "25 June 2021\n", text_2: "Scaramnto", textSize_1: 13, textSize_2: 10),
                            RichTxt(text_1: "30 June 2021\n", text_2: "India", textSize_1: 13, textSize_2: 10),
                          ],
                        ),
                      ],
                    )),
              ),
              DesignText(text: StringManager.tracking, fontSize: 18, color: ColorManager.blackColor, padding: 10),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15).r,
                      child: CardContainer(
                        allPadding: 10,
                        height: 70,
                        borderRadius: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: WhiteContainer(iconAsset: IconsAssets.cargoTruckLogo),
                                ),
                                RichTxt(text_1: "Us 5454 5454\n", text_2: "Gujarat", textSize_1: 12, textSize_2: 10)
                              ],
                            ),
                            DesignText(text: "Delivered", fontSize: 15, color: ColorManager.greyColor, padding: 0)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(
                    width: 175,
                    height: 50,
                    borderRadius: 10,
                    child: DesignText(
                      text: "Continue payment",
                      fontSize: 15.sp,
                      color: ColorManager.whiteColor,
                    ),
                    onPressed: () {
                      context.push(RoutesName.paymentScreen);

                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
