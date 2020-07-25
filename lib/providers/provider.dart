import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'fetchabstract.dart';
import 'fetchdark.dart';
import 'fetcherotic.dart';
import 'fetchgirls.dart';

class Providers {
  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider<GirlsWallfy>(
          create: (_) => GirlsWallfy(),
        ),
        ChangeNotifierProvider<EroticWallfy>(
          create: (_) => EroticWallfy(),
        ),
        ChangeNotifierProvider<DarkWallfy>(
          create: (_) => DarkWallfy(),
        ),
        ChangeNotifierProvider<AbstractWallfy>(
          create: (_) => AbstractWallfy(),
        ),
      ];
}
