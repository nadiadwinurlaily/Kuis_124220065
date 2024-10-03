import 'package:flutter/material.dart';
import 'package:kuis_124220065/pemesanan.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> hotels = [
    {
      'name': 'Blue Lagoon',
      'image': 'assets/hotel.jpg',
      'price': 'Rp 500.000/night',
    },
    {
      'name': 'Blue Lagoon',
      'image': 'assets/hotel.jpg',
      'price': 'Rp 500.000/night',
    },
    {
      'name': 'Blue Lagoon',
      'image': 'assets/hotel.jpg',
      'price': 'Rp 500.000/night',
    },
    {
      'name': 'Blue Lagoon',
      'image': 'assets/hotel.jpg',
      'price': 'Rp 500.000/night',
    },
    {
      'name': 'Blue Lagoon',
      'image': 'assets/hotel.jpg',
      'price': 'Rp 500.000/night',
    },
    {
      'name': 'Blue Lagoon',
      'image': 'assets/hotel.jpg',
      'price': 'Rp 500.000/night',
    },
    {
      'name': 'Blue Lagoon',
      'image': 'assets/hotel.jpg',
      'price': 'Rp 500.000/night',
    },
    {
      'name': 'Blue Lagoon',
      'image': 'assets/hotel.jpg',
      'price': 'Rp 500.000/night',
    },
    {
      'name': 'Blue Lagoon',
      'image': 'assets/hotel.jpg',
      'price': 'Rp 500.000/night',
    },
    {
      'name': 'Blue Lagoon',
      'image': 'assets/hotel.jpg',
      'price': 'Rp 500.000/night',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Blue Doorz'),
          ],
        ),
        centerTitle: true, 
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/logo.png', 
                height: 40,
              ),
              const Text(
                "Welcome to Blue Doorz!!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () async {
                  const url = 'https://traveloka.com';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: const Text('About Us'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                return _buildHotelCard(context, hotels[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, Map<String, dynamic> hotel) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            hotel['image'],
            fit: BoxFit.cover,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hotel['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(hotel['price']),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Pemesanan(
                  hotel: hotel,
                );
              }));
            },
            child: const Text("Book Now"),
          ),
        ],
      ),
    );
  }
}