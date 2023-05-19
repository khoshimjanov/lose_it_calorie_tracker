import 'package:flutter/material.dart';

class CustomOnboardingSlidingSegmentedControl extends StatefulWidget {
  final List<String> children;
  final ValueChanged<int> onValueChanged;

  const CustomOnboardingSlidingSegmentedControl({
    super.key,
    required this.children,
    required this.onValueChanged,
  });

  @override
  _CustomOnboardingSlidingSegmentedControlState createState() =>
      _CustomOnboardingSlidingSegmentedControlState();
}

class _CustomOnboardingSlidingSegmentedControlState
    extends State<CustomOnboardingSlidingSegmentedControl> with TickerProviderStateMixin {
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
        color: Colors.grey[300],
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
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      widget.children[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
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
                    : _selectedIndex * 1 - 1,
                0,),
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            child: Container(
              alignment: Alignment.center,
              width: widget.children.length == 2
                  ? MediaQuery.of(context).size.width / 2.5
                  : MediaQuery.of(context).size.width / 3.5,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Text(
                widget.children[_selectedIndex],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
