class TaskModel {
  final String taskNo;
  final String header;
  final String assignedTo;
  final String taskDate;
  final String client;
  final String priority;
  final String status;

  TaskModel({
    required this.taskNo,
    required this.header,
    required this.assignedTo,
    required this.taskDate,
    required this.client,
    required this.priority,
    required this.status,
  });

  TaskModel copyWith({String? status}) {
    return TaskModel(
      taskNo: taskNo,
      header: header,
      assignedTo: assignedTo,
      taskDate: taskDate,
      client: client,
      priority: priority,
      status: status ?? this.status,
    );
  }
}
