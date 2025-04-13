class WorkingHours {
  final String start;
  final String end;

  WorkingHours({required this.start, required this.end});

  factory WorkingHours.fromJson(Map<String, dynamic> json) {
    return WorkingHours(
      start: json['Start'],
      end: json['End'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Start': start,
      'End': end,
    };
  }
}