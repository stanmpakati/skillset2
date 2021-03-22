import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/proposal.dart';
import 'package:newserverdemo/ui/screens/freelancer/proposals/proposal_notifications.dart';

class ProposalNotification extends StatelessWidget {
  final JobProposal jobProposal;

  const ProposalNotification({Key key, this.jobProposal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: []),
    );
  }
}
