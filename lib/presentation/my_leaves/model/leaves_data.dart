class LeaveData {
  static List<Reasons> leaves = [
    Reasons(
      subtitle: 'Half day Application',
      title: 'Wed  - 2 JUN',
      reason: 'Casual',
      status: 'Awaiting',
    ),
    Reasons(
      subtitle: 'Full day Application',
      title: 'Fri - 4 JUN',
      reason: 'Sick',
      status:'Declined',
    ),
    Reasons(
      subtitle: 'Half day Application',
      title: 'Sat  - 9 JUN',
      reason: 'Casual',
      status:'Approved',
    ),
    Reasons(
      subtitle: 'Full day Application',
      title: 'Sun  - 10 JUN',
      reason: 'Sick',
      status:'Awaiting',
    ),
    Reasons(
      subtitle: 'Half day Application',
      title: 'Tue - 20 JUN',
      reason: 'Sick',
      status:'Declined',
    ),
    Reasons(
      subtitle: 'Half day Application',
      title: 'Tue - 12 JUN',
      reason: 'Casual',
      status:'Approved',
    ),
    Reasons(
      subtitle: 'Half day Application',
      title: 'Tue - 12 JUN',
      reason: 'Casual',
      status:'Awaiting',
    ),
    Reasons(
      subtitle: 'Half day Application',
      title: 'Tue - 12 JUN',
      reason: 'Casual',
      status:'Declined',
    ),
    Reasons(
      subtitle: 'Half day Application',
      title: 'Tue - 12 JUN',
      reason: 'Casual',
      status:'Awaiting',
    ),
    Reasons(
      subtitle: 'Full day Application',
      title: 'Tue - 12 JUN',
      reason: 'Casual',
      status:'Declined',
    ),

  ];
}


class Reasons  {
  final String subtitle;
  final String title;
  final String reason;
  final String status;

  Reasons({
    required this.subtitle,
    required this.title,
    required this.reason,
    required this.status,
  });
}