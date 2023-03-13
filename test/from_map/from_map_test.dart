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

      // Test if int is converted to string
      result = converter.convertToString(key: "string2");
      expect(result, const TypeMatcher<String>());
      expect(result, "123");

      // Test if null is returned as null
      result = converter.convertToString(key: "string3");
      expect(result, null);
    });

    test('Test Double conversion', () async {
      dynamic result;

      // Test double conversion
      result = converter.convertToDouble(key: "double1");
      expect(result, const TypeMatcher<double>());

      // Test if string is converted to double
      result = converter.convertToDouble(key: "double2");
      expect(result, const TypeMatcher<double>());

      // Test if double with `.` is converted to double
      result = converter.convertToDouble(key: "double3");
      expect(result, const TypeMatcher<double>());

      // Test if String with `.` is converted to double
      result = converter.convertToDouble(key: "double4");
      expect(result, const TypeMatcher<double>());

      // Test if invalid double is returned to null
      result = converter.convertToDouble(key: "double5");
      expect(result, null);

      // Test if nullable double is converted to default value
      result = converter.convertToDouble(key: "double5", defaultValue: 202);
      expect(result, const TypeMatcher<double>());

      // Test if null is returned to null
      result = converter.convertToDouble(key: "double6");
      expect(result, null);

      // Test if String with `,` and `.` is converted to double.
      result = converter.convertToDouble(key: "double7", defaultValue: 202);
      expect(result, 23313.2123);

      // Test if String with multi `,` and `.` is converted to double.
      result = converter.convertToDouble(key: "double8", defaultValue: 202);
      expect(result, 24523313.2);
    });

    test('Test int conversion', () async {
      dynamic result;

      // Test int conversion
      result = converter.convertToInt(key: "int1");
      expect(result, const TypeMatcher<int>());
      expect(result, 232);

      // Test if string is converted to int
      result = converter.convertToInt(key: "int2");
      expect(result, const TypeMatcher<int>());
      expect(result, 345);

      // Test if double is returned as null
      result = converter.convertToInt(key: "int3");
      expect(result, null);

      // Test if String with `.` is returned as null
      result = converter.convertToInt(key: "int4");
      expect(result, null);

      // Test if invalid int is returned to with defaultValue
      result = converter.convertToInt(key: "int5", defaultValue: 202);
      expect(result, const TypeMatcher<int>());

      // Test if null is returned to null
      result = converter.convertToInt(key: "int6");
      expect(result, null);
    });

    test('Test boolean conversion', () async {
      dynamic result;

      // Test boolean conversion (true)
      result = converter.convertToBool(key: "bool1");
      expect(result, true);

      // Test boolean conversion (false)
      result = converter.convertToBool(key: "bool2");
      expect(result, false);

      // Test String is converted to boolean (true)
      result = converter.convertToBool(key: "bool3");
      expect(result, true);

      // Test String is converted to boolean (false)
      result = converter.convertToBool(key: "bool4");
      expect(result, false);

      // Test if String 0 is converted to boolean (false)
      result = converter.convertToBool(key: "bool5");
      expect(result, false);

      // Test if String 1 is converted to boolean (true)
      result = converter.convertToBool(key: "bool6");
      expect(result, true);

      // Test if null is returned to null
      result = converter.convertToBool(key: "bool7");
      expect(result, null);

      // Test if null is returned to default value
      result = converter.convertToBool(key: "bool7", defaultValue: true);
      expect(result, true);

      // Test if integer is returned to null
      result = converter.convertToBool(key: "bool8");
      expect(result, null);

      // Test if integer (0) is returned to false
      result = converter.convertToBool(key: "bool9");
      expect(result, false);

      // Test if integer (1) is returned to false
      result = converter.convertToBool(key: "bool10");
      expect(result, true);
    });
  });
}
