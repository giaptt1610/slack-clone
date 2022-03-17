class Product {
  final String id;
  final String name;
  final String desc;
  final double price;

  Product({
    required this.id,
    this.name = '',
    this.desc = '',
    this.price = 0.0,
  });

  @override
  bool operator ==(Object o) => o is Product && o.id == this.id;

  @override
  int get hashCode => id.hashCode;
}
