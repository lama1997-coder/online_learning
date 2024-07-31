part of 'widget_import.dart';


class CustomIconButton extends StatelessWidget {
  const CustomIconButton.gradient(
      {super.key,
      required this.onTap,
      this.width,
      this.height,
      required this.child,
      this.border})
      : gradient = const LinearGradient(
          colors: [
            Color(0xff4776E6),
            Color(0xff8E54E9),
          ],
        );

  const CustomIconButton.noGradient(
      {super.key,
      required this.onTap,
      this.width,
      this.height,
      required this.child,
      this.border})
      : gradient = null;

  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final Widget? child;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        height: height ?? 40,
        width: width ?? 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: border ?? const Border(),
          gradient: gradient,
        ),
        child: child,
      ),
    );
  }
}
