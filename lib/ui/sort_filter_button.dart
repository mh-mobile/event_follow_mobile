import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortFilterButton extends StatefulWidget {

  const SortFilterButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  State<StatefulWidget> createState() => _SortFilterButtonState();
}

class _SortFilterButtonState extends State<SortFilterButton> {
  bool _pressing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        setState(() {
          _pressing = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _pressing = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _pressing = false;
        });
      },
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: AnimatedOpacity(
          opacity: _pressing ? 0.4 : 1,
          duration: Duration(milliseconds: 160),
          child: Container(
            width: 100,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("開催が", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                    Text("近い順", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Text("x", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Friends", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                    Text("5+", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }

}