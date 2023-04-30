import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  static const _cursorColor = Color(0xFF3F3F3F);
  static const _backgroundColor = Color(0xFFFFFFFF);
  static const _animationDuration = Duration(milliseconds: 100);

  final _key = GlobalKey();
  late FocusNode _focusNode;
  late TextEditingController _textController;

  Timer? _timer;

  var _showSearchIconHandle = true;
  var _showSearchHandle = true;
  var _showCursor = false;

  @override
  void initState() {
    _textController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChanged);
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: _backgroundColor),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          GestureDetector(
            onTap: _onTap,
            child: Material(
              color: Colors.transparent,
              child: IgnorePointer(
                child: TextField(
                  key: _key,
                  controller: _textController,
                  focusNode: _focusNode,
                  style: const TextStyle(
                    color: _cursorColor,
                  ),
                  cursorColor: _cursorColor,
                  onChanged: _onChanged,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Opacity(
            opacity: _focusNode.hasFocus || _textController.text.isNotEmpty ? 0 : 1,
            child: SizedBox(
              width: 20,
              height: 20,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  if (_showSearchHandle) ...[
                    AnimatedPositioned(
                      right: _showSearchIconHandle ? 2 : 6,
                      bottom: _showSearchIconHandle ? 0 : 4,
                      duration: _animationDuration,
                      curve: Curves.easeInOut,
                      child: Transform.rotate(
                        angle: -pi / 4,
                        child: Container(
                          color: _cursorColor,
                          height: 5,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                  Positioned(
                    left: -1,
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: _cursorColor),
                        color: _backgroundColor,
                      ),
                      duration: _animationDuration,
                      width: _showCursor ? 2 : 20,
                      curve: Curves.bounceInOut,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onChanged(String value) => setState(() {});

  Future<void> _onFocusChanged() async {
    if (!_focusNode.hasFocus && _textController.text.isEmpty) {
      setState(() => _showCursor = false);
      await Future.delayed(_animationDuration * 2);
      setState(() {
        _showSearchHandle = true;
        _showSearchIconHandle = true;
      });
    } else {
      setState(() {});
    }
  }

  Future<void> _onTap() async {
    if (_textController.text.isNotEmpty) {
      _focusNode.requestFocus();
      return;
    }
    setState(() => _showSearchIconHandle = false);
    await Future.delayed(_animationDuration * 2);
    setState(() {
      _showCursor = true;
      _showSearchHandle = false;
    });
    await Future.delayed(_animationDuration * 3);
    _focusNode.requestFocus();
  }
}
