import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicando_flutter_con_firebase/firebase/firebase.dart';

// Pages
import 'package:practicando_flutter_con_firebase/pages/edit_page.dart';

class ViewPage extends StatelessWidget {

  // List<dynamic>? snapshot;
  Map? document;
  String email;

  ViewPage( 
    // this.snapshot, 
    // this.document, 
    {
      super.key,
      required this.document,
      required this.email,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context, false);
          }, 
          icon: Icon(Icons.arrow_back_ios_sharp),
        ),
        title: Text('View Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                document!['titulo'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                document?['contenido'],
                style: TextStyle(fontSize: 20, color: Colors.grey.shade600),  
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'btn-borrar',
              onPressed: () async {
                bool res = await showDialog(
                  context: context, 
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Desea borrar la nota?'),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context, true);
                          }, 
                          child: Text('Si'),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context, false);
                          }, 
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
                if(res){
                  bool borrar = await borrarDocumento(email, document!['id']);
                  String id = document?['id'];
                  // print(snapshot);
                  // print(snapshot);
                  if(borrar){
                    // List newSnapshot = [];
                    // int index;
                    // for(var i = 0; i < snapshot!.length; i++){
                    //   if(snapshot?[i]['id'] != id){
                    //     print(i);
                    //     // index = i;
                    //     // print(snapshot?[i].length);
                    //     // snapshot?.remove(id == element['id']);
                    //     // snapshot?.remove(i);
                    //     newSnapshot.add(snapshot?[i]);
                    //     Navigator.pop(context, false);
                    //   }
                    // }
                  //   print(newSnapshot);
                  // }
                  // snapshot?.forEach((element) {
                  //   // print(element['id']);
                  //   if(element['id'] == id){
                  //     // print(element.length);
                  //     // snapshot?.remove(id == element['id']);
                  //     snapshot?.remove();
                  //     print(snapshot);
                  //   }
                  // });
                  // print(email);
                  // print(document!['id']);
                  // if(borrar){
                    Navigator.pop(context);
                    // Navigator.popAndPushNamed(context, '/home');
                  }
                }
              },
              child: Icon(Icons.delete, size: 35),
            ),
            FloatingActionButton(
              heroTag: 'btn-editar',
              onPressed: (){
                Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(),));
                // Navigator.popAndPushNamed(context, MaterialPageRoute(builder: (context) => EditPage(),));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditPage(document:document, email),));
              },
              child: const Icon(Icons.edit, size: 35),
            ),
          ],
        ),
      ),
    );
  }
}


















// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:practicando_flutter_con_firebase/firebase/firebase.dart';

// class ViewPage extends StatelessWidget {

//   // List<dynamic>? snapshot;
//   Map? document;
//   String email;

//   ViewPage( 
//     // this.snapshot, 
//     // this.document, 
//     {
//       super.key,
//       required this.document,
//       required this.email,
//     }
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: (){
//             Navigator.pop(context, false);
//           }, 
//           icon: Icon(Icons.arrow_back_ios_sharp),
//         ),
//         title: Text('View Note'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               child: Text(
//                 document!['titulo'],
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(top: 15),
//               child: Text(
//                 document?['contenido'],
//                 style: TextStyle(fontSize: 20, color: Colors.grey.shade600),  
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             FloatingActionButton(
//               heroTag: 'btn-borrar',
//               onPressed: () async {
//                 bool res = await showDialog(
//                   context: context, 
//                   builder: (context) {
//                     return AlertDialog(
//                       title: Text('Desea borrar la nota?'),
//                       actions: [
//                         TextButton(
//                           onPressed: (){
//                             Navigator.pop(context, true);
//                           }, 
//                           child: Text('Si'),
//                         ),
//                         TextButton(
//                           onPressed: (){
//                             Navigator.pop(context, false);
//                           }, 
//                           child: Text('No'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//                 if(res){
//                   bool borrar = await borrarDocumento(email, document!['id']);
//                   String id = document?['id'];
//                   // print(snapshot);
//                   // print(snapshot);
//                   if(borrar){
//                     // List newSnapshot = [];
//                     // int index;
//                     // for(var i = 0; i < snapshot!.length; i++){
//                     //   if(snapshot?[i]['id'] != id){
//                     //     print(i);
//                     //     // index = i;
//                     //     // print(snapshot?[i].length);
//                     //     // snapshot?.remove(id == element['id']);
//                     //     // snapshot?.remove(i);
//                     //     newSnapshot.add(snapshot?[i]);
//                     //     Navigator.pop(context, false);
//                     //   }
//                     // }
//                   //   print(newSnapshot);
//                   // }
//                   // snapshot?.forEach((element) {
//                   //   // print(element['id']);
//                   //   if(element['id'] == id){
//                   //     // print(element.length);
//                   //     // snapshot?.remove(id == element['id']);
//                   //     snapshot?.remove();
//                   //     print(snapshot);
//                   //   }
//                   // });
//                   // print(email);
//                   // print(document!['id']);
//                   // if(borrar){
//                     // Navigator.pop(context);
//                     // Navigator.popAndPushNamed(context, '/home');
//                   }
//                 }
//               },
//               child: Icon(Icons.delete, size: 35),
//             ),
//             FloatingActionButton(
//               heroTag: 'btn-editar',
//               onPressed: (){
//                 print('Editar');
//               },
//               child: Icon(Icons.edit, size: 35),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }