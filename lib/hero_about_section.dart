import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class HeroAboutSection extends StatefulWidget {
  const HeroAboutSection({super.key});

  @override
  State<HeroAboutSection> createState() => _HeroAboutSectionState();
}

class _HeroAboutSectionState extends State<HeroAboutSection>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeHeading;
  late Animation<Offset> _slideHeading;
  late Animation<double> _fadeNameRow;
  late Animation<Offset> _slideNameRow;
  late Animation<double> _fadeAboutRow;
  late Animation<Offset> _slideAboutRow;
  double _buttonScale = 1.0;
  late AnimationController _shineController;
  late Animation<double> _shineAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeHeading = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );
    _slideHeading = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );
    _fadeNameRow = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
      ),
    );
    _slideNameRow = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
      ),
    );
    _fadeAboutRow = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );
    _slideAboutRow = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );
    _shineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);
    _shineAnimation = Tween<double>(
      begin: -1,
      end: 2,
    ).animate(CurvedAnimation(parent: _shineController, curve: Curves.linear));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _shineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;
    // Set a minimum height for the hero+about section to make the background image more prominent
    final double minHeight = isMobile ? 700 : 900;
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeight),
      decoration: BoxDecoration(
        color: const Color(0xFF081B28),
        image: DecorationImage(
          image: AssetImage(
            'assets/images/top-background.png',
          ), // Place your custom background image here
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          // Optionally, you can add a scale or repeat if needed
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 0,
        vertical: isMobile ? 32 : 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              AnimatedBuilder(
                animation: _controller,
                builder:
                    (context, child) => AnimatedOpacity(
                      opacity: _fadeHeading.value,
                      duration: Duration.zero,
                      child: AnimatedSlide(
                        offset: _slideHeading.value,
                        duration: Duration.zero,
                        child: child,
                      ),
                    ),
                child: GlitchTypingText(
                  text:
                      'Building super useful\nandroid applications to live life.',
                  style: const TextStyle(
                    fontFamily: 'Ravenna Serial ExtraBold',
                    fontWeight: FontWeight.w900,
                    fontSize: 70,
                    color: Color(0xFFC6FCA6),
                    height: 1.16,
                  ),
                  duration: const Duration(milliseconds: 38),
                  glitchFrames: [8, 18, 28, 38, 48, 58],
                  glitchColors: [Color(0xFFC6FCA6), Color(0xFFE5E7E7)],
                  textAlign: TextAlign.left,
                  glitchIndexes: [22, 35, 44, 55],
                ),
              ),
              const SizedBox(height: 32),
              // Name and button row
              AnimatedBuilder(
                animation: _controller,
                builder:
                    (context, child) => AnimatedOpacity(
                      opacity: _fadeNameRow.value,
                      duration: Duration.zero,
                      child: AnimatedSlide(
                        offset: _slideNameRow.value,
                        duration: Duration.zero,
                        child: child,
                      ),
                    ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Hi , myself ',
                            style: TextStyle(
                              fontFamily: 'Ravenna Serial ExtraBold',
                              fontWeight: FontWeight.w800,
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'Siddhes Das',
                            style: TextStyle(
                              fontFamily: 'Ravenna Serial ExtraBold',
                              fontWeight: FontWeight.w800,
                              fontSize: 40,
                              color: Color(0xFFC6FCA6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 464),
                    AnimatedBuilder(
                      animation: _shineAnimation,
                      builder: (context, child) {
                        return ShaderMask(
                          shaderCallback: (Rect bounds) {
                            // Wide, always-visible shimmer gradient
                            return LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.white.withOpacity(0.18),
                                Colors.white.withOpacity(0.38),
                                Colors.white.withOpacity(0.18),
                              ],
                              stops: [
                                (_shineAnimation.value - 0.5).clamp(0.0, 1.0),
                                _shineAnimation.value.clamp(0.0, 1.0),
                                (_shineAnimation.value + 0.5).clamp(0.0, 1.0),
                              ],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcATop,
                          child: child,
                        );
                      },
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _buttonScale = 1.08),
                        onExit: (_) => setState(() => _buttonScale = 1.0),
                        child: AnimatedScale(
                          scale: _buttonScale,
                          duration: const Duration(milliseconds: 180),
                          child: SizedBox(
                            height: 40,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Download resume',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // About row
              AnimatedBuilder(
                animation: _controller,
                builder:
                    (context, child) => AnimatedOpacity(
                      opacity: _fadeAboutRow.value,
                      duration: Duration.zero,
                      child: AnimatedSlide(
                        offset: _slideAboutRow.value,
                        duration: Duration.zero,
                        child: child,
                      ),
                    ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        'assets/images/avatar.png',
                      ), // Replace with your avatar asset
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(width: 32),
                    // About text and badge
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I am building ',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.white,
                                    height: 1.5,
                                  ),
                                ),
                                TextSpan(
                                  text: 'super useful android applications',
                                  style: TextStyle(
                                    fontFamily: 'Ravenna Serial ExtraBold',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Color(0xFFC6FCA6),
                                    height: 1.5,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' besides holding a strong interests towards designing and developing cool and ',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.white,
                                    height: 1.5,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'custom UI /UX and attractive user interfaces',
                                  style: TextStyle(
                                    fontFamily: 'Ravenna Serial ExtraBold',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Color(0xFFC6FCA6),
                                    height: 1.5,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '. Focused towards building products, also a',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.white,
                                    height: 1.5,
                                  ),
                                ),
                                TextSpan(
                                  text: ' FIDE rated chess player',
                                  style: TextStyle(
                                    fontFamily: 'Ravenna Serial ExtraBold',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: const Color.fromARGB(
                                      255,
                                      0,
                                      255,
                                      170,
                                    ),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Currently Learning badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFC6FCA6),
                                  size: 22,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Currently Learning',
                                      style: TextStyle(
                                        fontFamily: 'Ravenna Serial ExtraBold',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'Getting detailed insights on flutter and dart',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GlitchTypingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final List<int> glitchFrames; // e.g. [2, 5, 8, 13]
  final List<Color> glitchColors;
  final TextAlign textAlign;
  final List<int> glitchIndexes;

  const GlitchTypingText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 60),
    this.glitchFrames = const [2, 5, 8, 13],
    this.glitchColors = const [Color(0xFFC6FCA6), Color(0xFFE5E7E7)],
    this.textAlign = TextAlign.left,
    this.glitchIndexes = const [],
  });

  @override
  State<GlitchTypingText> createState() => _GlitchTypingTextState();
}

class _GlitchTypingTextState extends State<GlitchTypingText> {
  int _currentIndex = 0;
  String _displayed = '';
  Timer? _timer;
  bool _glitch = false;
  int _glitchFrame = 0;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.duration, (timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _currentIndex++;
          _displayed = widget.text.substring(0, _currentIndex);
          // Randomly trigger glitch
          if (widget.glitchFrames.contains(_currentIndex) ||
              widget.glitchIndexes.contains(_currentIndex)) {
            _glitch = true;
            _glitchFrame = 0;
          }
        });
      } else if (_glitch) {
        // End glitch after a few frames
        if (_glitchFrame > 2) {
          setState(() {
            _glitch = false;
          });
        } else {
          setState(() {
            _glitchFrame++;
          });
        }
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_glitch && _displayed.isNotEmpty) {
      // Glitch: randomly replace a character or color
      int glitchCharIndex = _random.nextInt(_displayed.length);
      String glitchChar = String.fromCharCode(_random.nextInt(26) + 65);
      String glitched =
          _displayed.substring(0, glitchCharIndex) +
          glitchChar +
          _displayed.substring(glitchCharIndex + 1);
      Color color =
          widget.glitchColors[_random.nextInt(widget.glitchColors.length)];
      return Text(
        glitched,
        style: widget.style?.copyWith(color: color) ?? TextStyle(color: color),
        textAlign: widget.textAlign,
      );
    }
    return Text(_displayed, style: widget.style, textAlign: widget.textAlign);
  }
}
