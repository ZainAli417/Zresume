import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zresume/global/functions/return_correct_string.dart';
import 'package:zresume/global/models/pdf_model.dart';
import 'package:zresume/global/theme/theme.dart';
import 'package:zresume/global/widgets/textfield.dart';
import 'package:zresume/pages/form/controller/form_controller.dart';

class PersonalDetails extends ConsumerStatefulWidget {
  const PersonalDetails({
    Key? key,
  }) : super(key: key);

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends ConsumerState<PersonalDetails> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController jobRoleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _pdfProvider = ref.watch(pdfProvider);

    Personal personal = _pdfProvider.resumePersonal!;

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(emailController.text, personal.email)) {
          emailController.text = personal.email ?? "";
        }
        if (checkChangeText(phoneController.text, personal.phoneNumber)) {
          phoneController.text = personal.phoneNumber ?? "";
        }
        if (checkChangeText(firstNameController.text, personal.firstName)) {
          firstNameController.text = personal.firstName ?? "";
        }
        if (checkChangeText(lastNameController.text, personal.lastName)) {
          lastNameController.text = personal.lastName ?? "";
        }
        if (checkChangeText(jobRoleController.text, personal.jobTitle)) {
          jobRoleController.text = personal.jobTitle ?? "";
        }
      });
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Personal Details',
                    style: headline20.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 3,
                    width: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.indigo.withOpacity(0.9),
                          Colors.purple.withOpacity(0.4),
                          Colors.purpleAccent.withOpacity(0.1),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              )

          ),
          RectBorderFormField(
            textEditingController: emailController,
            initialValue: _pdfProvider.resumePersonal!.email,
            labelText: 'Email Address',
            onTextChanged: (val) {
              ref.read(pdfProvider.notifier).editPersonal(personal.copyWith(email: val));
            },
          ),
          Row(
            children: [
              Flexible(
                child: RectBorderFormField(
                  textEditingController: firstNameController,
                  initialValue: returnCorrectStringString(personal.firstName),
                  labelText: 'First Name',
                  onTextChanged: (val) {
                    ref.read(pdfProvider.notifier).editPersonal(personal.copyWith(firstName: val));
                  },
                ),
              ),
              Flexible(
                child: RectBorderFormField(
                  textEditingController: lastNameController,
                  initialValue: returnCorrectStringString(personal.lastName),
                  labelText: 'Last Name',
                  onTextChanged: (val) {
                    ref.read(pdfProvider.notifier).editPersonal(personal.copyWith(lastName: val));
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: RectBorderFormField(
                  textEditingController: jobRoleController,
                  initialValue: returnCorrectStringString(personal.jobTitle),
                  labelText: 'Job Role',
                  hintText: 'eg. Android/Web Developer',
                  onTextChanged: (val) {
                    ref.read(pdfProvider.notifier).editPersonal(personal.copyWith(jobTitle: val));
                  },
                ),
              ),
              Flexible(
                child: RectBorderFormField(
                  textEditingController: phoneController,
                  initialValue: returnCorrectStringString(personal.email),
                  labelText: 'Phone Number',
                  hintText: '+92xxx-xxxxxxx',
                  onTextChanged: (val) {
                    ref.read(pdfProvider.notifier).editPersonal(personal.copyWith(phoneNumber: val));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
