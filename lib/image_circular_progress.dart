import 'package:flutter/material.dart';

/// A custom widget that shows a circular progress indicator with a centered image.
///
/// Um widget personalizado que exibe um indicador de progresso circular com uma imagem central.
class ImageCircularProgress extends StatefulWidget {
  /// Progress value from 0.0 to 1.0. If null, an indeterminate indicator is shown.
  ///
  /// Valor do progresso entre 0.0 e 1.0. Se nulo, será exibido como indeterminado.
  final double? value;

  /// Total size of the widget. Maximum allowed: [maxSize].
  ///
  /// Tamanho total do widget. Máximo permitido: [maxSize].
  final double size;

  /// Thickness of the indicator stroke.
  ///
  /// Espessura da borda do indicador.
  final double strokeWidth;

  /// Background color of the indicator's track.
  ///
  /// Cor de fundo da trilha do indicador.
  final Color backgroundColor;

  /// Progress color.
  ///
  /// Cor do progresso.
  final Color color;

  /// Image displayed at the center of the indicator.
  ///
  /// Imagem central exibida dentro do indicador.
  final Widget centerImage;

  /// Accessibility label.
  ///
  /// Rótulo de acessibilidade.
  final String? semanticsLabel;

  /// Accessibility value.
  ///
  /// Valor de acessibilidade.
  final String? semanticsValue;

  /// If true, the center image will pulse with opacity.
  ///
  /// Se verdadeiro, a imagem central pulsa em opacidade.
  final bool pulseOpacity;

  /// Maximum allowed size for the indicator.
  ///
  /// Tamanho máximo permitido para o indicador.
  static const double maxSize = 200;

  /// Constructor for [ImageCircularProgress].
  ///
  /// Construtor do [ImageCircularProgress].
  const ImageCircularProgress({
    super.key,
    this.value,
    this.size = 64.0,
    this.strokeWidth = 4.0,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.color = Colors.blue,
    required this.centerImage,
    this.semanticsLabel,
    this.semanticsValue,
    this.pulseOpacity = false,
  });

  @override
  State<ImageCircularProgress> createState() => _ImageCircularProgressState();
}

/// Internal state class for [ImageCircularProgress].
///
/// Classe interna de estado para o [ImageCircularProgress].
class _ImageCircularProgressState extends State<ImageCircularProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeController;
  Animation<double>? _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initializes pulse animation if enabled.
    // Inicializa a animação de pulsação, se necessário.
    if (widget.pulseOpacity) {
      _fadeController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
      )..repeat(reverse: true);

      _fadeAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(
        CurvedAnimation(parent: _fadeController!, curve: Curves.easeInOut),
      );
    }
  }

  @override
  void dispose() {
    // Releases animation resources when the widget is destroyed.
    // Libera recursos da animação ao destruir o widget.
    _fadeController?.dispose();
    super.dispose();
  }

  /// Checks whether the given value is valid (between 0.0 and 1.0).
  ///
  /// Verifica se o valor fornecido é válido (entre 0.0 e 1.0).
  bool get _isValidValue {
    final v = widget.value;
    return v != null && v >= 0.0 && v <= 1.0;
  }

  @override
  Widget build(BuildContext context) {
    // Clamp size to avoid layout overflow or distortion.
    // Limita o tamanho ao máximo definido para manter a UI consistente.
    final double size = widget.size.clamp(0.0, ImageCircularProgress.maxSize);

    // Sets up the center content with or without animation.
    // Define o conteúdo central com animação (se ativada).
    final Widget centerContent = (widget.pulseOpacity && _fadeAnimation != null)
        ? FadeTransition(
            opacity: _fadeAnimation!,
            child: SizedBox(
              width: size * 0.8,
              height: size * 0.8,
              child: FittedBox(
                fit: BoxFit.contain,
                child: widget.centerImage,
              ),
            ),
          )
        : SizedBox(
            width: size * 0.8,
            height: size * 0.8,
            child: FittedBox(fit: BoxFit.contain, child: widget.centerImage),
          );

    return Semantics(
      label: widget.semanticsLabel,
      value: widget.semanticsValue,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: CircularProgressIndicator(
                value: _isValidValue ? widget.value : null,
                strokeWidth: widget.strokeWidth,
                backgroundColor: widget.backgroundColor,
                valueColor: AlwaysStoppedAnimation(widget.color),
              ),
            ),
            centerContent,
          ],
        ),
      ),
    );
  }
}
