import 'package:ecommerce/trackorde/Eventcard.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';


class Tracker extends StatefulWidget {
  late  bool isFirst;
  late  bool isLast;
  late  bool isPast;
  late final child;
  late String imgurl;

   Tracker({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
     required this.child,
     required this.imgurl,
  });

  @override
  State<Tracker> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: TimelineTile(
          isFirst: widget.isFirst,
          isLast: widget.isLast,
          beforeLineStyle: LineStyle(color: widget.isPast? Colors.green : Colors.red.shade100),
          indicatorStyle: IndicatorStyle(
            width: 50,
            color: widget.isPast? Colors.green : Colors.red.shade100,
            iconStyle: IconStyle(iconData: Icons.done,
            color: widget.isPast? Colors.white : Colors.red.shade100)
          ),
          endChild: EventCard(
            isPast: widget.isPast,
            child: widget.child,
            imgurl: widget.imgurl,
          ),
        ));
  }
}
