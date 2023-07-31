import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../../listdata/data.dart';
import '../../widget/reuse_widget.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0).w,
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 80.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.greyOpacityColor,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 0.5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 75,
                        decoration: BoxDecoration(
                            color: ColorManager.greyOpacityColor,
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://c4.wallpaperflare.com/wallpaper/100/30/528/anime-naruto-itachi-uchiha-wallpaper-preview.jpg")),
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.all(11).w,
                      ),
                      SizedBox(
                        height: 70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "ABX",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeightManager.bold),
                            ),
                            Text(
                              "ABx@gmail.com",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeightManager.medium,
                                  color: ColorManager.greyOpacityColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Box(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 18).r,
                  itemCount: OptionButton.userAccountOptions_1.length,
                  itemBuilder: (BuildContext context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DesignLabel(
                          onTap: () {
                            context.push(OptionButton.userAccountOptions_1[index].navigation);
                          },
                          sizeBoxWidth: 230,
                          label_1: OptionButton.userAccountOptions_1[index].label,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, right: 15).r,
                            child: WhiteContainer(iconAsset: OptionButton.userAccountOptions_1[index].iconAsset),
                          ),
                        ),
                        IconNavigation(
                          navigation: OptionButton.userAccountOptions_1[index].navigation,
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
              Box(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 10, top: 15).r,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: OptionButton.userAccountOptions_2.length,
                  itemBuilder: (BuildContext context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DesignLabel(
                          onTap: () {
                            context.push(OptionButton.userAccountOptions_2[index].navigation);
                          },
                          sizeBoxWidth: 230,
                          label_1: OptionButton.userAccountOptions_2[index].label,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, right: 15),
                            child: WhiteContainer(iconAsset: OptionButton.userAccountOptions_2[index].iconAsset),
                          ),
                        ),
                        IconNavigation(
                          navigation: OptionButton.userAccountOptions_2[index].navigation,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconNavigation extends StatelessWidget {
  const IconNavigation({super.key, required this.navigation});

  final String navigation;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.push(navigation);
      },
      icon: Image.asset(IconsAssets.rightArrowLogo, height: 15),
    );
  }
}
