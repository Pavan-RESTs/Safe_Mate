import 'package:flutter/cupertino.dart';

import '../date_unit.dart';

class DateScrollerUnitBuilder extends StatelessWidget {
  const DateScrollerUnitBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 12; i < 29; i++)
            if (i == 15)
              DateUnit(
                isActive: true,
                date: i.toString(),
              )
            else
              DateUnit(
                isActive: false,
                date: i.toString(),
              )
        ],
      ),
    );
  }
}
