import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simply_tasking/utilities/themes.dart';
import 'package:simply_tasking/widgets/description_text_field.dart';
import 'package:simply_tasking/widgets/input_text_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  // These variables are used to take advantage of setState() to redraw the page once a date/time has been selected
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat("h:mm a").format(DateTime.now()).toString();
  String endTime = DateFormat("h:mm a").format(DateTime.now()).toString();

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
              const InputTextField(
                title: "Title",
                hint: "Enter a title...",
              ),
              const DescriptionTextField(
                title: "Description",
                hint: "Enter a description...",
              ),
              InputTextField(
                title: "Due Date",
                hint: "Selected due date: " +
                    DateFormat.yMd().format(selectedDate),
                widget: IconButton(
                  icon: const Icon(Icons.calendar_today_outlined,
                      color: Colors.grey),
                  onPressed: () {
                    createDatePicker();
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      title: "Start Time",
                      hint: startTime,
                      widget: IconButton(
                        onPressed: () {
                          addTimePicker(isStartTime: true);
                        },
                        icon: const Icon(
                          Icons.access_time_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: InputTextField(
                      title: "End Time",
                      hint: endTime,
                      widget: IconButton(
                        onPressed: () {
                          addTimePicker(isStartTime: false);
                        },
                        icon: const Icon(
                          Icons.access_time_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  addTimePicker({required bool isStartTime}) async {
    var timePicker = await createTimePicker();
    String formattedTime = timePicker.format(context);

    if (timePicker == null) {
      print("User has not picked a time.");
    }
    // We are using the bool to basically determine if we are creating a start time or end time widget
    else if (isStartTime == true) {
      setState(() {
        startTime = formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        endTime = formattedTime;
      });
    } else {
      print("Somehow, this was triggered. Good job.");
    }
  }

  // creates a material time picker
  createTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  // creates the widget for showing a calendar date picker
  Future<DateTime?> createDatePicker() async {
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(4000),
    );

    if (datePicker != null) {
      setState(() {
        selectedDate = datePicker;
      });
    } else {
      // ignore: avoid_print
      print("Invalid date has been selected, somehow.");
    }
    return datePicker;
  }
}
