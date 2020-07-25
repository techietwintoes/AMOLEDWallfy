import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'fetchgirls.dart';

class Providers {
  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider<GirlsWallfy>(
          create: (_) => GirlsWallfy(),
        ),
      ];
}
