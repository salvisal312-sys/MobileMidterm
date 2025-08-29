import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/Screen/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SizedBox(height: 40),

          // Profile Picture
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("asset/images/profile.jpg"),
            ),
          ),
          const SizedBox(height: 16),

          // User Name
          Center(
            child: Text(
              "Sol Visal",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // User Email
          Center(
            child: Text(
              "Solvisal@email.com",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 24),

          // Edit Profile Button
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Navigate to edit profile screen
            },
            icon: const Icon(Icons.edit),
            label: Text(
              "Edit Profile",
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color.fromARGB(255, 3, 12, 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Options
          ListTile(
            leading: const Icon(Icons.lock),
            title: Text("Change Password", style: GoogleFonts.poppins()),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: Navigate to change password
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(
              "Logout",
              style: GoogleFonts.poppins(color: Colors.red),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
              // TODO: Handle logout
            },
          ),
        ],
      ),
    );
  }
}
