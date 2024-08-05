part of 'widget_import.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: ThemeDataProvider.borderColor,
              borderRadius: BorderRadius.circular(22)),
        ),
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width * 46 / 100,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(255, 255, 255, 0), // rgba(255, 255, 255, 0)
                Color(0xFFFF5106), // #FF5106
              ],
              stops: [0.0, 1.0119], // 0% and 101.19%
            ),
          ),
        ),
      ],
    );
  }
}

class GradientBorderCircularProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  final double size;
  final List<Color> colors;
  final double value;

  const GradientBorderCircularProgressIndicator({
    super.key,
    required this.strokeWidth,
    required this.size,
    required this.colors,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    print(value);
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter:
              GradientBorderPainter(strokeWidth: strokeWidth, colors: colors),
        ),
        SizedBox(
          //   width: 10,
          //    height: size - strokeWidth ,
          child: CircularProgressIndicator(
            strokeWidth: 10.0,
            valueColor: const AlwaysStoppedAnimation<Color>(
                ThemeDataProvider.borderColor),
            value: 1-value,
          ),
        ),
      ],
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final List<Color> colors;

  GradientBorderPainter({required this.strokeWidth, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: colors,
        stops: const [
          0.0,
          1.0
        ], // Map the gradient stops to match the CSS percentages
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final double radius = (size.width - strokeWidth) / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
