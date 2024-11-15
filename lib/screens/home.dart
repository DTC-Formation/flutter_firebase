import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/auth/login.dart';
import 'package:flutter_firebase/screens/private_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Vérifier si l'utilisateur est connecté
    return StreamBuilder<User?>(
      // Utiliser le stream authStateChanges pour écouter les changements d'état de l'utilisateur Firebase
      // Cela permet de savoir si l'utilisateur est connecté ou déconnecté
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          // Utilisateur connecté
          return PrivateHomeScreen();
        } else {
          // Utilisateur non connecté
          return LoginScreen();
        }
      },
    );
  }
}

//Note: IL FAUT ACTIVER LE FIREBASE AUTH DANS LA CONSOLE FIREBASE AVEC L'EMAIL/PASSWORD POUR QUE CELA FONCTIONNE