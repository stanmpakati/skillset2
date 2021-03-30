import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/posting.dart';
import 'package:newserverdemo/core/models/user.dart';
import 'package:newserverdemo/core/services/post_service.dart';
import 'package:newserverdemo/core/services/user_service.dart';
import 'package:newserverdemo/ui/shared/utils/time_ago.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';
import 'package:newserverdemo/ui/shared/widgets/short_profile_widget.dart';
import 'package:newserverdemo/ui/shared/widgets/tag.dart';
import 'package:provider/provider.dart';

class JobDetails extends StatefulWidget {
  final String atKey;

  const JobDetails({Key key, @required this.atKey}) : super(key: key);

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    Posting posting = Provider.of<PostService>(context, listen: false)
        .myPosts
        .firstWhere((post) => post.title == widget.atKey);
    // Freelancer owner =
    // Provider.of<UserService>(context).returnUser(posting.postedBy);
    return Scaffold(
      appBar: AppBar(title: Text('Job')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          Text(
            '${posting.title}',
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                  child: Text(
                'Posted ${TimeAgo.timeAgoSinceDate(posting.postedOn)}',
                style: Theme.of(context).primaryTextTheme.caption,
              )),
              Icon(Icons.location_on, color: Theme.of(context).accentColor),
              Text('${posting.location}'),
            ],
          ),
          SizedBox(height: 14),
          Text('Skills Required',
              style: Theme.of(context).primaryTextTheme.headline6),
          SizedBox(height: 2),
          Wrap(
              children:
                  posting.skills.map((skill) => tag(context, skill)).toList()),
          SizedBox(height: 14),
          Text('Description',
              style: Theme.of(context).primaryTextTheme.headline6),
          SizedBox(height: 8),
          Text('${posting.description}'),
          SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Experience',
                        style: Theme.of(context).primaryTextTheme.headline6),
                    Text('Intermediate'),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pay',
                        style: Theme.of(context).primaryTextTheme.headline6),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${posting.pay.amount}',
                            style: Theme.of(context).primaryTextTheme.headline6,
                          ),
                          TextSpan(
                            text: '/${posting.pay.unit}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 14),
          Text('Employer', style: Theme.of(context).primaryTextTheme.headline6),
          SizedBox(height: 14),
          ProfileShort(user: mockFreelancer),
          RoundedButton(path: goToChat, text: 'Make Proposal')
        ],
      ),
    );
  }

  void goToChat() {
    print('go yo chat');
  }
}
