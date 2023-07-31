import 'package:flutter/material.dart';
import '../../listdata/product_categorylist.dart';
import '../../resources/import_resources.dart';
import '../../resources/resources.dart';
import '../../widget/reuse_widget.dart';
import '../../provider/range_slider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackIconButton(topPadding: 30),
            DesignText(padding: 8, fontSize: 18, text: "Categories", color: ColorManager.blackColor),
            SizedBox(
              height: 190.h,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 4 / 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CategoryButton(
                    label: ProductCategory.category[index],
                    index: index + 30,
                  );
                },
              ),
            ),
            DesignText(padding: 8, fontSize: 18, text: "Price range", color: ColorManager.blackColor),
            Consumer<RangeSlide>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 380,
                        height: 50,
                        child: RangeSlider(
                          activeColor: ColorManager.blackColor,
                          inactiveColor: const Color.fromRGBO(241, 242, 245, 1),
                          values: value.currentRangeValues,
                          min: 0,
                          max: 100,
                          labels: RangeLabels(
                            value.currentRangeValues.start.round().toString(),
                            value.currentRangeValues.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            value.onchange(values);
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichTxt(
                            text_1: "Low Price\n",
                            text_2: value.currentRangeValues.start.round().toString(),
                            textSize_1: 15,
                            textSize_2: 11),
                        RichTxt(
                            text_1: "High Price\n",
                            text_2: value.currentRangeValues.end.round().toString(),
                            textSize_1: 15,
                            textSize_2: 11),
                      ],
                    )
                  ],
                );
              },
            ),
            DesignText(padding: 8, fontSize: 18, text: "Sort By", color: ColorManager.blackColor),
            SizedBox(
              height: 70,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ProductCategory.sortBy.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 4 / 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CategoryButton(
                    label: ProductCategory.sortBy[index],
                    index: index + 40,
                  );
                },
              ),
            ),
            DesignText(padding: 8, fontSize: 18, text: "Ratting by", color: ColorManager.blackColor),
            PrimaryButton(
              onPressed: () {
                Get.back();
              },
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
                    "Apply now",
                    style: fontSizeWeightTextStyle(17, FontWeightManager.semiBold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
