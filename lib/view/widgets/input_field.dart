import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/theme.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String title;
 final TextEditingController? controller;

  final Widget? widget;

  InputField(
      {Key? key, required this.title, required this.hintText, this.widget , this.controller})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: subTitle,
                // it is a getter from the theme file
                suffixIcon: widget,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1.5,),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderSide:  const BorderSide(color: Colors.grey, width: 1.5,),
                  borderRadius:  BorderRadius.circular(15),
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
