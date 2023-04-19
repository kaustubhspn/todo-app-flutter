class Task {
  // Properties for different attributes of a task
  int? id; // unique identifier for a task
  String? title; // title of the task
  String? note; // additional notes for the task
  int? isCompleted; // flag indicating if task is completed or not
  String? date; // date for the task
  String? startTime; // start time for the task
  String? endTime; // end time for the task
  int? color; // color code for the task
  int? remind; // flag indicating if task has a reminder set or not
  String? repeat; // frequency of task repetition, if any

  // Constructor to initialize properties
  Task({
    required this.id,
    required this.title,
    required this.note,
    required this.isCompleted,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.remind,
    required this.repeat,
  });

  // Method to convert object to JSON-compatible format
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'remind': remind,
      'repeat': repeat,
    };
  }

  // Method to convert JSON-compatible format to object
  Task.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    color = json['color'];
    remind = json['remind'];
    repeat = json['repeat'];
  }
}
