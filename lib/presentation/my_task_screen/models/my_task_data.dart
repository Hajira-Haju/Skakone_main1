// lib/data/task_data.dart


import 'my_task_models.dart';

final List<TaskModel> taskList = [
  TaskModel(
    taskNo: "T-001",
    header: "Design Landing Page",
    assignedTo: "John",
    taskDate: "2025-07-25",
    client: "ABC Corp",
    priority: "High",
    status: "In Progress",
  ),
  TaskModel(
    taskNo: "T-002",
    header: "Fix Login Issue",
    assignedTo: "Jane",
    taskDate: "2025-07-24",
    client: "XYZ Ltd",
    priority: "Medium",
    status: "Pending",
  ),
  TaskModel(
    taskNo: "T-003",
    header: "Create Dashboard",
    assignedTo: "Emily",
    taskDate: "2025-07-22",
    client: "StarTech",
    priority: "Low",
    status: "Completed",
  ),
];
