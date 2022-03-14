// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simply_tasking/controller/task_controller.dart';
import 'package:simply_tasking/model/task_data.dart';
import 'package:simply_tasking/utilities/themes.dart';
import 'package:simply_tasking/widgets/description_text_field.dart';
import 'package:simply_tasking/widgets/input_text_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController taskController = Get.put(TaskController());

  // These variables are used to validate the inputted data into the boxes
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  // These variables are used to take advantage of setState() to redraw the page once a date/time has been selected
  DateTime selectedDate = DateTime.now();

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
              // Title
              InputTextField(
                title: "Title",
                hint: "Enter a title...",
                controller: titleController,
              ),
              // Description
              DescriptionTextField(
                title: "Description",
                hint: checkDescription(), //"Enter a description...",
                controller: noteController,
              ),
              // Due Date
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
              /* // Start Time / End Time
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
              // Remind Me
              InputTextField(
                title: "Set Reminder",
                hint: remindTime.toString() + " minutes before",
                widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 30,
                  elevation: 4,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  underline: Container(
                    height: 0,
                  ),
                  items: remindTimes.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString() + " minutes"),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      remindTime = int.parse(value!);
                    });
                  },
                ),
              ),
              // Repeat
              InputTextField(
                title: "Set Repeat Interval",
                hint: repeatTime,
                widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 30,
                  elevation: 4,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  underline: Container(
                    height: 0,
                  ),
                  items:
                      repeatTimes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      repeatTime = value!;
                    });
                  },
                ),
              ), */
              // Add task button
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    addFloatingActionButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkDescription() {
    if (noteController.text.isEmpty) {
      return "No description provided.";
    }
    return noteController.text;
  }

  validateTask() {
    if (titleController.text.isNotEmpty) {
      sendToDatabase();
      Get.back();
    } else if (titleController.text.isEmpty) {
      Get.snackbar(
        "Title is required!",
        "You must give this task a name.",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        backgroundColor: Colors.grey[50],
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
        ),
      );
    }
  }

  sendToDatabase() async {
    int databaseID = await taskController.addTask(
      TaskData(
        note: noteController.text,
        title: titleController.text,
        date: DateFormat.yMd().format(selectedDate),
        isCompleted: 0,
      ),
    );
    print("Database ID value: " + databaseID.toString());
  }

  // shows a button for adding a task
  FloatingActionButton addFloatingActionButton() {
    return FloatingActionButton.extended(
      isExtended: true,
      onPressed: () {
        //Navigator.pop(context);
        validateTask();
      },
      icon: const Icon(
        Icons.add,
        color: Colors.black,
      ),
      label: const Text(
        "Create task!",
        style: TextStyle(color: Colors.black),
      ),
      elevation: 4.0,
      backgroundColor: Colors.blue,
    );
  }

/*   addTimePicker({required bool isStartTime}) async {
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
 */

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
      print("Invalid date has been selected, somehow.");
    }
    return datePicker;
  }
}
