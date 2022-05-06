class Produit 
{
  final String desc;
  final int id;
  final String img;
  final String name;
  final String price;
  
  Produit(this.desc, this.id, this.img, this.name, this.price);
  factory Produit.fromJson(dynamic json) 
  {
    return Produit(
      json['desc'] as String,
      json['id'] as int,
      json['img'] as String,
      json['name'] as String,
      json['price'] as String,);
  }

  @override
  String toString() {
    return '{ ${this.desc}, ${this.id}, ${this.img}, ${this.name},  ${this.price} }';
  }
}