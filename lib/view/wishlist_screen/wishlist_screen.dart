import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../listdata/data.dart';
import '../../resources/resources.dart';
import '../../widget/reuse_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 15.0, left: 15).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DesignText(
              text: StringManager.wishList,
              fontSize: 20,
              color: ColorManager.blackColor,
              padding: 35,
            ),
            Cart(images: ProductCategory.images, child: const GestureDetect()),
          ],
        ),
      ),
    );
  }
}
