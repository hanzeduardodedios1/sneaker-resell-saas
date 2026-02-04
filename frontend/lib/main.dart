import 'package:flutter/material.dart';
import 'models/sneaker.dart';
import 'widgets/product_card.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        
        // --- THE FIX IS HERE ---
        // We replaced 'primarySwatch: Colors.black' with 'colorScheme'
        // This generates all the required shades automatically.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black, 
          brightness: Brightness.light
        ),
        useMaterial3: true,
        // -----------------------
      ),
      home: const MarketplaceScreen(),
    );
  }
}

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "BLESS A HOMIE", 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, letterSpacing: -1),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          // Uses the mock data from your sneaker.dart model
          itemCount: mockInventory.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: 0.75, 
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return ProductCard(sneaker: mockInventory[index]);
          },
        ),
      ),
    );
  }
}