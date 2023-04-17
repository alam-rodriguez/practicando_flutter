import 'package:flutter/material.dart';

// Firebase
import '../firebase/firebase.dart';

class Login extends StatefulWidget {


  Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // Variables
  final mail = TextEditingController();
  final password = TextEditingController();

  // Alert
  Future<dynamic> dialogo(BuildContext context, String title, String content) {
    
    return showDialog(
      context: context, 
        builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
          actions: [
            TextButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login  Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'correo@ejemplo.com',
                label: Text('Correo'),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: mail,
            ),
            const SizedBox(height: 15,),
            TextField(
              decoration: const InputDecoration(
                hintText: '**********',
                label: Text('Contraseña'),
              ),
              controller: password,
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    // print('-------------------------');
                    // print(mail);
                    // print(password);
                    // print('-------------------------');
                    // String res = 
                    String? res = await crearUsuario(mail.text, password.text);
                    if(res == mail.text){
                      Navigator.popAndPushNamed(context, '/home');
                    }else if(res == 'unknown') {
                      dialogo(context, 'Correo y contraseña incorrecto', 'Este correo y contraseña estan incorrectos.');
                    }else if(res == 'email-already-in-use') {
                      dialogo(context, 'Este email ya esta en uso', 'Este correo ya esta en uso, por favor, ingrese otro correo, pero si este correo le pertenece puede accedar a su cuenta.');
                      // showDialog(
                      //   context: context, 
                      //   builder:(BuildContext context) => AlertDialog(
                      //       title:  Text( res != null ? 'Este email ya esta en uso' : ''),
                      //       content: Text('Este correo ya esta en uso, por favor, ingrese otro correo, pero si este correo le pertenece puede accedar a su cuenta.'),
                      //       actions: <Widget> [
                      //         TextButton(
                      //           onPressed: (){
                      //             Navigator.pop(context);
                      //           }, 
                      //           child: Text('Reintentar'),
                      //         ),
                      //       ],
                      //     ),
                      // );
                    }else if(res == 'invalid-email'){
                      dialogo(context, 'Este email es invalido', 'Este correo es invalido, tal vez tiene poco caracteres o talvez hay algun caracter no soportado.');
                    }else if(res == 'weak-password'){
                      dialogo(context, 'Contraseña muy corta', 'Esta contraseña es muy corta, ingrese una contraseña mas larga, con un minimo de 6 caracteres.');
                    }
                  }, 
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: const Text(
                    'Crear usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 50,),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () async {
                    String? res = await logearUsuario(mail.text, password.text);
                    if(res == mail.text){
                      Navigator.popAndPushNamed(context, '/home');
                    }else if(res == 'unknown'){
                      dialogo(context, 'Debe ingresar los datos', 'Para iniciar sesion con su cuenta debe de ingresar un correy y una contraseña valida');
                    }else if(res == 'invalid-email'){
                      dialogo(context, 'Correo invalido', 'Correo invalido, si desea registrar con su cuenta debe de escribir el correo de la manera correcta');
                    }else if( res == 'user-not-found'){
                      dialogo(context, 'Correo no encontrado', 'Este correo no esta registrado en la App, puede registrarse con este email');
                    }else if( res == 'wrong-password'){
                      dialogo(context, 'Contraseña inconrrecta', 'Contraseña incorrecta, por favor ingresenueva mente su contraseña y asegurese de no equivocarse');
                    }
                  }, 
                  child: const Text(
                    'Inicial sesion',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}