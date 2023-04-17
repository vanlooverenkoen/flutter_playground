import 'package:emotional_switch/style/colors.dart';
import 'package:emotional_switch/style/duration.dart';
import 'package:emotional_switch/widget/emotional_switch_face.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmotionalSwitch extends StatefulWidget {
  final bool isHappy;
  final ValueChanged<bool> onChanged;

  const EmotionalSwitch({
    required this.isHappy,
    required this.onChanged,
    super.key,
  });

  @override
  State<EmotionalSwitch> createState() => _EmotionalSwitchState();
}

class _EmotionalSwitchState extends State<EmotionalSwitch> {
  late bool _isHappyTmp;

  @override
  void initState() {
    _isHappyTmp = widget.isHappy;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: SizedBox(
        width: 156,
        height: 64,
        child: Stack(
          children: [
            Center(
              child: AnimatedContainer(
                height: 32,
                width: 96,
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: widget.isHappy ? ThemeColors.colorHappyTrack : ThemeColors.colorNotHappyTrack,
                  borderRadius: BorderRadius.circular(8),
                ),
                duration: ThemeDuration.short,
              ),
            ),
            AnimatedAlign(
              alignment: _isHappyTmp ? Alignment.centerRight : Alignment.centerLeft,
              curve: Curves.elasticOut,
              duration: ThemeDuration.medium,
              child: EmotionalSwitchFace(
                isHappy: widget.isHappy,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTap() async {
    setState(() => _isHappyTmp = !widget.isHappy);
    await Future<void>.delayed(ThemeDuration.medium);
    widget.onChanged(!widget.isHappy);
  }
}
