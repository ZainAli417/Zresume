import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zresume/global/functions/return_correct_string.dart';
import 'package:zresume/global/models/pdf_model.dart';
import 'package:zresume/global/theme/pallete.dart';
import 'package:zresume/global/theme/theme.dart';
import 'package:zresume/global/widgets/buttons.dart';
import 'package:zresume/global/widgets/expansion.dart';
import 'package:zresume/global/widgets/textfield.dart';
import 'package:zresume/pages/form/controller/form_controller.dart';

class LanguagesInfo extends ConsumerWidget {
  const LanguagesInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _pdfProvider = ref.watch(pdfProvider);

    List<Skill> languagesList = _pdfProvider.languages!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: 10,
            ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Speaking',
                    style: headline20.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 3,
                    width: 80,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  key: Key(languagesList[index].skillId),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: LanguageFullWidget(
                    language: languagesList[index],
                    onPressed: () {
                      ref.read(pdfProvider.notifier).removeLanguage(languagesList[index]);
                    },
                  ),
                );
              },
              itemCount: languagesList.length,
            ),
          ),
          Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SimpleElevatedButton(
                buttonWidth: 200,
                buttonHeight: 40,
                onPressed: () {
                  ref.read(pdfProvider.notifier).addLanguage(Skill.createEmpty());
                },
                text: 'Add Language +'),
          )
          ),
        ],
      ),
    );
  }
}

class LanguageFullWidget extends ConsumerStatefulWidget {
  const LanguageFullWidget({
    Key? key,
    required this.language,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Skill language;

  @override
  _SectionFullWidgetState createState() => _SectionFullWidgetState();
}

class _SectionFullWidgetState extends ConsumerState<LanguageFullWidget> {
  TextEditingController languageNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(languageNameController.text, widget.language.skillName)) {
          languageNameController.text = widget.language.skillName ?? "";
        }
      });
    });

    return BorderedExpansionTile(
      title: widget.language.skillName ?? "English,Urdu....",
      children: [
        RectBorderFormField(
          textEditingController: languageNameController,
          labelText: 'Language',
          onTextChanged: (val) {
            ref.read(pdfProvider.notifier).editLanguage(widget.language.copyWith(skillName: val));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SimpleOutlinedButton(
              color: Pallete.errorColor,
              buttonWidth: double.infinity,
              onPressed: () => widget.onPressed(),
              text: 'Remove this language'),
        )
      ],
    );
  }
}
