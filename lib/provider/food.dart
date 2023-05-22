class Food {
  String id;
  String name;
  int kcal;
  int protein;
  int fat;
  int carb;
  String imageUrl;
  int weight;
  // int totalCalorie=kcal * weight ~/ 100;
  Food({
    required this.id,
    required this.name,
    required  this.kcal,
    required this.protein,
    required this.fat,
    required this.carb,
    required this.imageUrl,
    this.weight=100,
    // this.totalCalorie=(this.kcal * weight ~/ 100),
  });
  int totalCalorie(){
    return kcal * weight ~/ 100;
  }
}
