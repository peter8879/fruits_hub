
import '../entities/review_entity.dart';

class ReviewModel extends ReviewEntity
{
  ReviewModel({required super.name, required super.image, required super.rating, required super.date, required super.reviewDescription});
  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'image':image,
      'rating':rating,
      'date':date,
      'reviewDescription':reviewDescription,
    };
  }
  factory ReviewModel.fromEntity(ReviewEntity entity)
  {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      rating: entity.rating,
      date: entity.date,
      reviewDescription: entity.reviewDescription
    );
  }
  factory ReviewModel.fromJson(Map<String,dynamic> json)
  {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      rating: json['rating'],
      date: json['date'],
      reviewDescription: json['reviewDescription']
    );
  }

}