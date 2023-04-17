import 'package:flutter/material.dart';
import 'package:practicando_flutter_con_firebase/pages/view_note_page.dart';

// Firebase
import '../firebase/firebase.dart';

class HomePages extends StatefulWidget {

  String email;
  // List data;

  HomePages({
    super.key,
    required this.email,
    // required this.data,
  });

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/settings');
            }, 
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getData(widget.email),
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index]['titulo']),
                  subtitle: Text(snapshot.data?[index]['contenido']),
                  onTap: () async {
                    await  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPage(document: snapshot.data?[index], email: widget.email),));
                    setState(() {});
                  },
                );
              },
            );
          }else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }
}






























// import 'package:flutter/material.dart';

// // Firebase
// import 'package:practicando_flutter_con_firebase/firebase/firebase.dart';

// // Pages
// import 'package:practicando_flutter_con_firebase/pages/view_note_page.dart';

// //Rstart App
// import 'package:restart_app/restart_app.dart';

// class HomePages extends StatefulWidget {

//   String email;
//   List data;

//   HomePages({
//     super.key,
//     required this.email,
//     required this.data,
//     // required this.data,
//   });

//   @override
//   State<HomePages> createState() => _HomePagesState();
// }

// class _HomePagesState extends State<HomePages> {
//   // Future<void> saludar() async {
//   //   Text('data');
//   // }

//   // Future<dynamic>? getDataRes;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getDataRes = getData(widget.email);
//   // }

// late Future getDataf;

// @override
// void initState() {
//   super.initState();
//   getDataf = getData(widget.email);
// }

//   @override
//   Widget build(BuildContext context) {

//     // Future<List> data = getData(widget.email);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Note App'),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               Navigator.popAndPushNamed(context, '/settings');
//             }, 
//             icon: const Icon(Icons.settings),
//           ),
//         ],
//       ),
//       body: FutureBuilder(
//         future: getDataf,
//         builder:(context, snapshot) {
//           if(snapshot.hasData){
//             return ListView.builder(
//             itemCount: snapshot.data?.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(snapshot.data![index]['titulo']),
//                 subtitle: Text(snapshot.data?[index]['contenido']),
//                 onTap: () async {
//                   String id = '';
//                   Map<String, dynamic>? document= {};

//                   // print(snapshot.data![index]);
//                   // print('---------------------------');
//                   // print(document);
//                   // print(widget.email);
//                   // print('---------------------------');

//                   // print(widget.data[index]['id']);
//                   id = widget.data[index]['id'];
//                   document = await getDocumento(widget.email, id);
//                   bool res = await Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPage(snapshot.data,document, email:widget.email),));
//                   // print(res);

//                   if(res){
//                     // snapshot.data?.removeAt(index);
//                     // Future<List<dynamic>> newData = (await getData(widget.email)) as Future<List>; 
//                     // setState(() async {
//                     //   var res = getData(widget.email);
//                     //   getDataf = res;
//                     // });
//                     Restart.restartApp();
//                   }else {
//                     setState(() {});
//                   }

//                   // snapshot = res as AsyncSnapshot<List>;

//                   // setState(() {
//                   //   // getDataRes = res as Future?;
//                   // });
//                 },
//               );
//             },
//           );
//         } else {
//           return const CircularProgressIndicator();
//         }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           // await crearNota('hh', 'jj', 'hh');
//           await Navigator.pushNamed(context, '/add');
//           var res = await getData(widget.email);
//           if(res == 'exito'){
//             Restart.restartApp();
//           }

//           // List res = 
//           // getDataf = await getData(widget.email);
//           // setState(() {
//           // });
//         },
//         child: const Icon(Icons.add, size: 40),
//       ),
//     );
//   }
// }



// return Row(
              // color: Colors.red,
              // width: 50,
              // child: Column(
              //   children: [
              //     Text(data[index]['titulo']),
              //     Text(data[index]['contenido']),
              //   ],
              // ),
              // child: ListTile(
              //   style: ListTileStyle.l,
              //   title: Text(data[index]['titulo']),
              //   subtitle: Text(data[index]['contenido']),
              //   onTap: () {
              //     print('Hola');
              //   },
              // ),
            // );







            // body: ListView.builder(
      //   itemCount: widget.data.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(widget.data[index]['titulo']),
      //       subtitle: Text(widget.data[index]['contenido']),
      //       onTap: () async {
      //         // print(data[index]['id']);
      //         String id = widget.data[index]['id'];
      //         Map<String, dynamic>? document = await getDocumento(widget.email, id);
        
      //         // print(document?['titulo']);
      //         // Navigator.popAndPushNamed(context, '/view', arguments: ViewPage('gg'));
      //         Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPage(document, email:widget.email),));
      //       },
      //     );
      //   },
      // ),
      // Row(
      //   // width: double.infinity,
      //   // color: Colors.amber,
      //   children: [
      //     ListView.builder(
      //     itemCount: data.length,
      //     itemBuilder: (context, index) {
      //       return Column(
      //           children: [
      //             Text(data[index]['titulo']),
      //             Text(data[index]['contenido']),
      //           ],
      //         );
      //     },
      //   ),
      //   ],
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(15),
      //   child: Container(
      //     child: ListView.builder(
      //       itemCount: data.length,
      //       itemBuilder: (BuildContext context,int index) {
      //         return Text(data[index]![1]!);
      //       },
      //     ),
      //   ),
      // ),