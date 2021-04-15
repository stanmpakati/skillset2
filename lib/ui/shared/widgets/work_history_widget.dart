import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/work_history.dart';

// Not finished yet, need to handle those not graduated yet
class WorkHistoryWidget extends StatelessWidget {
  final WorkHistory workHistory;

  const WorkHistoryWidget({Key key, this.workHistory}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              workHistory.position != null ? workHistory.position : '',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
            Text(
              workHistory.companyName != null ? workHistory.companyName : '',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              workHistory.startingYear != null
                  ? workHistory.startingYear.toString()
                  : '',
              style: Theme.of(context).primaryTextTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
