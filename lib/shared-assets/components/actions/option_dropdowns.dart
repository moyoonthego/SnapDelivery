import 'package:app/shared-assets/components/helpers/currency_text.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

const DEFAULT_DROPDOWN_EXPANED = true;

class OptionDropdownItemData {
  OptionDropdownItemData(
      {this.selected = false, @required this.title, this.costModifier});

  final String title;
  final num costModifier;
  bool selected;
}

class OptionDropdownData {
  OptionDropdownData(
      {@required this.title,
      this.isExpanded = DEFAULT_DROPDOWN_EXPANED,
      this.items,
      this.subtitle});

  final String title;
  final String subtitle;
  bool isExpanded;
  final List<OptionDropdownItemData> items;
}

class OptionDropdowns extends StatefulWidget {
  OptionDropdowns({@required this.options});

  final List<OptionDropdownData> options;

  @override
  _OptionDropdownsState createState() =>
      _OptionDropdownsState(options: this.options);
}

class _OptionDropdownsState extends State<OptionDropdowns> {
  _OptionDropdownsState({@required this.options});

  final List<OptionDropdownData> options;

  _toggleExpanded(int idx, bool isExpanded) {
    setState(() {
      options[idx].isExpanded = !isExpanded;
    });
  }

  _handleCheckboxClick(OptionDropdownItemData item, bool isSelected) {
    setState(() {
      item.selected = isSelected;
    });
  }

  Widget _buildHeader(
      BuildContext context, OptionDropdownData option, bool isExpanded) {
    return ListTile(
      title: Text(option.title, style: Constants.NORMAL_TEXT_BLACK),
      subtitle: (option.subtitle != null) ? Text(option.subtitle) : null,
    );
  }

  List<Widget> _buildCheckboxes(OptionDropdownData option) {
    return option.items.map((item) {
      return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          item.title,
          style: Constants.NORMAL_TEXT_BLACK,
        ),
        secondary: (item.costModifier != null)
            ? CurrencyText(item.costModifier, showPlus: true)
            : null,
        value: item.selected,
        onChanged: (isSelected) {
          _handleCheckboxClick(item, isSelected);
        },
        activeColor: Constants.MCDICKS_PRIMARY,
      );
    }).toList();
  }

  Widget _buildDropdown() {
    return ExpansionPanelList(
      expansionCallback: _toggleExpanded,
      children: this.options.map<ExpansionPanel>((option) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) =>
                _buildHeader(context, option, isExpanded),
            body: Column(children: _buildCheckboxes(option)),
            isExpanded: option.isExpanded,
            canTapOnHeader: true);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDropdown();
  }
}
