import 'package:flutter/material.dart';
import 'package:phoneauth_firebase/provider/auth_provider.dart';
import 'package:phoneauth_firebase/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Profile Dashboard"),
        actions: [
          TextButton.icon(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(
              Icons.logout_rounded,
              size: 30.0,
              color: Colors.white,
            ),
            label: Text('Logout',
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            backgroundImage: NetworkImage(ap.userModel.profilePic),
            radius: 100,
          ),
          const SizedBox(height: 20),
          Text(ap.userModel.name,
              style: TextStyle(fontSize: 22, color: Colors.black)),
          const SizedBox(height: 20),
          Text(ap.userModel.phoneNumber,
              style: TextStyle(fontSize: 20, color: Colors.grey.shade700)),
          const SizedBox(height: 5),
          Text(ap.userModel.email,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic)),
          const SizedBox(height: 20),
          Text(ap.userModel.bio,
              style: TextStyle(fontSize: 18, color: Colors.black)),
        ],
      )),
    );
  }
}
