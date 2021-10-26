import 'package:redteam_xperience/core/constants/assets.dart';

class VideoModel {
  int? id;
  String? refno;
  int? fkTopicId;
  int? fkUserId;
  String? title;
  String? description;
  String? thumbUrl;
  String? videoUrl;
  String? tags;
  String? starCount;
  int? isFree;
  int? isActive;
  int? isEnabled;
  int? createdBy;
  String? createdAt;
  int? updatedBy;
  String? updatedAt;
  String? notePdfUrl;
  String? videoDuration;
  int? bookmark;
  int? unlocked;

  VideoModel(
      {this.id,
        this.refno,
        this.fkTopicId,
        this.fkUserId,
        this.title,
        this.description,
        this.thumbUrl,
        this.videoUrl,
        this.tags,
        this.starCount,
        this.isFree,
        this.isActive,
        this.isEnabled,
        this.createdBy,
        this.createdAt,
        this.updatedBy,
        this.updatedAt,
        this.notePdfUrl,
        this.videoDuration,
        this.bookmark,
        this.unlocked});

  VideoModel.test(){
    id=1563;
    thumbUrl=ImageAssets.liveClass;
    videoUrl="https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4";
  }

  // Video.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   refno = json['refno'];
  //   fkTopicId = json['fk_topic_id'];
  //   fkUserId = json['fk_user_id'];
  //   title = json['title'];
  //   description = json['description'];
  //   thumbUrl = json['thumb_url'];
  //   videoUrl = json['video_url'];
  //   tags = json['tags'];
  //   starCount = json['star_count'];
  //   isFree = json['is_free'];
  //   isActive = json['is_active'];
  //   isEnabled = json['is_enabled'];
  //   createdBy = json['created_by'];
  //   createdAt = json['created_at'];
  //   updatedBy = json['updated_by'];
  //   updatedAt = json['updated_at'];
  //   notePdfUrl = json['note_pdf_url'];
  //   videoDuration = json['video_duration'];
  //   bookmark = json['bookmark'];
  //   unlocked = json['unlocked'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['refno'] = this.refno;
  //   data['fk_topic_id'] = this.fkTopicId;
  //   data['fk_user_id'] = this.fkUserId;
  //   data['title'] = this.title;
  //   data['description'] = this.description;
  //   data['thumb_url'] = this.thumbUrl;
  //   data['video_url'] = this.videoUrl;
  //   data['tags'] = this.tags;
  //   data['star_count'] = this.starCount;
  //   data['is_trial'] = this.isTrial;
  //   data['is_free'] = this.isFree;
  //   data['is_active'] = this.isActive;
  //   data['is_enabled'] = this.isEnabled;
  //   data['created_by'] = this.createdBy;
  //   data['created_at'] = this.createdAt;
  //   data['updated_by'] = this.updatedBy;
  //   data['updated_at'] = this.updatedAt;
  //   data['note_pdf_url'] = this.notePdfUrl;
  //   data['video_duration'] = this.videoDuration;
  //   data['bookmark'] = this.bookmark;
  //   data['unlocked'] = this.unlocked;
  //   return data;
  // }
}