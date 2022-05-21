import 'package:flutter/material.dart';

class LinearBar extends StatefulWidget {
  final double percent;
  LinearBar({
    Key? key,
    this.percent = 0.0,
  }) : super(key: key) {
    if (percent < 0.0 || percent > 1.0) {
      throw  Exception(
          "Percent value must be a double between 0.0 and 1.0, but it's $percent");
    }
  }

  @override
  _LinearBarState createState() => _LinearBarState();
}

class _LinearBarState extends State<LinearBar>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController? _animationController;
  Animation? _animation;
  double _percent = 0.0;
  final _containerKey = GlobalKey();
  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {

        });
      }
    });
    _animationController = AnimationController(
        vsync: this,
        duration:const Duration(milliseconds: 0));
    _animation = Tween(begin: 0.0, end: widget.percent).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.linear),
    )..addListener(() {
      setState(() {
        _percent = _animation!.value;
      });

    });
    _animationController!.addStatusListener((status) {

    });
    _animationController!.forward();

    super.initState();
  }

  void _checkIfNeedCancelAnimation(LinearBar oldWidget) {
    if ( _animationController != null) {
      _animationController!.stop();
    }
  }

  @override
  void didUpdateWidget(LinearBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent) {
      if (_animationController != null) {
        _animationController!.duration =
        const Duration(milliseconds:500);
        _animation = Tween(
            begin:oldWidget.percent,
            end: widget.percent)
            .animate(
          CurvedAnimation(parent: _animationController!, curve:Curves.linear),
        );
        _animationController!.forward(from: 0.0);
      } else {
        _updateProgress();
      }
    }
    _checkIfNeedCancelAnimation(oldWidget);
  }

  _updateProgress() {
    setState(() {
      _percent = widget.percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var items = List<Widget>.empty(growable: true);

    var containerWidget = Container(
      width:  double.infinity,
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            key: _containerKey,
            painter: _LinearPainter(
              progress: _percent,
              progressColor:const Color(0xFF2FED51),
              backgroundColor: const Color(0xFFE4EFFF),
              barRadius:const Radius.circular(12),
              clipLinearGradient: false,
            ),
            child: Container(),
          ),
        ],
      ),
    );
    items.add(Expanded(
      child: containerWidget,
    ));
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _LinearPainter extends CustomPainter {
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final Radius barRadius;
  final bool clipLinearGradient;
  _LinearPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.barRadius,
    required this.clipLinearGradient,
  }) {
    _paintBackground.color = backgroundColor;

    _paintLine.color = progress.toString() == "0.0"
        ? progressColor.withOpacity(0.0)
        : progressColor;
  }
  @override
  void paint(Canvas canvas, Size size) {
    Path backgroundPath = Path();
    backgroundPath.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), barRadius));
    canvas.drawPath(backgroundPath, _paintBackground);
    canvas.clipPath(backgroundPath);
    final xProgress = size.width * progress;
    Path linePath = Path();
    linePath.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, xProgress, size.height), const Radius.elliptical(12, 0)));
    canvas.drawPath(linePath, _paintLine);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}