// ignore_for_file: prefer_initializing_formals

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    Key? key,
    required this.height,
    required this.width,
    this.alignment,
    this.transform,
    this.transformAlignment,
    this.padding,
    this.margin,
    this.color,
    this.gradient,
    BorderRadius? borderRadius,
    double? borderWidth,
    this.borderColor,
    this.borderGradient,
    double? blur,
    bool? isFrostedGlass,
    double? frostedOpacity,
    double? elevation,
    Color? shadowColor,
    BoxShape shape = BoxShape.rectangle,
    this.child,
  })  : borderWidth = borderWidth ?? kBorderWidth,
        blur = blur ?? kBlur,
        isFrostedGlass = isFrostedGlass ?? kIsFrosted,
        frostedOpacity = frostedOpacity ?? kFrostedOpacity,
        elevation = elevation ?? kElevation,
        shadowColor = shadowColor ?? kShadowColor,
        shape = shape,
        borderRadius = shape == BoxShape.rectangle
            ? (borderRadius ?? kBorderRadius)
            : null,
        assert(color != null || gradient != null,
            'Both color and gradient cannot be null\n'),
        assert(borderColor != null || borderGradient != null,
            'Both borderColor and borderGradient cannot be null\n'),
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]\n'),
        assert(kIsWeb != true || borderColor != null,
            'borderColor cannot be null when runing on the Web\n'),
        super(key: key);

  const GlassContainer.clearGlass({
    Key? key,
    required double height,
    required double width,
    AlignmentGeometry? alignment,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Gradient? gradient,
    Color? color,
    BorderRadius? borderRadius,
    double? borderWidth,
    Gradient? borderGradient,
    Color? borderColor,
    double? blur,
    double? elevation,
    Color? shadowColor,
    BoxShape shape = BoxShape.rectangle,
    Widget? child,
  })  : height = height,
        width = width,
        isFrostedGlass = false,
        frostedOpacity = 0.0,
        blur = blur ?? kBlur,
        gradient = gradient ?? (color == null ? kGradientFill : null),
        color = color,
        borderGradient = borderGradient ??
            (borderColor == null ? kBorderGradientFill : null),
        borderColor = borderColor,
        borderRadius = shape == BoxShape.rectangle
            ? (borderRadius ?? kBorderRadius)
            : null,
        borderWidth = borderWidth ?? kBorderWidth,
        elevation = elevation ?? kElevation,
        margin = margin,
        padding = padding,
        shadowColor = shadowColor ?? kShadowColor,
        shape = shape,
        transform = transform,
        transformAlignment = transformAlignment,
        alignment = alignment,
        child = child,
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]\n'),
        assert(kIsWeb != true || borderColor != null,
            'borderColor cannot be null when runing on the Web\n'),
        super(key: key);

  const GlassContainer.frostedGlass({
    Key? key,
    required double height,
    required double width,
    AlignmentGeometry? alignment,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Gradient? gradient,
    Color? color,
    BorderRadius? borderRadius,
    double? borderWidth,
    Gradient? borderGradient,
    Color? borderColor,
    double? blur,
    double? elevation,
    Color? shadowColor,
    BoxShape shape = BoxShape.rectangle,
    double? frostedOpacity,
    Widget? child,
  })  : height = height,
        width = width,
        isFrostedGlass = true,
        frostedOpacity = frostedOpacity ?? kFrostedOpacity,
        blur = blur ?? kBlur,
        gradient = gradient ?? (color == null ? kGradientFill : null),
        color = color,
        borderGradient = borderGradient ??
            (borderColor == null ? kBorderGradientFill : null),
        borderColor = borderColor,
        borderRadius = shape == BoxShape.rectangle
            ? (borderRadius ?? kBorderRadius)
            : null,
        borderWidth = borderWidth ?? kBorderWidth,
        elevation = elevation ?? kElevation,
        margin = margin,
        padding = padding,
        shadowColor = shadowColor ?? kShadowColor,
        shape = shape,
        transform = transform,
        transformAlignment = transformAlignment,
        alignment = alignment,
        child = child,
        assert(shape != BoxShape.circle || borderRadius == null,
            'The [borderRadius] needs to be null if the shape is [BoxShape.circle]\n'),
        assert(kIsWeb != true || borderColor != null,
            'borderColor cannot be null when runing on the Web\n'),
        super(key: key);

  final Widget? child;

  final double height;

  // The width of the GlassContainer
  final double width;

  final Color? color;

  final Gradient? gradient;

  final BorderRadius? borderRadius;

  final double borderWidth;

  final Gradient? borderGradient;

  final Color? borderColor;

  final double blur;

  final bool isFrostedGlass;

  final double frostedOpacity;

  final BoxShape shape;

  final double elevation;

  final Color shadowColor;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final AlignmentGeometry? alignment;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  Widget get _frostedContainer {
    if (!isFrostedGlass || frostedOpacity == 0.0 || kIsWeb) {
      return Container();
    } else {
      return _FrostedWidget(
        frostedOpacity: frostedOpacity,
        height: height,
        width: _isCircle ? height : width,
      );
    }
  }

  BackdropFilter get _backdropFilterContainer {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }

  Border? get _border {
    if (_colorOnlyBorder || kIsWeb) {
      assert(borderColor != null);
      return Border.all(
        color: borderColor!,
        width: borderWidth,
      );
    } else {
      return null;
    }
  }

  bool get _isCircle => shape == BoxShape.circle;
  bool get _colorOnlyBorder => borderGradient == null;

  @override
  Widget build(BuildContext context) {
    Widget? current = child;

    // Enclose the child within a container with padding, alignment and decoration
    current = Container(
      height: height,
      width: _isCircle ? height : width,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: borderRadius,
        border: _border,
        shape: shape,
      ),
      child: current,
    );

    // If the border is gradient border then paint the border according to the shape
    // Incase the app is compiled to run on web then CustomPaint wont work
    if (!_colorOnlyBorder && !kIsWeb) {
      assert(borderGradient != null);
      if (_isCircle) {
        assert(borderRadius == null);
        current = CustomPaint(
          painter: CircleBorderPainter(
            radius: height / 2,
            gradient: borderGradient!,
            strokeWidth: borderWidth,
          ),
          child: current,
        );
      } else {
        assert(borderRadius != null);
        current = CustomPaint(
          painter: RectBorderPainter(
            radius: borderRadius!.topLeft,
            strokeWidth: borderWidth,
            gradient: borderGradient!,
          ),
          child: current,
        );
      }
    }

    // Commbine the backdropFilter, frosted layer, and container into a stack
    current = Stack(
      alignment: Alignment.center,
      children: [_backdropFilterContainer, _frostedContainer, current],
    );

    // Clip the current container depending on the shape
    if (_isCircle) {
      assert(borderRadius == null);
      current = ClipOval(child: current);
    } else {
      assert(borderRadius != null);
      current = ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: current,
      );
    }

    current = PhysicalModel(
      color: Colors.transparent,
      borderRadius: borderRadius,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      child: current,
    );

    current = Container(
      height: height,
      width: _isCircle ? height : width,
      transform: transform,
      transformAlignment: transformAlignment,
      margin: margin,
      child: current,
    );

    return current;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<Matrix4>.has('transform', transform));
    properties.add(DiagnosticsProperty<double>('borderWidth', borderWidth,
        defaultValue: kBorderWidth, ifNull: 'no border width'));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin,
        defaultValue: null));
    properties.add(DiagnosticsProperty<bool>('isfrostedGlass', isFrostedGlass,
        defaultValue: kIsFrosted, ifNull: '<indeterminate>'));
    properties.add(PercentProperty('frostedOpacity', frostedOpacity,
        showName: true, ifNull: '<indeterminate>'));
    properties.add(EnumProperty<BoxShape>('shape', shape,
        defaultValue: BoxShape.rectangle, level: DiagnosticLevel.info));
    properties.add(DiagnosticsProperty<double>('elevation', elevation,
        defaultValue: kElevation));
    properties
        .add(DiagnosticsProperty<double>('blur', blur, defaultValue: kBlur));
    properties
        .add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius));
    properties.add(DiagnosticsProperty<AlignmentGeometry>(
        'alignment', alignment,
        defaultValue: null, showName: false));
    properties.add(
        ColorProperty('shadowColor', shadowColor, defaultValue: kShadowColor));

    if (gradient != null) {
      properties.add(DiagnosticsProperty<Gradient>('bg', gradient));
    } else {
      properties.add(ColorProperty('bg', color));
    }

    if (borderGradient != null) {
      properties
          .add(DiagnosticsProperty<Gradient>('borderGradient', borderGradient));
    } else {
      properties.add(ColorProperty('borderColor', borderColor));
    }
  }
}

