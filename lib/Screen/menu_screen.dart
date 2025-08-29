import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void _showComingSoonDialog(String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: GoogleFonts.poppins()),
          content: Text(
            "This feature is coming soon / under maintenance.",
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SizedBox(height: 40),

          // Title
          Text(
            "Settings",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Menu Items with dialog
          _menuItem(Icons.notifications, "Notifications", () {
            _showComingSoonDialog("Notifications");
          }),
          _menuItem(Icons.info, "About", () {
            _showComingSoonDialog("About");
          }),
          _menuItem(Icons.help, "Help & Support", () {
            _showComingSoonDialog("Help & Support");
          }),
          _menuItem(Icons.privacy_tip, "Privacy Policy", () {
            _showComingSoonDialog("Privacy Policy");
          }),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, VoidCallback onTap) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: GoogleFonts.poppins(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
