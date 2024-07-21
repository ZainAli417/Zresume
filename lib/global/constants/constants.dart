import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';



const logo =
    "https://firebasestorage.googleapis.com/v0/b/fresume-app.appspot.com/o/Fresume%20(1).png?alt=media&token=8c30ca37-1a98-4ff8-b4c6-f97f9dc7263f";

const exampleImage =
    "https://firebasestorage.googleapis.com/v0/b/fresume-app.appspot.com/o/Screenshot%202022-01-14%20at%207.07.21%20PM.png?alt=media&token=aab16e72-be29-4792-8e04-f0bb07ec3458";


FirebaseOptions firebaseConfig = const FirebaseOptions(
    apiKey: "AIzaSyADMCSCxKdqf3eFE-IhsxJwilumg8M4ioA",
    authDomain: "zresume-f819f.firebaseapp.com",
    projectId: "zresume-f819f",
    storageBucket: "zresume-f819f.appspot.com",
    messagingSenderId: "389537531779",
    appId: "1:389537531779:web:cd2637a873a70ba04398b6",
    measurementId: "G-GB2626GDXQ"
);

Uuid uuid = const Uuid();

DateFormat dateFormat = DateFormat("dd MMMM yyyy");
