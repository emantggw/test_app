import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_app/app/app.locator.dart';
import 'package:test_app/ui/common/modal.utils.dart';
import 'package:test_app/ui/views/replay/emojie_widget.dart';

class ReplayViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  TextEditingController textEditingController = TextEditingController();
  final BuildContext context;

  ReplayViewModel({required this.context});

  void onBack() {
    _navigator.back();
  }

  void showEmojies() async {
    String? emoj = await ModalSheet.showModal(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Search emojies...",
                    fillColor: Colors.grey,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                EmojiesWidget(),
              ],
            ),
          ),
        ),
        context: context);

    if (emoj != null) {
      textEditingController.text = textEditingController.text + emoj;
    }
  }
}
