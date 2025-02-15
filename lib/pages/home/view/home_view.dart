import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zresume/apis/auth.dart';
import 'package:zresume/global/constants/constants.dart';
import 'package:zresume/global/models/pdf_model.dart';
import 'package:zresume/global/theme/pallete.dart';
import 'package:zresume/global/theme/theme.dart';
import 'package:zresume/global/widgets/buttons.dart';
import 'package:zresume/global/widgets/shape.dart';
import 'package:zresume/pages/form/controller/form_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAuthView extends ConsumerWidget {
  const HomeAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(body: Center(child: LayoutBuilder(
      builder: (context, size) {
        if (size.maxWidth > 750) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: 850,
              height: 600,
              child: Card(
                color: Pallete.primaryLightColor,
                elevation: 8,
                shape: Shape.roundedRectangleBorderAll(20),
                shadowColor: Colors.black.withOpacity(0.4),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const LogoAndTitleRow(),
                    Expanded(
                      child: Row(
                        children: [
                          LoginButton(false),
                          ExampleImage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Container(
          color: Pallete.primaryLightColor,
          child: Column(
            children: [
              LogoAndTitleColumn(),
              ExampleImage(),
              SizedBox(height: 16),
              LoginButton(true),
            ],
          ),
        );
      },
    )));
  }
}

class ExampleImage extends StatelessWidget {
  const ExampleImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Pallete.primaryLightColor,
        child: Center(
          child: Image.asset(
            'assets/Template.jpg',
            height: 400,
          ),
        ),
      ),
    );
  }
}

class LoginButton extends ConsumerWidget {
  final bool useMobileLayout;

  LoginButton(
    this.useMobileLayout, {
    Key? key,
  }) : super(key: key);

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      // Optionally update Firestore here
      User? currentUser = _auth.currentUser;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser!.uid)
          .set({'uid': currentUser.uid, 'lastLoggedIn': DateTime.now()});

      // Navigate to /resume after successful sign-in
      Get.toNamed('/resume');
    } catch (e) {
      // Handle errors
      print(e);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.primaryColor,
          borderRadius: useMobileLayout
              ? Shape.roundedShapeOnly(topRight: 20, topLeft: 20)
              : Shape.roundedShapeOnly(topRight: 20, bottomRight: 20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => signInWithGoogle(context),
                child: Image.asset(
                  'assets/google.png',
                  width: 250, // Set your desired width
                  height: 50, // Set your desired height
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                      child: Divider(
                          color: Pallete.primaryLightColor, thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text('OR',
                        style: subtitle14.copyWith(
                            color: Pallete.primaryLightColor,
                            fontWeight: FontWeight.w400)),
                  ),
                  const Expanded(
                      child: Divider(
                          color: Pallete.primaryLightColor, thickness: 1)),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SimpleElevatedButton(
                  color: Pallete.backgroundColor,
                  textColor: Pallete.primaryColor,
                  buttonHeight: 50,
                  buttonWidth: 300,
                  roundedRadius: 5,
                  onPressed: () {
                    ref.watch(pdfProvider.notifier).editPdf(
                          PdfModel.createEmpty().copyWith(pdfId: 'noSave'),
                        );
                    Get.toNamed('/resume');
                  },
                  text: 'Continue without signing in'),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Using your Google account will allow you to save up to 3 resumes, you can still continue without signing in but your resume will not be saved once you leave/refresh the site.',
                style: caption12.copyWith(color: Pallete.warning),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoAndTitleRow extends StatelessWidget {
  const LogoAndTitleRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.primaryLightColor,
      child: Row(
        children: [
          Positioned(
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: Shape.roundedShapeAll(20),
                image: const DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create A Professional Resume Now!',
                style: headline34.copyWith(
                    color: Pallete.primaryColor, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    'developed by ',
                    style: subtitle16.copyWith(color: Pallete.primaryColor),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl('https://zainaliportfolio.000.pe' as Uri);
                    },
                    child: Text(
                      'Zain Ali',
                      style: subtitle16.copyWith(
                          decoration: TextDecoration.underline,
                          color: Pallete.primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LogoAndTitleColumn extends StatelessWidget {
  const LogoAndTitleColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.primaryLightColor,
      padding: const EdgeInsets.only(
          top: 40), // Added space from the top of the screen
      child: Column(
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: Shape.roundedShapeAll(20),
              image: const DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
          Text(
            'Create A Professional Resume Now!',
            style: headline20.copyWith(
                color: Pallete.primaryColor, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'developed by ',
                style: subtitle14.copyWith(color: Pallete.primaryColor),
              ),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse('https://zainaliportfolio.000.pe'));
                },
                child: Text(
                  'Zain Ali',
                  style: subtitle16.copyWith(
                      decoration: TextDecoration.underline,
                      color: Pallete.primaryColor),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
