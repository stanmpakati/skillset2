import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/posting.dart';
import 'package:newserverdemo/ui/shared/widgets/tag.dart';

class JobWidget extends StatelessWidget {
  final Posting posting;

  List<Widget> getSkills(context) {
    return posting.skills.map((skill) => tag(context, skill)).toList();
  }

  const JobWidget({Key key, this.posting}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  posting.title,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Text(
                '\$${posting.pay.amount}',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text('${posting.pay.unit}'),
            ],
          ),
          SizedBox(height: 8.0),
          Text(posting.description, maxLines: 3),
          SizedBox(height: 8.0),
          Wrap(children: getSkills(context)),
          SizedBox(height: 6.0),
          Row(
            children: [
              Expanded(
                child: Text('Posted ${posting.postedOn}',
                    style: Theme.of(context).textTheme.caption),
              ),
              Icon(
                Icons.location_on,
                color: Theme.of(context).accentColor,
              ),
              Text('${posting.location}'),
            ],
          ),
        ],
      ),
    );
  }
}
