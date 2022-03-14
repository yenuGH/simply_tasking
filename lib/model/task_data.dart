// ignore_for_file: prefer_collection_literals

class TaskData {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  //String? startTime;
  //String? endTime;
  //int? reminderTimer;
  //String? repeatInterval;

  // Initializing data
  TaskData({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
  });

  // Converting task data to json object with a map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['id'] = id;
    data['title'] = title;
    data['note'] = note;
    data['isCompleted'] = isCompleted;
    data['date'] = date;
    //data['startTime'] = startTime;
    //data['endTime'] = endTime;
    //data['reminderTimer'] = reminderTimer;
    //data['repeatInterval'] = repeatInterval;

    return data;
  }

  // Converting json object to task data
  TaskData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    //startTime = json['startTime'];
    //endTime = json['endTime'];
    //reminderTimer = json['reminderTimer'];
    //repeatInterval = json['repeatInterval'];
  }
}
