import 'package:flutter/material.dart';

class RipplePainter extends CustomPainter {
  final double radius;
  final Color color;

  RipplePainter({required this.radius, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(size.center(Offset.zero), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CustomRippleAnimation extends StatefulWidget {
  final Widget child;
  final Function()? onTap;

  const CustomRippleAnimation({super.key, required this.child, this.onTap});

  @override
  State createState() => _CustomRippleAnimationState();
}

class _CustomRippleAnimationState extends State<CustomRippleAnimation>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  static const int numberOfRipples = 3;
  static const double maxRippleRadius = 60.0;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
        numberOfRipples,
        (index) => AnimationController(
            vsync: this, duration: Duration(milliseconds: 800 + index * 200)));
    _animations = _controllers
        .map((controller) =>
            Tween<double>(begin: 0.0, end: maxRippleRadius).animate(controller))
        .toList();
    for (var controller in _controllers) {
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller
              .reset(); // Reset immediately on completion to be ready for the next tap
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _startRippleEffect() {
    Future.forEach(_controllers, (AnimationController controller) async {
      await Future.delayed(const Duration(
          milliseconds: 100)); // Delay between starting each ring
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _startRippleEffect();
        Future.delayed(const Duration(milliseconds: 600), () {
          widget.onTap?.call();
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ..._animations.map((animation) {
            return AnimatedBuilder(
              animation: animation,
              builder: (_, child) {
                return CustomPaint(
                  painter: RipplePainter(
                      radius: animation.value,
                      color: Colors.white
                          .withOpacity(1 - animation.value / maxRippleRadius)),
                  child: Container(),
                );
              },
            );
          }),
          widget.child,
        ],
      ),
    );
  }
}
