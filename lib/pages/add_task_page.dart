import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simply_tasking/utilities/themes.dart';
import 'package:simply_tasking/widgets/input_text_field.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Add a task...",
                style: headingStyle,
              ),
              const InputTextField(title: "Title", hint: "Enter a title..."),
              const InputTextField(title: "Note", hint: "Enter a note..."),
            ],
          ),
        ),
      ),
    );
  }
}
