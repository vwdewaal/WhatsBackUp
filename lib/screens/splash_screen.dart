import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    required this.onFinished,
  });

  final VoidCallback onFinished;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _words = <String>[
    'Chat',
    'Backup',
    'Enjoy',
    'Lock',
    'Archive',
  ];
  int _index = 0;
  bool _showFinal = false;
  bool _pulseFinal = false;
  Timer? _timer;

  late final AnimationController _glowController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 850), _tick);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _glowController.dispose();
    super.dispose();
  }

  void _tick(Timer timer) {
    if (!mounted) {
      return;
    }
    if (_index < _words.length - 1) {
      setState(() {
        _index += 1;
      });
      return;
    }
    timer.cancel();
    setState(() {
      _showFinal = true;
      _pulseFinal = false;
    });
    Future<void>.delayed(const Duration(milliseconds: 200), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _pulseFinal = true;
      });
      Future<void>.delayed(const Duration(milliseconds: 700), () {
        if (!mounted) {
          return;
        }
        setState(() {
          _pulseFinal = false;
        });
        Future<void>.delayed(const Duration(milliseconds: 200), () {
          if (!mounted) {
            return;
          }
          setState(() {
            _pulseFinal = true;
          });
          Future<void>.delayed(const Duration(milliseconds: 700), () {
            if (!mounted) {
              return;
            }
            setState(() {
              _pulseFinal = false;
            });
          });
        });
      });
    });
    Future<void>.delayed(const Duration(milliseconds: 2200), () {
      if (mounted) {
        widget.onFinished();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF2EFF7B);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: widget.onFinished,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (Widget child, Animation<double> anim) {
                final Animation<double> scale = _showFinal && _pulseFinal
                    ? TweenSequence<double>(<TweenSequenceItem<double>>[
                        TweenSequenceItem<double>(
                          tween: Tween<double>(begin: 0.9, end: 1.08)
                              .chain(CurveTween(curve: Curves.easeOut)),
                          weight: 60,
                        ),
                        TweenSequenceItem<double>(
                          tween: Tween<double>(begin: 1.08, end: 1)
                              .chain(CurveTween(curve: Curves.easeIn)),
                          weight: 40,
                        ),
                      ]).animate(anim)
                    : Tween<double>(begin: 0.95, end: 1).animate(anim);
                return FadeTransition(
                  opacity: anim,
                  child: ScaleTransition(
                    scale: scale,
                    child: child,
                  ),
                );
              },
              child: _showFinal
                  ? AnimatedBuilder(
                      animation: _glowController,
                      builder: (BuildContext context, _) {
                        final double glow = 8 + (6 * _glowController.value);
                        return Column(
                          key: const ValueKey<String>('final'),
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'WhatsBackUp',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                                color: green,
                                letterSpacing: 1.2,
                                shadows: <Shadow>[
                                  Shadow(
                                    color: green.withOpacity(0.7),
                                    blurRadius: glow,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Image.asset(
                              'assets/icon/whatsbackup_icon.png',
                              width: 96,
                              height: 96,
                            ),
                          ],
                        );
                      },
                    )
                  : Text(
                      _words[_index],
                      key: ValueKey<String>(_words[_index]),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: green,
                        letterSpacing: 1.1,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
