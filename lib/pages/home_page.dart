import 'package:flutter/material.dart';

// separate files
import 'package:simply_tasking/utilities/themes.dart';
import 'package:simply_tasking/widgets/app_drawer.dart';

// external packages
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // These are needed for the TableDateCalendar to add interactivity
  CalendarFormat calendarFormat = CalendarFormat.week;
  DateTime focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasking, simply put."),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: <Widget>[
          addFormattedDate(),
          addTableDate(),
        ],
      ),
    );
  }

  // shows a dynamically adjustable table of the date
  TableCalendar addTableDate() {
    return TableCalendar(
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(4000, 1, 1),
      focusedDay: focusedDay,
      calendarFormat: calendarFormat,
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        focusedDay = focusedDay;
      },
    );
  }

  // shows a horizontal timeline of date
  Container addTimelineDate() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.pinkAccent,
      ),
    );
  }

  // This is the formatted date and "today" you see on the homepage.
  Container addFormattedDate() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today:",
                style: subHeadingStyle,
              ),
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: headingStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}