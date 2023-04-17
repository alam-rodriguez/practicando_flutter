import 'package:flutter/material.dart';

// Firebase
import '../firebase/firebase.dart';

class EditPage extends StatelessWidget {

  Map? document;
  String email;

  EditPage(
    this.email,
    {
    super.key,
    required this.document,
    }
  ); 

  

  @override
  Widget build(BuildContext context) {

    TextEditingController nota = TextEditingController(text: document?['titulo']);
    TextEditingController contenido = TextEditingController(text: document?['contenido']);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.popAndPushNamed(context, '/home');
          }, 
          icon: const  Icon(Icons.arrow_back_ios_new)
        ),
        title: const Text('Editar nota'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget> [
            TextField(
              controller: nota,
              decoration: const InputDecoration(
                hintText: 'Titulo de la nota...',
                label: Text('Titulo', style: TextStyle(fontSize: 25),),
              ),
            ),
            const SizedBox(height: 30,),
            TextField(
              controller: contenido,
              decoration: const InputDecoration(
                hintText: 'Contenido de la nota...',
                label: Text('Contenido', style: TextStyle(fontSize: 25),),
              ),
            ),
            const SizedBox(height: 30,),
            const SizedBox(height: 25,),
            TextButton(
              onPressed: () async {
                // print(email);
                // print(nota.text);
                // print(contenido.text);
                // if(nota.text.length < 2 || contenido.text.length < 3){
                //   showDialog(
                //     context: context, 
                //     builder: (context) => AlertDialog(
                //       title: const Text('Error'),
                //       content: const Text('Para poder crear la nota correctamente debe ingresar por lo menos insertar 2 caracteres en el titulo y 3 carcteres en el contenido'),
                //       actions: [
                //         TextButton(
                //           onPressed: () => Navigator.pop(context), 
                //           style: TextButton.styleFrom(
                //             backgroundColor: Colors.deepOrange,
                //             fixedSize: const Size(200, 50),
                //           ),
                //           child: const Text('Reintentar', style: TextStyle(color: Colors.white, fontSize: 17),),
                //         ),
                //       ],
                //     ),
                //   );
                // }else {
                //   // var uuid = const Uuid();
                //   // var v4 = uuid.v4();
                //   String? res = await crearNota(widget.email, nota.text, contenido.text);
                //   if(res == 'exito'){
                //     Navigator.pop(context);
                //   }
                // }
                bool res = await actualizarDocumento(email, document?['id'], nota.text, contenido.text);
                if(res){
                  Navigator.pop(context, true);
                  Navigator.pushNamed(context, '/home');
                }
                print('---------------------');
                print(nota.text);
                print(contenido.text);
                print('---------------------');                
              }, 
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              child: const Text('Guardar Nota', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}