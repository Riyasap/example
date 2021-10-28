import 'package:redteam_xperience/core/constants/assets.dart';

class CourseModel {
  CourseModel(
      {required this.id,
      required this.ifOffer,
      required this.name,
      required this.branch,
      required this.duration,
      required this.imgUrl,
      required this.mrpRate,
      required this.offerPrice,
      this.ifNew,
      required this.videoPreviewUrl,
      required this.courseDesc,
      required this.syllabusModel,
        required this.paymentModel
      });
  final String id;
  final String name;
  final String imgUrl;
  final String branch;
  final String duration;
  final String mrpRate;
  final String offerPrice;
  final bool ifOffer;
  final bool? ifNew;
  final String videoPreviewUrl;
  final List<String> courseDesc;
  final List<SyllabusModel> syllabusModel;
  final List<PaymentModel> paymentModel;

  static List<CourseModel> test() {
    return [
      CourseModel(
          videoPreviewUrl:
              "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4",
          courseDesc: [
            "Lorem Ipsum is simply dummy text of the printing blah blah",
            "Lorem Ipsum is simply dummy text of the printing blah blah",
            "Lorem Ipsum is simply dummy text of the printing blah blah ",
            "Lorem Ipsum is simply dummy text of the printing blah blah",
            "Lorem Ipsum is simply dummy text of the printing blah blah",
            "Lorem Ipsum is simply dummy text of the printing blah blah ",
            "Lorem Ipsum is simply dummy text of the printing blah blah",
            "Lorem Ipsum is simply dummy text of the printing blah blah",
            "Lorem Ipsum is simply dummy text of the printing blah blah ",
          ],
          id: "57821",
          ifOffer: true,
          ifNew: true,
          name: "AWS New",
          branch: "Solution Advanced Diploma in Cyber Defense",
          duration: "210",
          imgUrl: ImageAssets.myCourse,
          mrpRate: "8099",
          offerPrice: "4999",
          syllabusModel: SyllabusModel.test(),paymentModel: PaymentModel.test()
      ),
      CourseModel(
          videoPreviewUrl:
              "https://cdn.videvo.net/videvo_files/video/premium/video0225/large_watermarked/MR_Stock%20Footage%20MR%20(2293)_preview.mp4",
          courseDesc: [
            "Its a Sample Test is simply dummy text of the printing blah blah",
            "Its a Sample Test is simply dummy text of the printing blah blah",
            "Its a Sample Test is simply dummy text of the printing blah blah ",
            "Its a Sample Test is simply dummy text of the printing blah blah",
            "Its a Sample Test is simply dummy text of the printing blah blah",
            "Its a Sample Test is simply dummy text of the printing blah blah ",
            "Its a Sample Test is simply dummy text of the printing blah blah",
            "Its a Sample Test is simply dummy text of the printing blah blah",
            "Its a Sample Test is simply dummy text of the printing blah blah ",
          ],
          id: "67821",
          ifOffer: true,
          ifNew: true,
          name: "CCNA",
          branch: "CCNA Advanced Diploma in Cyber Defense",
          duration: "300",
          imgUrl: ImageAssets.img1,
          mrpRate: "9999",syllabusModel: SyllabusModel.test(),paymentModel: PaymentModel.test(),
          offerPrice: "6999"),
      CourseModel(
          videoPreviewUrl:
              "https://cdn.videvo.net/videvo_files/video/free/2019-03/large_watermarked/181004_10_LABORATORIES-SCIENCE_23_preview.mp4",
          courseDesc: [
            "Lorem Ipsum As atha anlaa auhan aija aka of the printing blah blah",
            "Lorem Ipsum As atha anlaa auhan aija aka of the printing blah blah",
            "Lorem Ipsum As atha anlaa auhan aija aka of the printing blah blah",
          ],
          id: "57111",
          ifOffer: true,
          name: "Network",
          branch: "Advanced Diploma in Cyber Defense",
          duration: "210",
          imgUrl: ImageAssets.img2,
          mrpRate: "6099",syllabusModel: SyllabusModel.test(),paymentModel: PaymentModel.test(),
          offerPrice: "2999"),
      CourseModel(
          videoPreviewUrl:
              "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
          courseDesc: [
            "Lorem  the printing blah blah",
            "Lorem  the printing blah blah",
            "Lorem  the printing blah blah ",
            "Lorem  the printing blah blah",
            "Lorem  the printing blah blah",
            "Lorem  the printing blah blah ",
            "Lorem Ipsum is simply dummy text of the blah",
            "Lorem Ipsum is simply dummy text of the blah",
            "Lorem Ipsum is simply dummy text of the lah ",
          ],
          id: "78821",
          ifOffer: true,
          ifNew: true,
          name: "LSSS New",
          branch: "Solution Advanced in Cyber Defense",
          duration: "110",
          imgUrl: ImageAssets.myCourse,syllabusModel: SyllabusModel.test(),paymentModel: PaymentModel.test(),
          mrpRate: "3999",
          offerPrice: "1999"),
    ];
  }
}

class SyllabusModel {
  SyllabusModel(
      {required this.moduleName,
      required this.topicName,
      required this.title,
      required this.subtitle,
      required this.duration,
      required this.imgUrl});
  final String moduleName;
  final String topicName;
  final String title;
  final String subtitle;
  final String duration;
  final String imgUrl;

  static List<SyllabusModel> test() {
    return [
      SyllabusModel(
          moduleName: "moduleName",
          topicName: "topicName",
          title: "title",
          subtitle: "subtitle",
          duration: "29",
          imgUrl: ImageAssets.liveClass),
      SyllabusModel(
          moduleName: "moduleName2",
          topicName: "topicName3",
          title: "title3",
          subtitle: "subtitle3",
          duration: "12",
          imgUrl: ImageAssets.img2),
      SyllabusModel(
          moduleName: "moduleName2",
          topicName: "topicName3",
          title: "title3",
          subtitle: "subtitle3",
          duration: "12",
          imgUrl: ImageAssets.event3),
      SyllabusModel(
          moduleName: "moduleName2",
          topicName: "topicName3",
          title: "title3",
          subtitle: "subtitle3",
          duration: "12",
          imgUrl: ImageAssets.event4),
      SyllabusModel(
          moduleName: "moduleName2",
          topicName: "topicName3",
          title: "title3",
          subtitle: "subtitle3",
          duration: "12",
          imgUrl: ImageAssets.event4),
      SyllabusModel(
          moduleName: "moduleName2",
          topicName: "topicName3",
          title: "title3",
          subtitle: "subtitle3",
          duration: "12",
          imgUrl: ImageAssets.event1),SyllabusModel(
          moduleName: "moduleName2",
          topicName: "topicName3",
          title: "title3",
          subtitle: "subtitle3",
          duration: "12",
          imgUrl: ImageAssets.img1),


    ];
  }
}
class PaymentModel {
  PaymentModel({required this.duration,required this.rate});
  final String duration;
  final int rate;

  static List<PaymentModel> test(){
    return[
      PaymentModel(duration: "30", rate: 2000),
      PaymentModel(duration: "20", rate: 1500),
      PaymentModel(duration: "25", rate: 1000),
      PaymentModel(duration: "25", rate: 500),
    ];
  }
}