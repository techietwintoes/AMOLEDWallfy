import 'package:AMOLED/providers/fetchcat.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'AdmobAds.dart';
import 'checkinternet.dart';
import 'fetchabstract.dart';
import 'fetchdark.dart';
import 'fetcherotic.dart';
import 'fetchgirls.dart';
import 'fetchminimal.dart';
import 'fetchnature.dart';
import 'fetchothers.dart';

class Providers {
  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider<InternetStatus>(
          create: (_) => InternetStatus(),
        ),
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
        ChangeNotifierProvider<MinimalWallfy>(
          create: (_) => MinimalWallfy(),
        ),
        ChangeNotifierProvider<NatureWallfy>(
          create: (_) => NatureWallfy(),
        ),
        ChangeNotifierProvider<OthersWallfy>(
          create: (_) => OthersWallfy(),
        ),
        ChangeNotifierProvider<CatWallfy>(
          create: (_) => CatWallfy(),
        ),
        ChangeNotifierProvider<AdmobAds>(
          create: (_) => AdmobAds(),
        ),
      ];
}
