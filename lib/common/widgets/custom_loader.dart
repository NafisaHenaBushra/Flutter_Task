import 'package:flutter_task/utils/constants/imports.dart';

class ColorLoader extends StatefulWidget {
  final List<Color> colors;
  final Duration duration;

  const ColorLoader({Key? key, required this.colors, required this.duration}) : super(key: key);
  @override
  ColorLoaderState createState() => ColorLoaderState();
}

class ColorLoaderState extends State<ColorLoader> with SingleTickerProviderStateMixin {
  late Timer timer;

  List<ColorTween> tweenAnimations = [];
  int tweenIndex = 0;

  late AnimationController controller;
  List<Animation<Color?>> colorAnimations = [];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    for (int i = 0; i < widget.colors.length - 1; i++) {
      tweenAnimations.add(ColorTween(begin: widget.colors[i], end: widget.colors[i + 1]));
    }

    tweenAnimations.add(ColorTween(begin: widget.colors[widget.colors.length - 1], end: widget.colors[0]));

    for (int i = 0; i < widget.colors.length; i++) {
      Animation<Color?> animation = tweenAnimations[i]
          .animate(CurvedAnimation(parent: controller, curve: Interval((1 / widget.colors.length) * (i + 1) - 0.05, (1 / widget.colors.length) * (i + 1), curve: Curves.linear)));

      colorAnimations.add(animation);
    }

    tweenIndex = 0;

    timer = Timer.periodic(widget.duration, (Timer t) {
      setState(() {
        tweenIndex = (tweenIndex + 1) % widget.colors.length;
      });
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 5.0,
        valueColor: colorAnimations[tweenIndex],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    controller.dispose();
    super.dispose();
  }
}
