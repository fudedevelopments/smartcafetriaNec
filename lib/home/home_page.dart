import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  final List<String> banners = [
    'https://images.unsplash.com/photo-1687068328974-13261a846e58?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHJlc3RyYXVudHxlbnwwfHwwfHx8MA%3D%3D', // example banner image 1
    'https://plus.unsplash.com/premium_photo-1723377627996-1003fa5152cb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHJlc3RyYXVudHxlbnwwfHwwfHx8MA%3D%3D', // example banner image 2
    'https://plus.unsplash.com/premium_photo-1661601722152-87143d4be5b9?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Dhttps://images.unsplash.com/photo-1528699093553-93c0d92c2a61', // example banner image 3
  ];

  final List<Map<String, String>> categories = [
    {
      'title': 'Juice',
      'image': 'https://plus.unsplash.com/premium_photo-1663126827264-409d695e0be7?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    }, 
    {
      'title': 'Snacks',
      'image': 'https://images.unsplash.com/photo-1586190848861-99aa4a171e90'
    }, 
    {
      'title': 'Meals',
      'image': 'https://images.unsplash.com/photo-1512034400317-de97d7d6c3ed?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bWVhbHN8ZW58MHx8MHx8fDA%3D'
    },
  ];

  final List<Map<String, String>> restaurants = [
    {
      'name': 'Cafe Delight',
      'image': 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4'
    }, 
    {
      'name': 'Bistro Heaven',
      'image': 'https://images.unsplash.com/photo-1490111718993-d98654ce6cf7'
    }, 
    {
      'name': 'Meal Street',
      'image': 'https://images.unsplash.com/photo-1687068388111-be4d69793c03?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHJlc3RyYXVudHxlbnwwfHwwfHx8MA%3D%3D'
    },
  ];

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF43A047),
          Color(0xFF66BB6A),
        ], 
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  title: const Row(
    children: [
      CircleAvatar(
        radius: 20, // Adjust the size of the CircleAvatar
        backgroundImage: AssetImage("assets/images/logo.jpeg"),
      ),
      SizedBox(width: 10),
      Text('Smart Cafeteria'),
    ],
  ),
),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: banners.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(imageUrl,
                            fit: BoxFit.cover, width: double.infinity),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  offset: Offset(2, 2)),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                NetworkImage(categories[index]['image']!),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(categories[index]['title']!),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Restaurants',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          restaurants[index]['image']!,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(restaurants[index]['name']!),
                      subtitle: const Text('Best meals at affordable prices'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
