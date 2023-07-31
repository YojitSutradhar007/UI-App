import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/router/route_name.dart';
import 'package:flutter/material.dart';
import '../../provider/theme_mode.dart';
import '../../resources/resources.dart';
import '../../listdata/data.dart';
import '../../user_preferences/user_preferences.dart';
import '../../widget/reuse_widget.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
  final userPreferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ThemeChange>(context, listen: false);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8).w,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: const BackIconButton(
                  topPadding: 5,
                ),
                backgroundColor: ColorManager.whiteColor,
                expandedHeight: 10.h,
                title: Text(
                  "User profile",
                  style: TextStyle(color: ColorManager.blackColor, fontSize: 18.sp),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                bottom: 5,
                              ).r,
                              height: 70.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(const Radius.circular(16).w),
                                  color: ColorManager.pinkColor,
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://c4.wallpaperflare.com/wallpaper/100/30/528/anime-naruto-itachi-uchiha-wallpaper-preview.jpg"))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 5, bottom: 5).r,
                                      padding: const EdgeInsets.all(5).w,
                                      decoration: BoxDecoration(
                                          color: ColorManager.whiteColor,
                                          borderRadius: BorderRadius.all(const Radius.circular(9).w)),
                                      child: Image.asset(
                                        IconsAssets.editLogo,
                                        height: 14.5.h,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "Upload image",
                              style: fontSizeWeightTextStyle(13.sp, FontWeightManager.bold),
                            )
                          ],
                        ),
                      ),
                      Label(
                        label: "Name",
                        child: Expanded(
                          child: NormalTextField(
                            fieldLength: 15,
                            keyboardType: TextInputType.name,
                            hintText: "Name",
                            textCtrl: null,
                            topMargin: null,
                            enabledInputBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.greyColor,
                                width: 2.1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                "Gender",
                                style: fontSizeColorTextStyle(18, ColorManager.greyColor),
                              ),
                            ),
                            Container(
                              width: 210.w,
                              margin: const EdgeInsets.only(right: 33, top: 15).r,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: RadioButtonList.data.length,
                                itemBuilder: (BuildContext context, index) {
                                  return CustoumRadioButton(
                                    width: RadioButtonList.data[index].width,
                                    label: RadioButtonList.data[index].label,
                                    index: index + 20,
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Label(
                        label: "Age\t\t\t",
                        child: Expanded(
                          child: NormalTextField(
                            fieldLength: 15,
                            keyboardType: TextInputType.name,
                            hintText: "Age",
                            textCtrl: null,
                            enabledInputBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.greyColor,
                                width: 2.1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Label(
                        label: "Email",
                        child: Expanded(
                          child: NormalTextField(
                            fieldLength: 15,
                            keyboardType: TextInputType.name,
                            hintText: "Email",
                            textCtrl: null,
                            enabledInputBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManager.greyColor,
                                width: 2.1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Setting",
                          style: fontWeightSizeColorTextStyle(FontWeightManager.bold, 16, Colors.black),
                        ),
                      ),
                      Box(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DesignLabel(
                                  onTap: () {
                                    context.push(RoutesName.selectLanguageScreen);
                                  },
                                  sizeBoxWidth: 200,
                                  label_1: "Language",
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 10, right: 15),
                                    child: WhiteContainer(iconAsset: IconsAssets.languageLogo),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DesignLabel(
                                  onTap: () {},
                                  sizeBoxWidth: 200,
                                  label_1: "Notification",
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 10, right: 15),
                                    child: WhiteContainer(iconAsset: IconsAssets.notificationLogo),
                                  ),
                                ),
                                SwitchButton(
                                  changed: false,
                                ),
                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              const DesignLabel(
                                sizeBoxWidth: 200,
                                label_1: "Dark Mode",
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10, right: 15),
                                  child: WhiteContainer(iconAsset: IconsAssets.darkThemeLogo),
                                ),
                              ),
                              SwitchButton(
                                changed: false,
                                perform: darkTheme.themeDarkTrue,
                              ),
                            ]),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DesignLabel(
                                  sizeBoxWidth: 200,
                                  label_1: "Help Center",
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10, right: 15),
                                    child: WhiteContainer(iconAsset: IconsAssets.helpCenterLogo),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      PrimaryButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: ColorManager.whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(const Radius.circular(20.0).w)),
                                child: SizedBox(
                                  height: 100.h,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Are you sure, you want to log out",
                                        style: TextStyle(fontSize: 18.sp),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: Size(80.w, 20.h),
                                                backgroundColor: ColorManager.blackColor,
                                                shape:
                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).w)),
                                            onPressed: () {
                                              userPreferences.logOutsetData(context);
                                            },
                                            child: Text(
                                              "Log out",
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: Size(70.w, 20.h),
                                                backgroundColor: ColorManager.blackColor,
                                                shape:
                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).w)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              "Close",
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconsAssets.logOutLogo,
                              height: 18,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Log out",
                              style: fontSizeWeightTextStyle(17, FontWeightManager.semiBold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Label extends StatelessWidget {
  Label({super.key, required this.label, required this.child});

  String label;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 50),
          child: Text(
            label,
            style: fontSizeColorTextStyle(18, ColorManager.greyColor),
          ),
        ),
        child
      ],
    );
  }
}
