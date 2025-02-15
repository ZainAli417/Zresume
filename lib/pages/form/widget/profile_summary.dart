import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zresume/global/functions/return_correct_string.dart';
import 'package:zresume/global/models/pdf_model.dart';
import 'package:zresume/global/theme/theme.dart';
import 'package:zresume/global/widgets/textfield.dart';
import 'package:zresume/pages/form/controller/form_controller.dart';

class ProfileSummary extends ConsumerStatefulWidget {
  const ProfileSummary({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileSummaryState createState() => _ProfileSummaryState();
}

class _ProfileSummaryState extends ConsumerState<ProfileSummary> {
  TextEditingController summaryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _pdfProvider = ref.watch(pdfProvider);

    Summary summary = _pdfProvider.resumeSummary!;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(summaryController.text, summary.professionalSummary)) {
          summaryController.text = summary.professionalSummary ?? "";
        }
      });
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
              top: 10,
            ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Profile',
                    style: headline20.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 3,
                    width: 60,
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
            textEditingController: summaryController,
            maxLines: 9,
            maxLength: 500,
            labelText: "Summary",
            hintText: 'eg. I am a motivated IT/CS/SE graduate looking forward...',
            onTextChanged: (val) {
              ref.read(pdfProvider.notifier).editSummary(summary.copyWith(professionalSummary: val));
            },
          ),
        ],
      ),
    );
  }
}
