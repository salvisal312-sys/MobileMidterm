import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  void decrease() {
    setState(() {
      if (counter > 0) counter--;
    });
  }

  void increase() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SizedBox(height: 40),

          // Welcome message
          Text(
            "Welcome Back!",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Here's your dashboard",
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 30),

          // Feature cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _featureCard(Icons.shopping_cart, "Orders", Colors.orange),
              _featureCard(Icons.inventory, "Products", Colors.green),
              _featureCard(Icons.bar_chart, "Reports", Colors.blue),
            ],
          ),
          const SizedBox(height: 40),

          // Counter demo
          Center(
            child: Column(
              children: [
                Text("Counter", style: GoogleFonts.poppins(fontSize: 20)),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("$counter", style: const TextStyle(fontSize: 40)),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _counterButton("-", decrease),
                    const SizedBox(width: 20),
                    _counterButton("+", increase),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureCard(IconData icon, String title, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 30, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _counterButton(String text, VoidCallback onPressed) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 63, 22, 212),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
