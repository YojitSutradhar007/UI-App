import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/import_resources.dart';

// this is login and signup screen password text field
class PassField extends StatefulWidget {
  final TextEditingController textPassCtrl;
  final String? hintText;
  final String? labelText;
  final Function(String)? onChanged;

  const PassField(
      {super.key, this.hintText, required this.textPassCtrl, required this.onChanged, required this.labelText});

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool obSure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText!,
          style: fontWeightColorTextStyle(FontWeightManager.bold, ColorManager.black87Color),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5).r,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.7)), borderRadius: BorderRadius.circular(30).w),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                onChanged: (value) {
                  debugPrint(value);
                  widget.onChanged!(value);
                },
                cursorColor: ColorManager.lightGreenColor,
                cursorRadius: const Radius.circular(10).w,
                cursorWidth: 4,
                obscureText: obSure,
                controller: widget.textPassCtrl,
                decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 10).r),
              )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      obSure = !obSure;
                    });
                  },
                  icon: obSure
                      ? const Icon(
                          FluentSystemIcons.ic_fluent_eye_hide_filled,
                        )
                      : const Icon(FluentSystemIcons.ic_fluent_eye_show_filled))
            ],
          ),
        ),
      ],
    );
  }
}
