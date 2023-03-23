import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:reactionchat/screen/wrapper.dart';
import 'package:reactionchat/services/auth.dart';
import 'firebase_options.dart';
import "package:provider/provider.dart";
import 'package:reactionchat/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      catchError: (_, __) => null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }




// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 34, 65, 35),
//       appBar: AppBar(
//         title: Text('Ninja ID'),
//         backgroundColor: Color.fromARGB(255, 48, 116, 51),
//         elevation: 0.0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Name",
//               style: TextStyle(color: Colors.green, letterSpacing: 2.0),
//             ),
//             Text("Ahmed",
//                 style: TextStyle(
//                   color: Colors.amberAccent,
//                   letterSpacing: 2.0,
//                   fontSize: 28.0,
//                   fontWeight: FontWeight.bold,
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
