import 'package:flutter/material.dart';
import 'package:skillset/ui/shared/widgets/main_button.dart';

class ChipsInputField extends StatefulWidget {
  final String labelText;
  final Function getChips; // A function that sends data back to parent

  const ChipsInputField({this.labelText, this.getChips});

  // List<String> get chips =
  @override
  _ChipsInputFieldState createState() => _ChipsInputFieldState();
}

class _ChipsInputFieldState extends State<ChipsInputField> {
  TextEditingController _chipsController = TextEditingController();
  List<String> chips = [];

  Widget buildChips() {
    // function builds the a role of chips above the input field

    List<Widget> chipWidgets = [];
    for (int i = 0; i < chips.length; i++) {
      InputChip actionChip = InputChip(
        label: Text(chips[i]),
        backgroundColor: Theme.of(context).primaryColorLight,
        onDeleted: () {
          chips.removeAt(i);

          setState(() {
            chips = chips;
          });

          // To Parent
          widget.getChips(chips);
        },
      );
      chipWidgets.add(actionChip);
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      children: chipWidgets,
    );
  }

  void _updateChips() {
    if (_chipsController.text.trimRight().isNotEmpty) {
      chips.add(_chipsController.text.toLowerCase().trimRight().trimLeft());
      _chipsController.clear();

      // To parent
      widget.getChips(chips);
    }

    setState(() {
      chips = chips;
      // _selected = _selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          child: chips.length != 0 ? buildChips() : SizedBox.shrink(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: TextFormField(
                controller: _chipsController,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                ),
                onEditingComplete: _updateChips,
              ),
            ),
            mainButton(
              text: 'Add',
              onPressed: _updateChips,
            ),
          ],
        ),
      ],
    );
  }
}
