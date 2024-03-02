import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Main2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 740),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Container(
                  width: 96.w,
                  height: 24.h,
                  margin: EdgeInsets.fromLTRB(24, 10, 240, 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


// // main.dart
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'main2.dart'; // SecondPage를 사용하기 위해 import 해야합니다.
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//       apiKey: 'AIzaSyDogzalL_f-tEOiqOrBSfN8Amzc64l_nLw',
//       appId: '1:531305378076:android:31a98cc7b8d92f337b4ad9',
//       messagingSenderId: '531305378076',
//       projectId: 'modir-d8182',
//       storageBucket: 'modir-d8182.appspot.com',
//     ),
//   );
//   runApp(MaterialApp(home: MyApp())); // MaterialApp added here
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final auth = FirebaseAuth.instance;
//   String email = '';
//   String password = '';
//   String value1 = '';
//   String value2 = '';
//
//   Future<void> signupEmail() async {
//     try {
//       await auth.createUserWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//     }
//   }
//
//   Future<void> loginEmail() async {
//     try {
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//     }
//   }
//
//   Future<String> fetchData() async { // Changed the return type to Future<String>
//     final FirebaseFirestore firestore = FirebaseFirestore.instance;
//     DocumentSnapshot doc = await firestore.collection('test').doc('hi').get();
//
//     return doc['field1']; // Here we return the value of 'field1'
//   }
//
//   Future<void> saveData() async {
//     final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//     try {
//       await firestore.collection('test').doc('hi').set({
//         'field1': value1,
//         'field2': value2,
//       });
//
//       print('Data saved to Firestore.');
//     } catch (e) {
//       print('Failed to save data: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( // MaterialApp removed from here
//       appBar: AppBar(title: Text('My App')),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Email",
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   email = value;
//                 });
//               },
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Password",
//               ),
//               obscureText: true,
//               onChanged: (value) {
//                 setState(() {
//                   password = value;
//                 });
//               },
//             ),
//             ElevatedButton(
//               onPressed: signupEmail,
//               child: Text('Sign up'),
//             ),
//             ElevatedButton(
//               onPressed: loginEmail,
//               child: Text('Log in'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SecondPage()),
//                 );
//               },
//               child: Text('Go to Second Page'),
//             ),
//             FutureBuilder<String>( // Added FutureBuilder
//               future: fetchData(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 } else {
//                   if (snapshot.hasError)
//                     return Text('Error: ${snapshot.error}');
//                   else
//                     return Text('Fetched Data: ${snapshot.data}'); // Text widget displays the fetched data
//                 }
//               },
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: "Field 1"),
//               onChanged: (value) {
//                 setState(() {
//                   value1 = value;
//                 });
//               },
//             ),
//
//             TextField(
//               decoration: InputDecoration(labelText: "Field 2"),
//               onChanged: (value) {
//                 setState(() {
//                   value2 = value;
//                 });
//               },
//             ),
//
//             ElevatedButton(
//               onPressed: saveData,
//               child: Text('Save Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
