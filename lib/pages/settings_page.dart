import 'package:flutter/material.dart';

// Firebase
import '../firebase/firebase.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.popAndPushNamed(context, '/home');
          }, 
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Settings page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            children: [
              TextButton(
                onPressed: () async {
                  String res = await deslogearUsuario();
                  if(res == 'exito'){
                    Navigator.popAndPushNamed(context, '/login');
                  }
                }, 
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                child: const Text(
                  'Cerrar Sesion',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  
                }, 
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                child: const Text(
                  'Cerrar Sesion',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}