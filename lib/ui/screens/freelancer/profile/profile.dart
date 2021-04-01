import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/user.dart';
import 'package:newserverdemo/core/services/user_service.dart';
import 'package:newserverdemo/ui/shared/widgets/cached_image.dart';
import 'package:newserverdemo/ui/shared/widgets/education_widget.dart';
import 'package:newserverdemo/ui/shared/widgets/stars.dart';
import 'package:newserverdemo/ui/shared/widgets/tag.dart';
import 'package:newserverdemo/ui/shared/widgets/work_history_widget.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  static final id = 'Profile';
  // final Freelancer freelancer;

  // const Profile({Key key, @required this.freelancer}) : super(key: key);

  Widget headerText(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
      child: Text(
        title,
        style: Theme.of(context).primaryTextTheme.headline3,
      ),
    );
  }

  // List<Widget> getSkills(context) {
  //   return freelancer.skills.map((skill) => tag(context, skill)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    Freelancer freelancer =
        Provider.of<UserService>(context, listen: false).freelancer;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          Row(
            children: [
              cachedNetworkImage(freelancer.profilePicture, isPotifolio: true),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${freelancer.firstName} ${freelancer.lastName}',
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: Theme.of(context).accentColor),
                      Text(
                        '${freelancer.city}, ${freelancer.country}',
                        style: Theme.of(context).primaryTextTheme.caption,
                      ),
                    ],
                  ),
                  starsRating(rating: freelancer.stars, bigSize: true),
                ],
              ),
            ],
          ),
          headerText(context, '${freelancer.title}'),
          Text('${freelancer.bio}'),
          headerText(context, 'Skills'),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: -12,
            children:
                freelancer.skills.map((skill) => tag(context, skill)).toList(),
          ),
          headerText(context, 'Education'),
          GridView.builder(
            itemCount: freelancer.education.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6.0,
              childAspectRatio: 1.75 / 1,
              mainAxisSpacing: 5.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return EducationWidget(education: freelancer.education[index]);
            },
          ),
          headerText(context, 'Work History'),
          GridView.builder(
            itemCount: freelancer.education.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6.0,
              childAspectRatio: 2 / 1,
              mainAxisSpacing: 5.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return WorkHistoryWidget(
                  workHistory: freelancer.workHistory[index]);
            },
          ),
        ],
      ),
    );
  }
}
