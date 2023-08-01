import '../../models/model.dart';
import '../../resources/resources.dart';
import '../../resources/import_resources.dart';
import '../../listdata/data.dart';
import 'package:flutter/material.dart';
import '../../widget/reuse_widget.dart';
import '../../provider/page_index.dart';

// ignore: must_be_immutable
class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({Key? key, required this.dataModel}) : super(key: key);

  final Product dataModel;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final activeIndex = Provider.of<PageIndex>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onDoubleTap: () {
                    debugPrint("Navigate image");
                    // Get.to(ProductView(
                    //   images: model[index].images!,
                    // ));
                  },
                  child: Hero(
                    tag: "image",
                    child: CarouselSlider.builder(
                      itemCount: dataModel.images!.length,
                      options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            pageIndex = activeIndex.changeIndex(index, pageIndex);
                          },
                          height: 320.h,
                          viewportFraction: 1,
                          enableInfiniteScroll: false),
                      itemBuilder: (BuildContext context, _, pageIndex) {
                        return Image.network(
                          dataModel.images![_],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 320.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0).w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BackIconButton(topPadding: 30),
                            Padding(
                              padding: const EdgeInsets.only(right: 10, top: 35).r,
                              child: CrcleAvatar(
                                color: RGBColorManager.rgbWhiteColor,
                                radius: 22,
                                child: Image.asset(IconsAssets.shoppingBagLogo),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Consumer<PageIndex>(builder: (context, value, child) {
                              return AnimatedSmoothIndicator(
                                activeIndex: pageIndex,
                                count: dataModel.images!.length,
                                effect: ExpandingDotsEffect(
                                    dotHeight: 7.h,
                                    dotWidth: 8.w,
                                    activeDotColor: ColorManager.blackColor,
                                    dotColor: ColorManager.greyColor),
                              );
                            }),
                            Padding(
                              padding: const EdgeInsets.only(left: 80, right: 15, bottom: 5).r,
                              child: const AnimatedIconButton(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DesignText(
                              padding: 0,
                              text: dataModel.title.toString(),
                              fontSize: 15,
                              color: ColorManager.blackColor),
                          DesignText(
                              padding: 0,
                              text: dataModel.brand.toString(),
                              fontSize: 12,
                              color: ColorManager.greyColor),
                        ],
                      ),
                      Column(
                        children: [
                          PlusMinus(color: RGBColorManager.rgbWhiteColor),
                          DesignText(
                              padding: 5,
                              text: "Availability in Stock",
                              fontSize: 13,
                              color: ColorManager.darkGreyColor),
                        ],
                      )
                    ],
                  ),
                  DesignText(padding: 5, text: "Stock", fontSize: 17, color: ColorManager.blackColor),
                  Padding(
                    padding: const EdgeInsets.only(top: 5).r,
                    child: SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: ProductCategory.clothSize.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5).r,
                            child: CrcleAvatar(
                              radius: 25,
                              color: RGBColorManager.rgbWhiteColor,
                              child: Text(
                                ProductCategory.clothSize[index],
                                style:
                                    fontWeightSizeColorTextStyle(FontWeightManager.bold, 18, ColorManager.blackColor),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  DesignText(padding: 5, text: "Description", fontSize: 17, color: ColorManager.blackColor),
                  Text(
                    dataModel.description.toString(),
                    style: TextStyle(fontSize: 15, color: ColorManager.darkGreyColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: PrimaryButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                IconsAssets.applyLogo,
                height: 18,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                "Add to Cart",
                style: fontSizeWeightTextStyle(17, FontWeightManager.semiBold),
              )
            ],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
