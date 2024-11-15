import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUserScreen extends StatelessWidget {
  final String userId;
  final String initialName;
  final String initialEmail;

  UpdateUserScreen({super.key, 
    required this.userId,
    required this.initialName,
    required this.initialEmail,
  });

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = initialName;
    emailController.text = initialEmail;

    return Scaffold(
      appBar: AppBar(title: const Text('Modifier un utilisateur')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Update user in Firestore
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId)
                    .update({
                  'name': nameController.text,
                  'email': emailController.text,
                });
                Navigator.pop(context);
              },
              child: const Text('Mettre à jour'),
            ),
          ],
        ),
      ),
    );
  }
}
