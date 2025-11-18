import 'package:flutter/material.dart';
import 'package:h1d023107_tugas7/pages/side_menu.dart';
import 'dart:math' as math; 

const Color kBackgroundColor = Color(0xFFF3F5F7);
const Color kDarkBlueColor = Color(0xFF394A6A); 
const Color kWhiteColor = Colors.white;
const Color kTextColor = Color(0xFF4A4A4A);
const Color kLightPurpleColor = Color(0xFFEAEAF2); 
const Color kDetailTextColor = Color(0xFF8A8A8A);

class FoodDetailPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  const FoodDetailPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int _quantity = 1;
  late double _totalPrice;

  // ...
  @override
  void initState() {
    super.initState();
    _totalPrice = widget.price * _quantity;
  }

  void _updateQuantity(int newQuantity) {
    if (newQuantity > 0) {
      setState(() {
        _quantity = newQuantity;
        _totalPrice = widget.price * _quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('Detail Makanan'),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: kTextColor),
        titleTextStyle: const TextStyle(
            color: kTextColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      drawer: const SideMenu(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainContent(),
            const SizedBox(height: 20),
            _buildPriceAndRating(),
            const SizedBox(height: 20),
            Text(widget.description, 
                style: const TextStyle(
                    color: kDetailTextColor, fontSize: 14, height: 1.5)),
            const SizedBox(height: 25),
            _buildBottomButtons(),
            const SizedBox(height: 30),
            _buildRelatedItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title, 
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "€${widget.price.toStringAsFixed(2)}", 
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kDarkBlueColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),

        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: kLightPurpleColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(widget.imageUrl), 
                      fit: BoxFit.cover, 
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildSizeSelector(),
                const SizedBox(height: 20),
                _buildQuantitySelector(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _sizeOption("S", isSelected: false),
        _sizeOption("M", isSelected: true),
        _sizeOption("L", isSelected: false),
      ],
    );
  }

  Widget _sizeOption(String size, {bool isSelected = false}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? kDarkBlueColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? kWhiteColor : kDarkBlueColor.withOpacity(0.7),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Qty",
            style: TextStyle(
                fontSize: 16,
                color: kDarkBlueColor,
                fontWeight: FontWeight.w500)),
        const SizedBox(width: 15),
        IconButton(
          icon: const Icon(Icons.remove_circle_outline, color: kDarkBlueColor),
          onPressed: () => _updateQuantity(_quantity - 1),
        ),
        Text("$_quantity",
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTextColor)),
        IconButton(
          icon: const Icon(Icons.add_circle_outline, color: kDarkBlueColor),
          onPressed: () => _updateQuantity(_quantity + 1),
        ),
      ],
    );
  }

  Widget _buildPriceAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Total :",
                style: TextStyle(fontSize: 16, color: kDetailTextColor)),
            Text(
              "€${_totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: kDarkBlueColor),
            ),
          ],
        ),
        Row(
          children: List.generate(
              5,
              (index) =>
                  const Icon(Icons.star, color: Colors.amber, size: 20)),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: kLightPurpleColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child:
              const Icon(Icons.favorite_border, color: kDarkBlueColor, size: 28),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkBlueColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(vertical: 18),
            ),
            child: const Text(
              "Add To Cart",
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "People also like",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _relatedItemCard("Ayam Geprek", "€ 5.75",
                  'assets/images/ayamgeprek.png'),
              _relatedItemCard(
                  "Nasi Goreng", "€ 4.50", 'assets/images/nasgor.png'),
              _relatedItemCard(
                  "Sphagetti", "€ 3.25", 'assets/images/spagetti.png'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _relatedItemCard(String title, String price, String imageUrl) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2)
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(imageUrl))),
          ),
          const Spacer(),
          Text(title,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: kTextColor)),
          Text(price, style: const TextStyle(fontSize: 11, color: kDarkBlueColor)),
        ],
      ),
    );
  }
}