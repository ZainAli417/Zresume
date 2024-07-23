import 'package:flutter/material.dart';
import 'package:zresume/global/theme/pallete.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeDta = ThemeData(
  primarySwatch: Colors.indigo,
  primaryColor: Pallete.primaryColor,
//  colorScheme: ColorScheme.fromSwatch().copyWith(primary: Pallete.primaryColor, secondary: Pallete.primaryColor),
 textTheme:textTheme,

);



TextTheme textTheme = TextTheme(
  displayLarge: headline96,
  displayMedium: headline60,
  displaySmall: headline48,
  headlineMedium: headline34,
  headlineSmall: headline24,
  titleLarge: headline20,
  titleMedium: subtitle16,
  titleSmall: subtitle14,
  bodyLarge: bodyText16,
  bodyMedium: bodyText14,
  bodySmall: caption12,
  labelLarge: button14,
  labelSmall: overline10,
);

TextStyle headline96 = GoogleFonts.nunito(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 96,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    letterSpacing: -1.5,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Headline1',
    overflow: TextOverflow.fade,
  ),
);

TextStyle headline60 = GoogleFonts.nunito(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 60,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    letterSpacing: -0.5,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Headline2',
    overflow: TextOverflow.fade,
  ),
);

TextStyle headline48 = GoogleFonts.nunito(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 48,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.0,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Headline3',
    overflow: TextOverflow.fade,
  ),
);

TextStyle headline34 = GoogleFonts.nunito(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 34,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.25,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Headline4',
    overflow: TextOverflow.fade,
  ),
);

TextStyle headline24 = GoogleFonts.nunito(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.0,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Headline5',
    overflow: TextOverflow.fade,
  ),
);

TextStyle headline20 = GoogleFonts.nunito(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.15,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Headline6',
    overflow: TextOverflow.fade,
  ),
);

TextStyle subtitle16 = GoogleFonts.nunito(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.15,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Subtitle1',
    overflow: TextOverflow.fade,
  ),
);

TextStyle subtitle14 = GoogleFonts.nunito(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.1,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Subtitle2',
    overflow: TextOverflow.fade,
  ),
);
TextStyle bodyText16 = GoogleFonts.notoSans(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.5,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Bodytext1',
    overflow: TextOverflow.fade,
  ),
);

TextStyle bodyText14 = GoogleFonts.notoSans(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.25,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Bodytext2',
    overflow: TextOverflow.fade,
  ),
);

TextStyle caption12 = GoogleFonts.notoSans(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.4,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Caption',
    overflow: TextOverflow.fade,
  ),
);

TextStyle button14 = GoogleFonts.notoSans(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.25,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Button',
    overflow: TextOverflow.fade,
  ),
);

TextStyle overline10 = GoogleFonts.notoSans(
  textStyle: const TextStyle(
    inherit: true,
    color: Pallete.textColor,

    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.5,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
    debugLabel: 'Overline',
    overflow: TextOverflow.fade,
  ),
);
