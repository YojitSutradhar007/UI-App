import "package:ecommerce/resources/import_resources.dart";
import "package:ecommerce/view_models/product_view_model.dart";
import "package:flutter/material.dart";
import "../../resources/resources.dart";
import "../../widget/reuse_widget.dart";
import "../screens.dart";

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  final List<CategoryList> cardData = [
    CategoryList(label: "Clothing", icon: IconsAssets.clothLogo, suffix: "cloth"),
    CategoryList(label: "Cosmetics", icon: IconsAssets.cosmeticsLogo, suffix: "skin"),
    CategoryList(label: "Shoes", icon: IconsAssets.sneakersLogo, suffix: "shoes"),
    CategoryList(label: "Phones", icon: IconsAssets.phoneLogo, suffix: "phone"),
    CategoryList(label: "Women's product", icon: IconsAssets.womenLogo, suffix: "women"),
    CategoryList(label: "Men's product", icon: IconsAssets.menLogo, suffix: "men"),
  ];

  void onTap(String suffix) {
    Get.to(SearchProduct(
      searchText: suffix,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final searchData = Provider.of<SearchProductData>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackIconButton(topPadding: 0),
                  IcnButton(
                    onPressed: () {},
                    child: Image.asset(
                      IconsAssets.searchLogo,
                      height: 25,
                    ),
                  )
                ],
              ),
              DesignText(
                text: StringManager.categories,
                fontSize: 20,
                color: ColorManager.blackColor,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cardData.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        onTap(cardData[index].suffix.toString());
                        searchData.loading = true;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15).r,
                        child: Container(
                          padding: const EdgeInsets.only(left: 25, right: 25).r,
                          height: 60.h,
                          width: double.infinity,
                          decoration:
                              BoxDecoration(color: ColorManager.blackColor, borderRadius: BorderRadius.circular(50).w),
                          child: Row(
                            children: [
                              Image.asset(
                                cardData[index].icon.toString(),
                                height: 30.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10).r,
                                child: DesignText(
                                  text: cardData[index].label.toString(),
                                  fontSize: 14.sp,
                                  color: ColorManager.whiteColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
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

class CategoryList {
  CategoryList({
    required this.label,
    required this.icon,
    required this.suffix,
  });

  final String label;
  final String icon;
  final String suffix;
}
