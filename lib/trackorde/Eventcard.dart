import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  late bool isPast;
  late final child;
  late String imgurl;

  EventCard({super.key,
  required this.isPast,
  required this.child,
  required this.imgurl});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: widget.isPast? Colors.green[200] : Colors.red[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: NetworkImage(widget.imgurl),
                fit: BoxFit.fill),
              ),
            ),
            SizedBox(width: 20,),
           widget.child,
          ],
        ),
      ),
    );
  }
}
