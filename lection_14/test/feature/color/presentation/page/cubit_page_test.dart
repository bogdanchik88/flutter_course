import 'package:bloc_test/bloc_test.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:lection_14/feature/color/presentation/cubit/color_cubit.dart';
import 'package:lection_14/feature/color/presentation/page/cubit_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockColorCubit extends MockCubit<ColorState> implements ColorCubit {}

void main() {
  group("ColorPage tests:", () {
    Widget wrap({required Widget child}) {
      return MaterialApp(home: child);
    }

    testWidgets("Build", (widgetTester) async {
      final testKey = UniqueKey();

      final ColorCubit cubit = MockColorCubit();

      when(
        () => cubit.state,
      ).thenReturn(ColorCurrentState(color: Colors.black));

      GetIt.I.registerFactory(() => cubit);

      final testWidget = wrap(child: CubitPage(key: testKey));

      widgetTester.pumpWidget(testWidget);

      expect(find.byKey(testKey), findsOneWidget);
      expect(find.byType(CubitPage), findsOneWidget);
      expect(find.text(Colors.black.value.toString()), findsOneWidget);
      expect(find.byType(ColorPicker), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              widget.constraints?.minWidth == 400 &&
              widget.constraints?.minHeight == 400 &&
              widget.color == Colors.black,
        ),
        findsOneWidget,
      );
    });
  });
}
