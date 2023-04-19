/// A widget that displays a single task on the UI in a row format.
import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../size_config.dart';
import '../theme.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {Key? key}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    // Set horizontal padding based on screen orientation.
    final double horizontalPadding = getProportionateScreenWidth(
      SizeConfig.orientation == Orientation.landscape ? 4 : 20,
    );

    // Set container width based on screen orientation.
    final double containerWidth = SizeConfig.orientation == Orientation.landscape
        ? SizeConfig.screenWidth / 2
        : SizeConfig.screenWidth;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: containerWidth,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _getBGClr(task.color),
          ),
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display task title.
                      Text(
                        task.title ?? '',
                        style: titleStyle.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Display task start and end time.
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey[200],
                            size: 18,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '${task.startTime} - ${task.endTime}',
                            style: titleStyle.copyWith(
                              color: Colors.grey[100],
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Display task note.
                      Text(
                        task.note ?? '',
                        style: titleStyle.copyWith(
                          color: Colors.grey[100],
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Display a vertical divider.
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                width: 0.5,
                color: Colors.grey[200]!.withOpacity(0.7),
              ),
              // Display task status (completed or not).
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  task.isCompleted == 1 ? 'COMPLETED' : 'TODO',
                  style: titleStyle.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBGClr(int? color) {
    switch (color) {
      case 1:
        return pinkClr;
      case 2:
        return orangeClr;
      default:
        return bluishClr;
    }
  }
}
