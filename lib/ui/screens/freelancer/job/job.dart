import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/posting.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';
import 'package:newserverdemo/ui/shared/widgets/short_profile_widget.dart';
import 'package:newserverdemo/ui/shared/widgets/tag.dart';

class JobDetails extends StatefulWidget {
  static final String id = "jobDetails";
  final Posting posting;

  const JobDetails({Key key, @required this.posting}) : super(key: key);
  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  List<Widget> getSkills(context) {
    return widget.posting.skills.map((skill) => tag(context, skill)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Job')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          Text(
            '${widget.posting.title}',
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                  child: Text(
                'Posted ${widget.posting.postedOn.toUtc()}',
                style: Theme.of(context).primaryTextTheme.caption,
              )),
              Icon(Icons.location_on, color: Theme.of(context).accentColor),
              Text('${widget.posting.location}'),
            ],
          ),
          SizedBox(height: 14),
          Text('Skills Required',
              style: Theme.of(context).primaryTextTheme.headline4),
          SizedBox(height: 8),
          Wrap(children: getSkills(context)),
          Text('Description',
              style: Theme.of(context).primaryTextTheme.headline4),
          Text('${widget.posting.description}'),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Experience',
                      style: Theme.of(context).primaryTextTheme.headline4),
                  Text('inter'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pay',
                      style: Theme.of(context).primaryTextTheme.headline4),
                  Text(
                    '${widget.posting.pay.amount}',
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                ],
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 14),
          Text('Employer', style: Theme.of(context).primaryTextTheme.headline4),
          // ProfileShort()
          RaisedButton(
            onPressed: goToChat,
            child: Text('Make Proposal'),
          )
        ],
      ),
    );
  }

  void goToChat() {}
}
