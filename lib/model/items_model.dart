import 'package:machintest/model/rating_model.dart';
class Items{
  Rating? rate;
  Rating? count;
  String? title;
  String?price;
  String?description;
  String?category;
  String?image;
  Items(
      {this.rate, this.count,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image});

  factory Items.fromJson(Map<String ,dynamic>json){
    return Items(
      rate: Rating.fromJson(json['rate']),
      count: Rating.fromJson(json['count']),
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image']

    );
  }
}