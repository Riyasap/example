class ExamModel {
  ExamModel(
      {required this.date,
      required this.time,
      required this.topicName,
      required this.timer,
      required this.questionNumbers,
      required this.totalMark});
  final String date;
  final String time;
  final String topicName;
  final int questionNumbers;
  final String timer;
  final String totalMark;

  factory ExamModel.test() {
    return ExamModel(
        date: "Aug 24th",
        time: "11.00 PM",
        topicName: "Informaton Gathering Ipsum Text is Sample",
        timer: "130",
        questionNumbers: 60,
        totalMark: "150");
  }
}
