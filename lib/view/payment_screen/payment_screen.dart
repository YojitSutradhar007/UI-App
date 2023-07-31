import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../models/model.dart';
import '../../resources/resources.dart';
import '../../widget/reuse_widget.dart';

// ignore: must_be_immutable
class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  List<CardList> card = [
    CardList(
        cardImage:
            "https://p1.hiclipart.com/preview/849/152/27/love-background-heart-mastercard-logo-credit-card-bank-card-maestro-visa-orange-png-clipart.jpg",
        cardName: "Credit Card"),
    CardList(cardImage: "https://avatars.githubusercontent.com/u/476675?s=280&v=4", cardName: "Paypal"),
    CardList(
        cardImage: "https://www.visa.com/images/merchantoffers/2022-09/1663659882602.visa_logo.jpg", cardName: "Visa"),
    CardList(
        cardImage:
            "https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1",
        cardName: "Google Pay"),
  ];

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
              DesignText(text: "Payment", fontSize: 20, color: ColorManager.blackColor),
              SizedBox(
                height: 285.h,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: card.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15).r,
                      child: CardContainer(
                        height: 55,
                        borderRadius: 25,
                        allPadding: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(card[index].cardImage.toString()),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  DesignText(
                                    text: card[index].cardName.toString(),
                                    fontSize: 15,
                                    color: ColorManager.blackColor,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                              child: Image.asset(IconsAssets.radioDisabledLogo),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [5, 4],
                radius: const Radius.circular(20).w,
                color: Colors.black,
                strokeWidth: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/AddPaymentScreen");
                  },
                  child: Container(
                    height: 45.h,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Image.asset(IconsAssets.addCircleLogo, height: 30),
                    ),
                  ),
                ),
              ),
              DesignText(text: "Total payment", fontSize: 18, color: ColorManager.blackColor, padding: 8),
              Container(
                margin: const EdgeInsets.only(top: 10).r,
                padding: const EdgeInsets.all(13).w,
                width: double.infinity,
                height: 105.h,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.grey400Color, width: 1.5),
                    borderRadius: BorderRadius.circular(20).w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DesignText(
                          text: "Subtotal: ",
                          fontSize: 15,
                          color: ColorManager.blackColor,
                        ),
                        DesignText(
                          text: "\$483 ",
                          fontSize: 17,
                          color: ColorManager.blackColor,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DesignText(
                          text: "Shipping: ",
                          fontSize: 15,
                          color: ColorManager.blackColor,
                        ),
                        DesignText(
                          text: "\$17 ",
                          fontSize: 17,
                          color: ColorManager.blackColor,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DesignText(
                          text: "BagTotal: ",
                          fontSize: 15,
                          color: ColorManager.blackColor,
                        ),
                        DesignText(
                          text: "\$500 ",
                          fontSize: 17,
                          color: ColorManager.blackColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0).w,
        child: PrimaryButton(
          width: 100.w,
          height: 50.h,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: ColorManager.whiteColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(const Radius.circular(20.0).w)),
                  child: Container(
                    padding: const EdgeInsets.all(15.0).w,
                    height: 250.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CrcleAvatar(
                          radius: 35,
                          color: ColorManager.blackColor,
                          child: Image.asset(IconsAssets.payLogo),
                        ),
                        DesignText(
                          text: "Successful !",
                          fontSize: 20,
                          color: ColorManager.blackColor,
                        ),
                        Text(
                          "You have successfully your confirm payment send!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(175.w, 30.h),
                            backgroundColor: ColorManager.blackColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).w),
                          ),
                          onPressed: () {
                            Get.offAllNamed("/HomePage");
                          },
                          child: Text(
                            "Continue Shopping",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          borderRadius: 20,
          child: DesignText(
            text: "Pay",
            fontSize: 15,
            color: ColorManager.whiteColor,
          ),
        ),
      ),
    );
  }
}
