// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:instabug_flutter_task/utils/from_map.dart';

import 'from_map_mocks.dart';

void main() {
  group('FromMap Mixin test', () {
    late FromMap converter;

    setUpAll(() {
      converter = FromMap(map: FromMapMocks.fromMapMock);
    });

    test('Test String conversion', () async {
      dynamic result;

      // Test String conversion
      result = converter.convertToString(key: "string1");
      expect(result, const TypeMatcher<String>());
      expect(result, "sdgsgs");

      result = converter.convertToString(key: "string2");
      expect(result, const TypeMatcher<String>());
      expect(result, "123");

      result = converter.convertToString(key: "string3");
      expect(result, null);
    });

    test('FromMap Mixin test', () async {
      dynamic result;

      // Test double conversion
      result = converter.convertToDouble(key: "double1");
      expect(result, const TypeMatcher<double>());

      result = converter.convertToDouble(key: "double2");
      expect(result, const TypeMatcher<double>());

      result = converter.convertToDouble(key: "double3");
      expect(result, const TypeMatcher<double>());

      result = converter.convertToDouble(key: "double4");
      expect(result, const TypeMatcher<double>());

      result = converter.convertToDouble(key: "double5", defaultValue: 202);
      expect(result, const TypeMatcher<double>());

      result = converter.convertToDouble(key: "double5");
      expect(result, null);


      result = converter.convertToDouble(key: "double6");
      expect(result, null);

      result = converter.convertToDouble(key: "double7", defaultValue: 202);
      expect(result, 23313.2123);

      result = converter.convertToDouble(key: "double8", defaultValue: 202);
      expect(result, 24523313.2);
    });

    test('FromMap Mixin test', () async {
      dynamic result;

      result = converter.convertToInt(key: "int1");
      expect(result, const TypeMatcher<int>());

      result = converter.convertToInt(key: "int2");
      expect(result, const TypeMatcher<int>());

      result = converter.convertToInt(key: "int3");
      expect(result, null);

      result = converter.convertToInt(key: "int4");
      expect(result, null);

      result = converter.convertToInt(key: "int5", defaultValue: 202);
      expect(result, const TypeMatcher<int>());

      result = converter.convertToInt(key: "int6");
      expect(result, null);
    });

    test('FromMap Mixin test', () async {
      dynamic result;

      result = converter.convertToBool(key: "bool6");
      expect(result, true);

      result = converter.convertToBool(key: "bool7");
      expect(result, null);

      result = converter.convertToBool(key: "bool7", defaultValue: true);
      expect(result, true);

      result = converter.convertToBool(key: "bool1");
      expect(result, true);

      result = converter.convertToBool(key: "bool2");
      expect(result, false);

      result = converter.convertToBool(key: "bool3");
      expect(result, true);

      result = converter.convertToBool(key: "bool4");
      expect(result, false);

      result = converter.convertToBool(key: "bool5");
      expect(result, false);

      result = converter.convertToBool(key: "bool6");
      expect(result, true);

      result = converter.convertToBool(key: "bool7");
      expect(result, null);

      result = converter.convertToBool(key: "bool7", defaultValue: true);
      expect(result, true);
    });
  });
}
