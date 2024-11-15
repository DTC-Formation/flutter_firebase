import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/add_user.dart';
import 'package:flutter_firebase/screens/auth/login.dart';
import 'package:flutter_firebase/screens/update_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PrivateHomeScreen extends StatelessWidget {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  PrivateHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des utilisateurs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Déconnexion de l'utilisateur
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _usersCollection.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          if (snapshot.data!.docs.isEmpty) return const Text('Aucun utilisateur trouvé');
          if (snapshot.hasError) return Text('Erreur: ${snapshot.error}');

          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final user = data[index];
              return Dismissible(
                key: Key(user.id),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    _usersCollection.doc(user.id).delete();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${user['name']} supprimé')),
                    );
                  } else if (direction == DismissDirection.startToEnd) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateUserScreen(
                          userId: user.id,
                          initialName: user['name'],
                          initialEmail: user['email'],
                        ),
                      ),
                    );
                  }
                },
                background: Container(color: Colors.green, alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 20.0), child: const Icon(Icons.edit, color: Colors.white)),
                secondaryBackground: Container(color: Colors.red, alignment: Alignment.centerRight, padding: const EdgeInsets.only(right: 20.0), child: const Icon(Icons.delete, color: Colors.white)),
                child: ListTile(
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUserScreen()),
          );
        },
      ),
    );
  }
}
