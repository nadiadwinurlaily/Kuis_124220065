import 'package:flutter/material.dart';

class Pembayaran extends StatelessWidget {
  final String name;
  final String email;
  final String totalRoom;
  final String totalNight;
  const Pembayaran(
      {super.key,
      required this.name,
      required this.email,
      required this.totalRoom,
      required this.totalNight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Payment Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Name: $name",
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Email: $email",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Total Rooms: $totalRoom",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Total Nights: $totalNight",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Payment for $name\'s booking successful!'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Pay Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
