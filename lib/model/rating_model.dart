class Rating{
String ?rate;
String ?count;

Rating({this.rate, this.count});
factory Rating.fromJson(Map<String , dynamic>json){
  return Rating(rate: json['rate'],count: json['count']);
}

}