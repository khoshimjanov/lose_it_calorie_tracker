import 'package:flutter/material.dart';

class CustomSlidingSegmentedControl extends StatefulWidget {
  final List<String> children;
  final ValueChanged<int> onValueChanged;

  const CustomSlidingSegmentedControl({
    super.key,
    required this.children,
    required this.onValueChanged,
  });

  @override
  _CustomSlidingSegmentedControlState createState() =>
      _CustomSlidingSegmentedControlState();
}

class _CustomSlidingSegmentedControlState
    extends State<CustomSlidingSegmentedControl> with TickerProviderStateMixin {
  late AnimationController _controller;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onValueChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller.reset();
    _controller.forward();
    widget.onValueChanged(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color.fromARGB(255, 234, 229, 229),
      ),
      child: Stack(
        children: [
          Row(
            children: List.generate(widget.children.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => _onValueChanged(index),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      widget.children[index],
                    ),
                  ),
                ),
              );
            }),
          ),
          AnimatedAlign(
            alignment: Alignment(
              widget.children.length == 2
                  ? _selectedIndex * 2 - 1
                  : _selectedIndex - 1,
              0,
            ),
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            child: Container(
              alignment: Alignment.center,
              width: widget.children.length == 2
                  ? MediaQuery.of(context).size.width / 6
                  : MediaQuery.of(context).size.width / 7,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Text(
                widget.children[_selectedIndex],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