class _FrostedWidget extends StatelessWidget {
  const _FrostedWidget({
    Key? key,
    required this.frostedOpacity,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double frostedOpacity;

  final double height;

  final double width;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: frostedOpacity,
      child: Image(
        image: ResizeImage(
          const AssetImage(kNoiseImage),
          height: height.toInt(),
          width: width.toInt(),
        ),
        excludeFromSemantics: true,
        fit: BoxFit.cover,
        color: kFrostBlendColor,
        colorBlendMode: kFrostBlendMode,
      ),
    );
  }
}

const double kBlur = 12.0;
const BorderRadius kBorderRadius = BorderRadius.zero;
const double kBorderWidth = 1.0;
const bool kIsFrosted = false;
const double kFrostedOpacity = 0.10;
const double kElevation = 1.0;
const Color kShadowColor = Color(0x33000000);
const String kNoiseImage = 'assets/png/noise.png';
const Color kFrostBlendColor = Color(0xFFFFFFFF);
const BlendMode kFrostBlendMode = BlendMode.difference;
const LinearGradient kGradientFill = LinearGradient(
  colors: [Color(0x66FFFFFF), Color(0x1AFFFFFF)],
  begin: Alignment.topLeft,
  end: Alignment(0.80, 0.80),
);
const LinearGradient kBorderGradientFill = LinearGradient(
  colors: [
    Color(0x99FFFFFF),
    Color(0x1AFFFFFF),
    Color(0x1AF0FFFF),
    Color(0x99F0FFFF)
  ],
  begin: Alignment(0.2, 0.0),
  end: Alignment(1.0, 1.0),
  stops: [0.0, 0.39, 0.40, 1.0],
);

