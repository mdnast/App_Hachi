class BestSellingItem {
  const BestSellingItem({
    required this.name,
    required this.price,
    required this.description,
    this.image,
  });

  final String name;
  final double price;
  final String description;
  final String? image;
}

const bestSellingItems = <BestSellingItem>[
  BestSellingItem(
    name: 'Tap Water',
    price: 28,
    description: 'High mineral water for plants',
  ),
  BestSellingItem(
    name: 'Watering Plant Tool',
    price: 10,
    description: 'Adjustable sprinkler nozzle',
  ),
  BestSellingItem(
    name: 'Smart Lamp',
    price: 100,
    description: 'Adaptive greenhouse lighting',
  ),
  BestSellingItem(
    name: 'Fertilizer Package',
    price: 200,
    description: 'Organic fertilizer combo',
  ),
];
