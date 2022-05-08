// import 'package:emv_home/dropDown_price.dart';
// import 'package:emv_home/expansion_panel.dart';
// import 'package:emv_home/screens/used_tesla_cars/used_car_details.dart';
// import 'package:bottom_drawer/bottom_drawer.dart';
// import 'package:emv_home/sections/elon_musk/elon_musk_models.dart';
// import 'package:emv_home/sections/elon_musk/elon_musk_top.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../api/services/services.dart';
import '../../../screens/detailscreen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../drawer/leftSideDrawer.dart';
import '../../drawer/rightSideDrawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../homeScreen.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>)? onSelectionChanged;
  final Function(List<String>)? onMaxSelected;
  final int? maxSelection;

  MultiSelectChip(this.reportList,
      {this.onSelectionChanged, this.onMaxSelected, this.maxSelection});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> reportList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil"
  ];
  List<String> selectedReportList = [];

  _showReportDialog() {}

  // String selectedChoice = "";
  List<String> selectedChoices = [];

  _buildChoiceList() {
    List<Widget> choices = [];

    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            if (selectedChoices.length == (widget.maxSelection ?? -1) &&
                !selectedChoices.contains(item)) {
              widget.onMaxSelected?.call(selectedChoices);
            } else {
              setState(() {
                selectedChoices.contains(item)
                    ? selectedChoices.remove(item)
                    : selectedChoices.add(item);
                widget.onSelectionChanged?.call(selectedChoices);
              });
            }
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
