import 'dart:ui';

import 'package:event_follow/models/entities/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../extension/datetime_ex.dart';

class EventHeldStatus {
  const EventHeldStatus({required this.label, required this.color});

  final String label;
  final Color color;
}

class EventHeldView extends HookWidget {
  const EventHeldView({
    required this.event,
    Key? key,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    final status = convertEventStatus(event);

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xffebe4df),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: Text(
                      event.startedAt.convertToEventDateFormat(),
                      style: const TextStyle(fontSize: 16, letterSpacing: 2),
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: status.color,
                  child: Center(
                    child: Text(
                      status.label,
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  EventHeldStatus convertEventStatus(Event event) {
    final startAt = event.startedAt;
    final endAt = event.endedAt;

    final now = DateTime.now();
    final nextDate = now.add(const Duration(days: 1));
    if (now.compareTo(startAt) >= 0 && now.compareTo(endAt) <= 0) {
      return const EventHeldStatus(label: '開催中', color: Color(0xfffd5c63));
    }

    if (now.compareTo(startAt) < 0 &&
        now.year == startAt.year &&
        now.month == startAt.month &&
        now.day == startAt.day) {
      return const EventHeldStatus(label: '本日開催', color: Color(0xfff47721));
    }

    if (now.compareTo(startAt) < 0 &&
        nextDate.year == startAt.year &&
        nextDate.month == startAt.month &&
        nextDate.day == startAt.day) {
      return const EventHeldStatus(label: '明日開催', color: Color(0xff8560a8));
    }

    if (now.compareTo(startAt) < 0) {
      return const EventHeldStatus(label: '開催前', color: Color(0xff00aeff));
    }

    return const EventHeldStatus(label: '開催終了', color: Color(0xff4A4a4a));
  }
}
