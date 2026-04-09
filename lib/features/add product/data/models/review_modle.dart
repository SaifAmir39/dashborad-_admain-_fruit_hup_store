import 'package:dash_bord_fruite_hup/features/add%20product/domain/entity/review_entity.dart';

class ReviewModle  {

   final String image;
  final String name;
  final num review;
  final String date;
  final String comment;

  ReviewModle({
    required this.image,
    required this.name,
    required this.review,
    required this.date,
    required this.comment,
  });
  factory ReviewModle.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModle(
      image: reviewEntity.image,
      name: reviewEntity.name,
      review: reviewEntity.review,
      date: reviewEntity.date,
      comment: reviewEntity.comment,
    );
  }
  factory ReviewModle.fromjson(Map<String, dynamic> json) {
    return ReviewModle(
      image: json['image'] ,
      name: json['name'] ,
      review: json['review'],
      date: json['date'] ,
      comment: json['comment'] ,
    );
  }
  toMap() {
    return {
      "image": image,
      "name": name,
      "review": review,
      "date": date,
      "comment": comment,
    };
  }

}