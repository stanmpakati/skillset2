import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/user.dart';

import 'stars.dart';
import 'tag.dart';
import 'cached_image.dart';

class FreelanceBig extends StatelessWidget {
  final Freelancer freelancer;

  const FreelanceBig({Key key, this.freelancer}) : super(key: key);

  List<Widget> getSkills(context) {
    return freelancer.skills.map((skill) => tag(context, skill)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
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
          ListTile(
            leading: cachedNetworkImage(freelancer.user.profilePicture),
            title: Text(
              '${freelancer.user.firstName} ${freelancer.user.lastName}',
              style: Theme.of(context).textTheme.headline4,
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on,
                        color: Theme.of(context).accentColor),
                    Text(
                      '${freelancer.user.city}, ${freelancer.user.country}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                starsRating(rating: freelancer.user.stars),
              ],
            ),
            onTap: () => print('Navigate to profile page'),
            tileColor: Colors.white,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${freelancer.title}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  '20',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text('/hour'),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '${freelancer.bio}',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontFamily: 'BebasNeue'),
          ),
          Wrap(
            alignment: WrapAlignment.start,
            children: getSkills(context),
          ),
        ],
      ),
    );
  }
}
