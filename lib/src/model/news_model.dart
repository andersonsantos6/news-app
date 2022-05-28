class NewsModel {
  late String title;
  late String body;
  late String subject;
  late String dateTime;
  late String key;
  String? image;
  String? videoLink;

  NewsModel(
      {required this.key,
      required this.title,
      required this.body,
      required this.subject,
      required this.dateTime,
      this.image,
      this.videoLink});
}
