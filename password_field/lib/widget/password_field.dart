import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  static const _accentColor = Color(0xFF5759C6);
  static const _accentDarkColor = Color(0xFF111727);
  static const _animationDuration = Duration(milliseconds: 200);
  final _key = GlobalKey();
  late FocusNode _focusNode;
  late TextEditingController _textController;
  var _hidePassword = true;
  var _showHiddenUi = false;

  Timer? _timer;

  @override
  void initState() {
    _textController = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textInput = TextField(
      key: _key,
      controller: _textController,
      focusNode: _focusNode,
      style: const TextStyle(
        color: _accentColor,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      obscureText: !_showHiddenUi,
      cursorColor: _accentColor,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        isDense: true,
        hintText: 'Enter password',
        hintStyle: TextStyle(color: Color(0xFF8C8C8C)),
        border: InputBorder.none,
      ),
    );
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Container(
        color: _accentDarkColor,
        height: 56,
        child: LayoutBuilder(builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;
          return Stack(
            alignment: Alignment.centerRight,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    PhosphorIcon(
                      PhosphorIcons.fill.lock,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 16),
                    if (!_showHiddenUi) ...[
                      Expanded(
                        child: textInput,
                      ),
                    ] else ...[
                      const Spacer(),
                    ],
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: _animationDuration,
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(right: _hidePassword ? 12 : 0),
                width: _hidePassword ? 32 : maxWidth,
                height: _hidePassword ? 32 : maxHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(_hidePassword ? 16 : 8),
                ),
                child: AnimatedOpacity(
                  opacity: _showHiddenUi ? 1 : 0,
                  duration: _animationDuration,
                  child: Row(
                    children: [
                      if (_showHiddenUi) ...[
                        const SizedBox(width: 16),
                        PhosphorIcon(
                          PhosphorIcons.fill.lock,
                          color: _accentDarkColor,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: textInput,
                        ),
                        const SizedBox(width: 48),
                      ],
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: _onTap,
                  child: PhosphorIcon(
                    _hidePassword ? PhosphorIcons.fill.eyeSlash : PhosphorIcons.fill.eye,
                    color: _accentColor,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void _onTap() {
    _timer?.cancel();
    setState(() {
      _showHiddenUi = false;
      _hidePassword = !_hidePassword;
    });
    if (!_hidePassword) {
      _timer = Timer(_animationDuration, () {
        setState(() => _showHiddenUi = true);
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (!mounted) return;
          _focusNode.requestFocus();
        });
      });
    }
  }
}
