import 'package:flutter/material.dart';
import 'package:h1d023107_tugas7/pages/side_menu.dart';
import 'package:h1d023107_tugas7/pages/food_detail_page.dart';

const Color kBackgroundColor = Color(0xFFF3F5F7);
const Color kDarkBlueColor = Color(0xFF394A6A);
const Color kWhiteColor = Colors.white;
const Color kTextColor = Color(0xFF4A4A4A);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Home Page',
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: kTextColor), 
      ),
      drawer: const SideMenu(),

      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(context),
            const SizedBox(height: 20),
            _buildHorizontalCardList(), 
            const SizedBox(height: 30),
            _buildBottomSection(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Makanan Favorite',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Makanan adalah segalanya bagi kita. tanpa makanan kita pun akan sulit buat mikir ide-ide kreatif makanya jangan lupa makan ya :v',
                  style: TextStyle(
                    fontSize: 14,
                    color: kTextColor.withOpacity(0.7),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FoodDetailPage(
                                imageUrl: 'assets/images/sosis.png',
                                title: 'Sosis Bakar',
                                description:
                                    'Sosis bakar jumbo dengan saus spesial.',
                                price: 3.00,
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kDarkBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                  ),
                  child: const Text(
                    'View More',
                    style: TextStyle(color: kWhiteColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/sosis.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalCardList() {
    final foodItems = [
      {
        'image': 'assets/images/nasgor.png',
        'title': 'Nasi Goreng',
        'subtitle': 'Nasi yang digoreng\nwith ndog dadar',
        'color': kDarkBlueColor,
        'price': 2.50,
        'description':
            'Nasi goreng spesial dengan telur dadar dan bumbu rahasia.'
      },
      {
        'image': 'assets/images/ayamgeprek.png',
        'title': 'Ayam Geprek',
        'subtitle': 'Kentucky pedes\nwith nasi',
        'color': kWhiteColor,
        'price': 2.20,
        'description':
            'Ayam krispi yang digeprek dengan sambal bawang super pedas.'
      },
      {
        'image': 'assets/images/spagetti.png',
        'title': 'Spaghetti',
        'subtitle': 'Mie with pasta\n kecap pedas',
        'color': kDarkBlueColor,
        'price': 4.75,
        'description':
            'Spaghetti klasik dengan saus bolognese dan sentuhan pedas.'
      },
    ];

    return Container(
      height: 280, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          final bool isWhiteCard = item['color'] == kWhiteColor;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailPage(
                    imageUrl: item['image'] as String,
                    title: item['title'] as String,
                    price: item['price'] as double,
                    description: item['description'] as String,
                  ),
                ),
              );
            },
            child: _buildFoodCard(
              imageUrl: item['image'] as String,
              title: item['title'] as String,
              subtitle: item['subtitle'] as String,
              cardColor: item['color'] as Color,
              textColor: isWhiteCard ? kTextColor : kWhiteColor,
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required Color cardColor,
    required Color textColor,
  }) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(
        left: 20,
        top: 20,
        bottom: 20,
        right: (title == 'Spaghetti') ? 20 : 0, 
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 13,
                      color: textColor.withOpacity(0.8),
                      height: 1.3),
                ),
              ],
            ),
          ),

          Positioned(
            top: -20, 
            left: 20,
            right: 20,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -15,
            right: -15,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: cardColor == kWhiteColor ? kDarkBlueColor : kWhiteColor,
                shape: BoxShape.circle,
                border: Border.all(color: kBackgroundColor, width: 4),
              ),
              child: Icon(
                Icons.add,
                color: cardColor == kWhiteColor ? kWhiteColor : kDarkBlueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/images/nasipadang.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Masakan Padang',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ini nih...Masakan Padang, yaitu masakan yg berasal dari Sumatra Utara, selain rasanya yg enak ini juga harganya murah (≡^∇^≡)',
                    style: TextStyle(
                      fontSize: 13,
                      color: kTextColor.withOpacity(0.7),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}