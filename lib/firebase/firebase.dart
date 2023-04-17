import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

// uuid 
import 'package:uuid/uuid.dart';

// final email = null;

FirebaseFirestore db = FirebaseFirestore.instance;

Future<String?> crearUsuario(String email, String password) async {
  // print('------------------');
  // print(email);
  // print(password);
  // print('------------------');
  try{
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    print(credential.user?.email);
    return credential.user?.email;
  
    // if(credential.user?.email == email){
      // return credential.user?.email;

      // }else {
      // return res;
    } on FirebaseAuthException catch(e){
      print(e.code);
      return e.code;
      // return e.code;
    } catch(e){
      print(e);
    }

}

Future<String?> logearUsuario(String email, String password) async {
  try{
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    print(credential.user?.email);
    return credential.user?.email;
  } on FirebaseAuthException catch(e){
    print(e.code);
    return e.code;
  } catch(e){
    print(e);
  }
}

Future<String?> logearUsuarioAutomaticamente() async {
  try{
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      // if(user != null){
      //   final userEmail = user.email; 
      //   print(userEmail);
      //   // return user;
      // }
      if(user != null){
        for(final providerProfile in user.providerData){
          final emailAddress = providerProfile.email;
          // print(emailAddress);
          final email = emailAddress;
          // print(email);
          // return emailAddress;
        }
      }
    });
  } on FirebaseAuthException catch(e){
    // return e.code;
  } catch(e){
    
  }
}

// String devuelveEmail(){
//   return email != null ? email : 'nada';
// }

// Future<bool> borrarUsuario() async {

//   await FirebaseAuth.instance.signOut();

//   return false;
// }

Future<String> deslogearUsuario() async{
  try{
    await FirebaseAuth.instance.signOut();
    return 'exito';
  } on FirebaseAuthException catch(e){
    return e.code;
  }
}

Future<String?> crearNota(String email,String titulo, String contenido) async {
  try{
    var uuid = Uuid();
    String id = uuid.v4();
    final nota = <String, dynamic>{
      "id": id,
      "titulo": titulo,
      "contenido": contenido,
    };

    await db.collection('$email-notas').doc(id).set(nota);

    // await db.collection('${email}-notas/$uuid').add(nota);
    // .then((DocumentReference doc) {
    //   // print('DocumentSnapshot added with ID: ${doc.id}');   
    //   return 'exito';
    // });
    return 'exito';
  } on FirebaseException catch(e){
    return e.code;
  }
}

Future<List> getData(String email) async{
   List res = [];

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await db.collection('$email-notas').get();
  for( var docSnapshot in querySnapshot.docs){
    res.add(docSnapshot.data());
    // print('${docSnapshot.id} => ${docSnapshot.data()}');
    // print(docSnapshot.data());
  }
  return res;
}

Future<Map<String, dynamic>?> getDocumento(String email, String id) async {
  final docRef = db.collection('$email-notas').doc(id);
  var doc = await docRef.get();
  final Map<String, dynamic>? data = doc.data();
  // print(data);

  return data;
}

Future<bool> borrarDocumento(String email, String id)async{
  try{
    await db.collection('$email-notas').doc(id).delete();
    return true;
  } on FirebaseException catch(e){
    print(e);
    return false;
  }
}

Future<bool> actualizarDocumento(String email, String id, String newTitulo, String newContenido) async {
  try{
    final docRef = db.collection('$email-notas').doc(id);
    await docRef.update({
      "titulo": newTitulo,
      "contenido": newContenido,
    });
    return true;
  } on FirebaseException catch(e){
    print(e);
    return false;
  }
}