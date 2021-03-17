import 'package:flutter/material.dart';
import 'package:skillset/core/models/user.dart';
import 'package:skillset/ui/shared/widgets/cached_image.dart';
import 'package:skillset/ui/shared/widgets/stars.dart';

class FreelancerWidget extends StatelessWidget {
  final User user;

  const FreelancerWidget({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ]),
      child: ListTile(
        leading: cachedNetworkImage(user.profilePicture),
        title: Text(
          '${user.firstName} ${user.lastName}',
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, color: Theme.of(context).accentColor),
                Text(
                  '${user.city}, ${user.country}',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            starsRating(rating: user.stars),
          ],
        ),
        onTap: () => print('Navigate to profile page'),
        tileColor: Colors.white,
      ),
    );
  }
}
