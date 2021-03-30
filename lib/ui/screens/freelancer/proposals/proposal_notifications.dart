import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/posting.dart';
import 'package:newserverdemo/core/services/post_service.dart';
import 'package:newserverdemo/ui/shared/widgets/job_widget.dart';
import 'package:provider/provider.dart';

class ProposalNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Posts'),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     child: Text('Get something'),
      //     onPressed: () {
      //       PostService().getMyPosts();
      //     },
      //   ),
      // ),
      body: Consumer<PostService>(
        builder: (context, postService, child) {
          postService.getMyPosts();
          List<Posting> posts = postService.myPosts;
          if (posts.length == 0) {
            return Center(
              child: Text(
                'No Jobs',
                style: Theme.of(context).primaryTextTheme.headline2,
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            itemCount: posts.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: JobWidget(posting: posts[index]),
            ),
          );
        },
      ),
    );
  }
}
