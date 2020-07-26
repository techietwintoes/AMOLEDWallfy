import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'gradients.dart';

class FzLoaders {
  FzLoaders._();

  //* Loaders
  static Widget girlsWallfyLoader() => Center(
        child: SpinKitThreeBounce(
          size: 24.0,
          itemBuilder: (_, index) => DecoratedBox(
            decoration: BoxDecoration(
              gradient: FzGradients.pinkRedGradient,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );

  static Widget eroticWallfyLoader() => Center(
        child: SpinKitThreeBounce(
          size: 24.0,
          itemBuilder: (_, index) => DecoratedBox(
            decoration: BoxDecoration(
              gradient: FzGradients.blueSexyGradient,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );

  static Widget darkWallfyLoader() => Center(
        child: SpinKitThreeBounce(
          size: 24.0,
          itemBuilder: (_, index) => DecoratedBox(
            decoration: BoxDecoration(
              gradient: FzGradients.citruspeel,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );

  static Widget absWallfyLoader() => Center(
        child: SpinKitThreeBounce(
          size: 24.0,
          itemBuilder: (_, index) => DecoratedBox(
            decoration: BoxDecoration(
              gradient: FzGradients.redSexyGradient,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );

  static Widget minimalWallfyLoader() => Center(
        child: SpinKitThreeBounce(
          size: 24.0,
          itemBuilder: (_, index) => DecoratedBox(
            decoration: BoxDecoration(
              gradient: FzGradients.violetSexyGradient,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );

  static Widget natureWallfyLoader() => Center(
        child: SpinKitThreeBounce(
          size: 24.0,
          itemBuilder: (_, index) => DecoratedBox(
            decoration: BoxDecoration(
              gradient: FzGradients.skyBlueGradient,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );

  static Widget othersWallfyLoader() => Center(
        child: SpinKitThreeBounce(
          size: 24.0,
          itemBuilder: (_, index) => DecoratedBox(
            decoration: BoxDecoration(
              gradient: FzGradients.lbizaSunset,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
}
