import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_app/ui/common/modal.utils.dart';
import 'package:test_app/ui/views/comments/comments_view.dart';

class HomeViewModel extends BaseViewModel {
  final BuildContext context;
  HomeViewModel({required this.context});

  int _currentTapIndex = 0;

  bool showButtons = true;
  bool showReadMoreCaptionMode = true;

  get currentTapIndex => _currentTapIndex;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void onTest() {
    // ModalSheet.showModal(
    //     child: Container(
    //       child: const Text("Test"),
    //     ),
    //     context: context);
  }

  void onTapChanged(int value) {
    _currentTapIndex = value;
    rebuildUi();
  }

  void toggleButtons() {
    showButtons = !showButtons;
    rebuildUi();
  }

  void toggleCaptionReadMode() {
    showReadMoreCaptionMode = !showReadMoreCaptionMode;
    rebuildUi();
  }

  void onTopMenuTapped() {
    scaffoldKey.currentState?.openDrawer();
  }

  void onCommentTapped() {
    ModalSheet.showModal(child: const CommentsView(), context: context);
  }
}
