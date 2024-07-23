import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';



const logo =
    "https://firebasestorage.googleapis.com/v0/b/zresume-67ec9.appspot.com/o/logo.png?alt=media&token=9ffb8d3e-06e8-4f1a-bfcf-00cb9371162e";

const exampleImage =
    "https://firebasestorage.googleapis.com/v0/b/zresume-67ec9.appspot.com/o/Template.jpg?alt=media&token=fbc72545-0bdf-4666-9f5a-6272c7ce2e9e";


FirebaseOptions firebaseConfig = const FirebaseOptions(

    apiKey: "AIzaSyACH3_Iga66KGB2z8TXxbI_tl6DC7LBpPg",
    authDomain: "zresume-67ec9.firebaseapp.com",
    projectId: "zresume-67ec9",
    storageBucket: "zresume-67ec9.appspot.com",
    messagingSenderId: "535015116281",
    appId: "1:535015116281:web:6ee538babd29ec42e88128",
    measurementId: "G-FR8FSM33VV"

);

Uuid uuid = const Uuid();

DateFormat dateFormat = DateFormat("dd MMMM yyyy");
