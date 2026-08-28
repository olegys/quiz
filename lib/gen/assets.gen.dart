/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Alexandria-Bold.ttf
  String get alexandriaBold => 'assets/fonts/Alexandria-Bold.ttf';

  /// File path: assets/fonts/Alexandria-Light.ttf
  String get alexandriaLight => 'assets/fonts/Alexandria-Light.ttf';

  /// File path: assets/fonts/Alexandria-Medium.ttf
  String get alexandriaMedium => 'assets/fonts/Alexandria-Medium.ttf';

  /// File path: assets/fonts/Alexandria-Regular.ttf
  String get alexandriaRegular => 'assets/fonts/Alexandria-Regular.ttf';

  /// File path: assets/fonts/Noplato-Mono.ttf
  String get noplatoMono => 'assets/fonts/Noplato-Mono.ttf';

  /// List of all assets
  List<String> get values => [
        alexandriaBold,
        alexandriaLight,
        alexandriaMedium,
        alexandriaRegular,
        noplatoMono
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/check.svg
  SvgGenImage get check => const SvgGenImage('assets/icons/check.svg');

  /// File path: assets/icons/check_rounded.svg
  SvgGenImage get checkRounded =>
      const SvgGenImage('assets/icons/check_rounded.svg');

  /// File path: assets/icons/chevron_double_right.svg
  SvgGenImage get chevronDoubleRight =>
      const SvgGenImage('assets/icons/chevron_double_right.svg');

  /// File path: assets/icons/chevron_down.svg
  SvgGenImage get chevronDown =>
      const SvgGenImage('assets/icons/chevron_down.svg');

  /// File path: assets/icons/chevron_left.svg
  SvgGenImage get chevronLeft =>
      const SvgGenImage('assets/icons/chevron_left.svg');

  /// File path: assets/icons/chevron_right.svg
  SvgGenImage get chevronRight =>
      const SvgGenImage('assets/icons/chevron_right.svg');

  /// File path: assets/icons/chevron_right_top.svg
  SvgGenImage get chevronRightTop =>
      const SvgGenImage('assets/icons/chevron_right_top.svg');

  /// File path: assets/icons/chevron_up.svg
  SvgGenImage get chevronUp => const SvgGenImage('assets/icons/chevron_up.svg');

  /// File path: assets/icons/close.svg
  SvgGenImage get close => const SvgGenImage('assets/icons/close.svg');

  /// File path: assets/icons/correct.svg
  SvgGenImage get correct => const SvgGenImage('assets/icons/correct.svg');

  /// File path: assets/icons/exit.svg
  SvgGenImage get exit => const SvgGenImage('assets/icons/exit.svg');

  /// File path: assets/icons/finished.svg
  SvgGenImage get finished => const SvgGenImage('assets/icons/finished.svg');

  /// File path: assets/icons/incorrect.svg
  SvgGenImage get incorrect => const SvgGenImage('assets/icons/incorrect.svg');

  /// File path: assets/icons/lock.svg
  SvgGenImage get lock => const SvgGenImage('assets/icons/lock.svg');

  /// File path: assets/icons/next.svg
  SvgGenImage get next => const SvgGenImage('assets/icons/next.svg');

  /// File path: assets/icons/placeholder.svg
  SvgGenImage get placeholder =>
      const SvgGenImage('assets/icons/placeholder.svg');

  /// File path: assets/icons/restart.svg
  SvgGenImage get restart => const SvgGenImage('assets/icons/restart.svg');

  /// File path: assets/icons/settings.svg
  SvgGenImage get settings => const SvgGenImage('assets/icons/settings.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        check,
        checkRounded,
        chevronDoubleRight,
        chevronDown,
        chevronLeft,
        chevronRight,
        chevronRightTop,
        chevronUp,
        close,
        correct,
        exit,
        finished,
        incorrect,
        lock,
        next,
        placeholder,
        restart,
        settings
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/blur.png
  AssetGenImage get blur => const AssetGenImage('assets/images/blur.png');

  /// File path: assets/images/correct.png
  AssetGenImage get correct => const AssetGenImage('assets/images/correct.png');

  /// File path: assets/images/finished.png
  AssetGenImage get finished =>
      const AssetGenImage('assets/images/finished.png');

  /// File path: assets/images/game.png
  AssetGenImage get game => const AssetGenImage('assets/images/game.png');

  /// File path: assets/images/incorrect.png
  AssetGenImage get incorrect =>
      const AssetGenImage('assets/images/incorrect.png');

  /// File path: assets/images/start.png
  AssetGenImage get start => const AssetGenImage('assets/images/start.png');

  /// File path: assets/images/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/images/welcome.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [blur, correct, finished, game, incorrect, start, welcome];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/loader_quiz.json
  String get loaderQuiz => 'assets/lottie/loader_quiz.json';

  /// File path: assets/lottie/rotate_phone.json
  String get rotatePhone => 'assets/lottie/rotate_phone.json';

  /// List of all assets
  List<String> get values => [loaderQuiz, rotatePhone];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
