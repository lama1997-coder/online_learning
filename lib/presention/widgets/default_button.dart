part of 'widget_import.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
    final Color? backgroundColor;

  final double? width;
  final Widget? child;
  final double? height;

  final String? title;
  const DefaultButton(
      {super.key, required this.onTap, this.color, this.title, this.width, this.child, this.height, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        minimumSize: Size(
          width ?? MediaQuery.sizeOf(context).width,
          height ?? 44,
        ),
      ),
      child: child ??
          DefaultText(
            title: title ?? "text",
            color: color ?? Colors.white,
          ),
    );

  }
}
