class IceCreamData {
  IceCreamData({this.icecreams});

  IceCreamData.fromJson(Map<String, dynamic> json) {
    if (json['icecreams'] != null) {
      icecreams = <Icecreams>[];
      json['icecreams'].forEach((v) {
        icecreams!.add(new Icecreams.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  List<Icecreams>? icecreams;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.icecreams != null) {
      data['icecreams'] = this.icecreams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Icecreams {
  int? id;
  String? flavor;
  String? category;
  bool? isFeatured;
  String? description;
  List<String>? toppings;
  List<Ingredients>? ingredients;
  double? price;
  String? image;

  Icecreams(
      {this.id,
      this.flavor,
      this.category,
      this.isFeatured,
      this.description,
      this.toppings,
      this.ingredients,
      this.price,
      this.image});

  Icecreams.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    flavor = json['flavor'] as String?;
    category = json['category'] as String?;
    isFeatured = json['isFeatured'] as bool?;
    description = json['description'] as String?;
    toppings = json['toppings'].cast<String>() as List<String>;
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v as Map<String, dynamic>));
      });
    }
    price = json['price'] as double;
    image = json['image'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['flavor'] = this.flavor;
    data['category'] = this.category;
    data['isFeatured'] = this.isFeatured;
    data['description'] = this.description;
    data['toppings'] = this.toppings;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }

  @override
  String toString() {
    return 'Name - $flavor, Price - $price';
  }
}

class Ingredients {
  String? name;
  String? quantity;

  Ingredients({this.name, this.quantity});

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    quantity = json['quantity'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    return data;
  }
}

