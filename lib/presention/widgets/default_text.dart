part of 'widget_import.dart';

class DefaultText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final double? letterSpace;
  final double? wordSpace;
  final String? fontFamily;
  final TextAlign? align;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

   DefaultText(
      {required this.title,
        this.color,
        this.size,
        this.align,
        this.fontFamily,
        this.decoration,
        this.letterSpace,
        this.wordSpace,
        this.overflow,
        this.fontWeight});

  @override
  Widget build(BuildContext context) {
    // var lang = context.read<LangCubit>().state.locale.languageCode;
    return Text(
      "$title",
      textAlign: align ?? TextAlign.start,
      textScaleFactor: 1,

      style: TextStyle(
          color: color ?? ThemeDataProvider.textLightThemeColor,
          fontSize: size ?? 12,
          letterSpacing: letterSpace,
          wordSpacing: wordSpace,
          decoration: decoration ?? TextDecoration.none,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontFamily: fontFamily ??
              fontFamily ??
              GoogleFonts.poppins().fontFamily),
      overflow: overflow,
    );
  }
}