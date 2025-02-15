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

class EducationHistory extends ConsumerWidget {
  const EducationHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _pdfProvider = ref.watch(pdfProvider);

    List<Section> educationList = _pdfProvider.education!;

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
                    'Education Background',
                    style: headline20.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 3,
                    width: 210,
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
                  key: Key(educationList[index].sectionId),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SectionFullWidget(
                    section: educationList[index],
                    onPressed: () {
                      ref.read(pdfProvider.notifier).removeEducationSection(educationList[index]);
                    },
                  ),
                );
              },
              itemCount: educationList.length,
            ),
          ),
          Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SimpleElevatedButton(
                buttonWidth: 200,
                buttonHeight: 40,
                onPressed: () {
                  ref.read(pdfProvider.notifier).addEducationSection(Section.createEmpty());
                },
                text: 'Add Education +'),
          )
          ),
        ],
      ),
    );
  }
}

class SectionFullWidget extends ConsumerStatefulWidget {
  const SectionFullWidget({
    Key? key,
    required this.section,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Section section;

  @override
  _SectionFullWidgetState createState() => _SectionFullWidgetState();
}

class _SectionFullWidgetState extends ConsumerState<SectionFullWidget> {
  TextEditingController jobController = TextEditingController();
  TextEditingController employerController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(jobController.text, widget.section.textOne)) {
          jobController.text = widget.section.textOne ?? "";
        }
        if (checkChangeText(employerController.text, widget.section.textTwo)) {
          employerController.text = widget.section.textTwo ?? "";
        }
        if (checkChangeText(cityController.text, widget.section.textThree)) {
          cityController.text = widget.section.textThree ?? "";
        }
        if (checkChangeText(startDateController.text, widget.section.startDate)) {
          startDateController.text = widget.section.startDate ?? "";
        }
        if (checkChangeText(endDateController.text, widget.section.endDate)) {
          endDateController.text = widget.section.endDate ?? "";
        }
        if (checkChangeText(descriptionController.text, widget.section.description)) {
          descriptionController.text = widget.section.description ?? "";
        }
      });
    });

    return BorderedExpansionTile(
      title: widget.section.textOne ?? "NUST,FAST,ARID,QAU,NUMS.....",
      children: [
        Row(
          children: [
            Flexible(
              child: RectBorderFormField(
                textEditingController: jobController,
                labelText: 'School/University',
                onTextChanged: (val) {
                  ref.read(pdfProvider.notifier).editEducationSection(widget.section.copyWith(textOne: val));
                },
              ),
            ),
            Flexible(
              child: RectBorderFormField(
                textEditingController: employerController,
                labelText: 'Board/Degree',
                onTextChanged: (val) {
                  ref.read(pdfProvider.notifier).editEducationSection(widget.section.copyWith(textTwo: val));
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: RectBorderFormField(
                textEditingController: startDateController,
                labelText: 'Start Date',
                hintText: 'dd/mm/yyyy',
                onTextChanged: (val) {
                  ref.read(pdfProvider.notifier).editEducationSection(widget.section.copyWith(startDate: val));
                },
              ),
            ),
            Flexible(
              child: RectBorderFormField(
                textEditingController: endDateController,
                labelText: 'End Date',
                hintText: 'dd/mm/yyyy',
                onTextChanged: (val) {
                  ref.read(pdfProvider.notifier).editEducationSection(widget.section.copyWith(endDate: val));
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: RectBorderFormField(
                textEditingController: cityController,
                labelText: 'City',
                onTextChanged: (val) {
                  ref.read(pdfProvider.notifier).editEducationSection(widget.section.copyWith(textThree: val));
                },
              ),
            ),
          ],
        ),
        RectBorderFormField(
          maxLines: 9,
          maxLength: 500,
          labelText: "Description",
          textEditingController: descriptionController,
          onTextChanged: (val) {
            ref.read(pdfProvider.notifier).editEducationSection(widget.section.copyWith(description: val));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SimpleOutlinedButton(
              color: Pallete.errorColor,
              buttonWidth: double.infinity,
              onPressed: () => widget.onPressed(),
              text: 'Remove Education'),
        )
      ],
    );
  }
}
