import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/app/modules/auth/controllers/auth_controller.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = AuthController.instance.user;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAvatar(user),
                  Text(user!.displayName ?? user.phoneNumber ?? '',
                      style: const TextStyle(fontSize: 15)),
                  Text('ID: ${user.uid}', style: const TextStyle(fontSize: 13))
                ],
              )),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Log out',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: AuthController.instance.signOut,
          )
        ],
      ),
    );
  }

  _buildAvatar(User? user) {
    return user?.photoURL != null
        ? CircleAvatar(
            radius: 30, backgroundImage: NetworkImage(user!.photoURL!))
        : CircleAvatar(radius: 30, child: Text(user!.displayName?[0] ?? 'A'));
  }
}
