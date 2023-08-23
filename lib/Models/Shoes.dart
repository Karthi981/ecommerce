class Shoes {
  int? id;
  String? name;
  String? category;
  String? imageUrl;
  String? description;
  String? oldPrice;
  String? price;

  Shoes(
      {this.id,
        this.name,
        this.category,
        this.imageUrl,
        this.description,
        this.oldPrice,
        this.price});

  Shoes.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'].toString();
    category = json['category'].toString();
    imageUrl = json['imageUrl'].toString();
    description = json['Description'].toString();
    oldPrice = json['oldPrice'].toString();
    price = json['price'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['imageUrl'] = this.imageUrl;
    data['Description'] = this.description;
    data['oldPrice'] = this.oldPrice;
    data['price'] = this.price;
    return data;
  }
}