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

class SkillsInfo extends ConsumerWidget {
  const SkillsInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _pdfProvider = ref.watch(pdfProvider);

    List<Skill> skillsList = _pdfProvider.skills!;

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
                    'Your Skills',
                    style: headline20.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 3,
                    width: 100,
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
                  key: Key(skillsList[index].skillId),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SkillFullWidget(
                    skill: skillsList[index],
                    onPressed: () {
                      ref.read(pdfProvider.notifier).removeSkill(skillsList[index]);
                    },
                  ),
                );
              },
              itemCount: skillsList.length,
            ),
          ),
          Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SimpleElevatedButton(
                buttonWidth: 200,
                buttonHeight: 40,
                onPressed: () {
                  ref.read(pdfProvider.notifier).addSkill(Skill.createEmpty());
                },
                text: 'Add Skill +'),
          )
          ),
        ],
      ),
    );
  }
}

class SkillFullWidget extends ConsumerStatefulWidget {
  const SkillFullWidget({
    Key? key,
    required this.skill,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Skill skill;

  @override
  _SectionFullWidgetState createState() => _SectionFullWidgetState();
}

class _SectionFullWidgetState extends ConsumerState<SkillFullWidget> {
  TextEditingController skillNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(skillNameController.text, widget.skill.skillName)) {
          skillNameController.text = widget.skill.skillName ?? "";
        }
      });
    });

    return BorderedExpansionTile(
      title: widget.skill.skillName ?? "Java,C,C++....",
      children: [
        RectBorderFormField(
          textEditingController: skillNameController,
          labelText: 'Skill Name',
          onTextChanged: (val) {
            ref.read(pdfProvider.notifier).editSkill(widget.skill.copyWith(skillName: val));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SimpleOutlinedButton(
              color: Pallete.errorColor,
              buttonWidth: double.infinity,
              onPressed: () => widget.onPressed(),
              text: 'Remove this skill'),
        )
      ],
    );
  }
}
