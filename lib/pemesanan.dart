import 'package:flutter/material.dart';
import 'package:kuis_124220065/pembayaran.dart';

class Pemesanan extends StatefulWidget {
  final Map<String, dynamic> hotel;
  const Pemesanan({super.key, required this.hotel});

  @override
  State<Pemesanan> createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  String _fullname = "";
  String _email = "";
  String _totalRoom = "";
  String _totalNight = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotel['name']),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                widget.hotel['image'],
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 3),
              Text(
                widget.hotel['name'], 
              ),
              const SizedBox(height: 5),
              Text(
                widget.hotel['price'],
              ),
              const SizedBox(height: 3),
              const Text(
                "Booking Information",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildForm(),
              const SizedBox(height: 10),
              _buildButtonSubmit()
            ],
          ),
        ),
      ),
    );
  }

  Widget _formInput({
    required String hint,
    required String label,
    required Function(String value) setStateInput,
    int maxLines = 1,
  }) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: (value) => setState(() {
        setStateInput(value);
      }),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        _formInput(
            hint: "Full Name",
            label: "Full Name *",
            setStateInput: (value) {
              _fullname = value;
            }),
        const SizedBox(
          height: 12,
        ),
        _formInput(
            hint: "Email",
            label: "Email *",
            setStateInput: (value) {
              _email = value;
            }),
        const SizedBox(
          height: 12,
        ),
        _formInput(
            hint: "Total Room",
            label: "Total Room *",
            setStateInput: (value) {
              _totalRoom = value;
            }),
        const SizedBox(
          height: 12,
        ),
        _formInput(
            hint: "Total Night",
            label: "Total Night *",
            setStateInput: (value) {
              _totalNight = value;
            }),
      ],
    );
  }

  Widget _buildButtonSubmit() {
    return ElevatedButton(
      onPressed: () {
        if (_fullname == "" ||
            _email == "" ||
            _totalRoom == "" ||
            _totalNight == "") {
          SnackBar snackBar =
              const SnackBar(content: Text("* data tidak boleh kosong"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Pembayaran(
              name: _fullname,
              email: _email,
              totalRoom: _totalRoom,
              totalNight: _totalNight,
            );
          }));
        }
      },
      child: const Text("Payment"),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
