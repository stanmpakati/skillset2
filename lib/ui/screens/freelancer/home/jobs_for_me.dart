import 'package:flutter/material.dart';
import 'package:newserverdemo/core/services/post_service.dart';
import 'package:provider/provider.dart';
import 'package:newserverdemo/core/models/posting.dart';
import 'package:newserverdemo/ui/shared/widgets/job_widget.dart';

class JobsForMe extends StatefulWidget {
  @override
  _JobsForMeState createState() => _JobsForMeState();
}

class _JobsForMeState extends State<JobsForMe> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostService>(
      builder: (context, postService, child) {
        postService.getMyPosts();
        List<Posting> posts = postService.myPosts;
        print('posts: $posts');
        if (posts.isEmpty) {
          return Center(
            child: Text(
              'No Jobs',
              style: Theme.of(context).primaryTextTheme.headline2,
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemCount: posts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: JobWidget(posting: posts[index]),
          ),
        );
      },
    );
  }
}
