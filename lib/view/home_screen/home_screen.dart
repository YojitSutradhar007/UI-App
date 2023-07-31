import 'package:ecommerce/router/route_name.dart';
import 'package:ecommerce/user_preferences/user_preferences.dart';
import 'package:ecommerce/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import 'package:ecommerce/resources/import_resources.dart';
import '../../widget/reuse_widget.dart';
import 'components/all_product.dart';
import '../../listdata/data.dart';

import 'package:ecommerce/view/screens.dart';

// ignore: must_be_immutable


class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final TextEditingController _searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchData = Provider.of<SearchProductData>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15.0, left: 15.0).w,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: ColorManager.whiteColor,
                expandedHeight: 145.h,
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                  margin: const EdgeInsets.only(top: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IcnButton(
                              onPressed: () {
                                context.push(RoutesName.categoriesScreen);
                              },
                              iconSize: 45,
                              child: Image.asset(IconsAssets.dashboardLogo)),
                          IcnButton(
                            iconSize: 45,
                            onPressed: () {
                              context.push(RoutesName.userProfileScreen);

                            },
                            child: CrcleAvatar(
                              color: RGBColorManager.rgbWhiteColor,
                              radius: 45,
                              child: Image.asset(IconsAssets.userLogo),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20).r,
                        child: const RichTxt(
                          text_1: "Welcome\n",
                          text_2: "Our Fashions App",
                          textSize_1: 30,
                          textSize_2: 25,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ];
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(
                textCtrl: _searchCtrl,
                onPressed: () {
                  debugPrint("search icon");
                  // Get.to(
                  //   SearchProduct(
                  //     searchText: _searchCtrl.text.trim(),
                  //   ),
                  // );
                  _searchCtrl.text = "";
                  searchData.loading = true;
                },
                child: IcnButton(
                  iconSize: 0,
                  onPressed: () {
                    context.push(RoutesName.filterScreen);

                  },
                  child: CrcleAvatar(
                    radius: 23,
                    color: ColorManager.blackColor,
                    child: Image.asset(
                      IconsAssets.filterLogo,
                    ),
                  ),
                ),
              ),
              DesignText(padding: 8, fontSize: 20, text: "Categories", color: ColorManager.blackColor),
              Padding(
                padding: const EdgeInsets.only(top: 8).r,
                child: SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ProductCategory.category.length,
                    itemBuilder: (BuildContext context, index) {
                      return CategoryButton(
                        label: ProductCategory.category[index],
                        index: index,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DesignText(padding: 8, fontSize: 18, text: "TopDress", color: ColorManager.blackColor),
                  DesignText(padding: 8, fontSize: 12, text: "View all", color: ColorManager.darkGreyColor),
                ],
              ),
              Expanded(
                child: Consumer<ProductData>(
                  builder: (context, value, child) {
                    return value.loading ? const LoadingListPage() : const AllProduct();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
