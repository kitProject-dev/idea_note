import 'package:flutter/material.dart';

class SettingTitleResultList extends StatelessWidget {
  const SettingTitleResultList(this._resultList);

  final List<String> _resultList;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey[300]),
      ),
      child: ListView.builder(
        itemCount: _resultList.length,
        itemBuilder: (context, index) {
          return Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  _resultList[index],
                  style: TextStyle(
                    fontSize: themeData.textTheme.body1.fontSize,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
