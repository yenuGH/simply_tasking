import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const DescriptionTextField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 150,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          //textAlign: TextAlign.bottom,
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          readOnly: widget == null ? false : true,
                          autofocus: false,
                          cursorColor: Get.isDarkMode
                              ? Colors.grey.shade100
                              : Colors.grey.shade700,
                          controller: controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hint,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: context.theme.backgroundColor,
                                width: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget == null ? Container() : Container(child: widget),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
