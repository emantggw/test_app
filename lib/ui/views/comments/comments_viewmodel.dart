import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_app/app/app.locator.dart';
import 'package:test_app/app/app.router.dart';
import 'package:test_app/ui/views/replay/replay_view.dart';

class CommentsViewModel extends BaseViewModel {
  final _locator = locator<NavigationService>();
  final BuildContext context;
  CommentsViewModel({required this.context});
  void onReplayComment() {
    //TODO figure out why nav not working when go and back?
    // _locator.navigateToReplayView();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ReplayView()));
  }
}