class RectBorderPainter extends CustomPainter {
  RectBorderPainter({
    required this.radius,
    required this.strokeWidth,
    required this.gradient,
  }) : _paint = Paint();

  final Paint _paint;
  final Radius radius;
  final double strokeWidth;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equal to size
    Rect outerRect = Offset.zero & size;
    RRect outerRRect = RRect.fromRectAndRadius(outerRect, radius);

    // create inner rectangle smaller by strokeWidth
    RRect innerRRect = outerRRect.deflate(strokeWidth);

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path outer = Path()..addRRect(outerRRect);
    Path inner = Path()..addRRect(innerRRect);
    Path path = Path.combine(PathOperation.difference, outer, inner);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

class CircleBorderPainter extends CustomPainter {
  CircleBorderPainter({
    required this.radius,
    required this.gradient,
    required this.strokeWidth,
  }) : _paint = Paint();

  final Paint _paint;
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create an outer box enclosing the circel
    Rect rect = Offset.zero & size;

    // create an outer circle enclosing box
    Rect outerCircle = Rect.fromCircle(center: rect.center, radius: radius);

    // create an inner circle enclosing box
    Rect innerCircle = outerCircle.deflate(strokeWidth);

    // apply gradient shader
    _paint.shader = gradient.createShader(outerCircle);

    // create difference between outer and inner paths and draw it
    Path outer = Path()..addOval(outerCircle);
    Path inner = Path()..addOval(innerCircle);
    Path path = Path.combine(PathOperation.difference, outer, inner);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
