//PURPOSE: What a sneaker SHOULD LOOK LIKE



class Sneaker {
  final String id;
  final String brand;       // e.g., "Jordan"
  final String model;       // e.g., "1 Retro High OG"
  final String colorway;    // e.g., "Lost & Found"
  final double price;       // Your selling price
  final String imageUrl;    // URL to the shoe image
  final List<double> sizes; // Available sizes

  Sneaker({
    required this.id,
    required this.brand,
    required this.model,
    required this.colorway,
    required this.price,
    required this.imageUrl,
    required this.sizes,
  });

  // Factory to create from JSON (We'll use this when we hook up the backend)
  factory Sneaker.fromJson(Map<String, dynamic> json) {
    return Sneaker(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      colorway: json['colorway'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      sizes: List<double>.from(json['sizes']),
    );
  }
}

// --- MOCK DATA FOR UI SPRINT ---
// This emulates what the API will eventually send us.
final List<Sneaker> mockInventory = [
  Sneaker(
    id: '1',
    brand: 'Jordan',
    model: '1 Retro High OG',
    colorway: 'Chicago Lost & Found',
    price: 450.00,
    imageUrl: 'https://images.stockx.com/images/Air-Jordan-1-Retro-High-OG-Chicago-Reimagined-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&fm=webp&auto=compress&q=90&dpr=2&trim=color&updated_at=1665691099', 
    sizes: [9.0, 9.5, 10.0, 10.5],
  ),
  Sneaker(
    id: '2',
    brand: 'Nike',
    model: 'Dunk Low',
    colorway: 'White Black (Panda)',
    price: 180.00,
    imageUrl: 'https://images.stockx.com/images/Nike-Dunk-Low-Retro-White-Black-2021-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&fm=webp&auto=compress&q=90&dpr=2&trim=color&updated_at=1633027409',
    sizes: [8.0, 10.0, 11.0],
  ),
  Sneaker(
    id: '3',
    brand: 'Adidas',
    model: 'Yeezy Slide',
    colorway: 'Onyx',
    price: 120.00,
    imageUrl: 'https://images.stockx.com/images/Adidas-Yeezy-Slide-Onyx-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&fm=webp&auto=compress&q=90&dpr=2&trim=color&updated_at=1646684749',
    sizes: [9.0, 10.0],
  ),
];