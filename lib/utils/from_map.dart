
//This is a generic class that is used to convert the JSON response from the API
//to types like String, int, double, etc.
//It is used to avoid repeating the same code for converting the JSON response.
class FromMap {
  final Map<String, dynamic> map;

  FromMap({this.map = const <String, dynamic>{}});

  //Convert the value of the given key to String
  String? convertToString({
    required String key,
    String? defaultValue,
    Map<String, dynamic>? innerMap,
  }) {
    //If the innerMap is not null, use it, otherwise use the map
    final Map<String, dynamic> usedMap = innerMap ?? map;

    //If the value of the given key is null, return the default value
    //which is null by default
    final String? result = usedMap[key]?.toString().trim() ?? defaultValue;
    return result;
  }

  //Convert the value of the given key to bool
  int? convertToInt({required String key, int? defaultValue, Map<String, dynamic>? innerMap}) {
    //If the innerMap is not null, use it, otherwise use the map
    final Map<String, dynamic> usedMap = innerMap ?? map;

    //If the value of the given key is null, return the default value
    //which is null by default

    //If the value of the given key is already an int, return it
    if (usedMap[key] is int?) {
      return (usedMap[key] as int?) ?? defaultValue;
    } else {
      //If the value of the given key is not an int,
      //convert it to String and then to try to convert it to int
      final String? value = usedMap[key]?.toString();
      final int? result = int.tryParse(value ?? "") ?? defaultValue;
      return result;
    }
  }

  //Convert the value of the given key to double
  double? convertToDouble({
    required String key,
    double? defaultValue,
    Map<String, dynamic>? innerMap,
  }) {
    //If the innerMap is not null, use it, otherwise use the map
    final Map<String, dynamic> usedMap = innerMap ?? map;

    //If the value of the given key is null, return the default value
    //which is null by default

    //If the value of the given key is already an double, return it
    if (usedMap[key] is double?) {
      return (usedMap[key] as double?) ?? defaultValue;
    } else {
      //If the value of the given key is not an double,
      //convert it to String and then to try to convert it to double
      String? value = usedMap[key]?.toString();

      //If the value contains both '.' and ',' replace the ',' with '.'
      if ((value?.contains('.') ?? false) && (value?.contains(',') ?? false)) {
        value = value?.split(',').join();
      }

      //Try to convert the value to double
      final double? result = double.tryParse(value ?? "") ?? defaultValue;
      return result;
    }
  }

  //Convert the value of the given key to DateTime
  DateTime? convertToDate({
    required String key,
    DateTime? defaultValue,
    Map<String, dynamic>? innerMap,
  }) {
    //If the innerMap is not null, use it, otherwise use the map
    final Map<String, dynamic> usedMap = innerMap ?? map;

    //If the value of the given key is null, return the default value
    //which is null by default

    //Try to convert the value to String
    final String? result = usedMap[key]?.toString().trim();

    //And then try to convert the String to DateTime
    final DateTime? dateTime = DateTime.tryParse(result ?? '') ?? defaultValue;
    return dateTime;
  }

  //Convert the value of the given key to List<Map<String, dynamic>>
  List<Map<String, dynamic>>? convertToList({required String key}) {
    dynamic dynamicData = map[key];

    //Check if the value is a List
    if (dynamicData is List) {
      List<Map<String, dynamic>> listOfMaps = [];

      //Convert the List to List<Map<String, dynamic>>
      //and return it
      dynamicData.map((itemWord) => listOfMaps.add(itemWord)).toList();
      return listOfMaps;
    }

    //If the value is not a List, return null
    return null;
  }

  //Convert the value of the given key to bool
  bool? convertToBool({
    required String key,
    bool? defaultValue,
    Map<String, dynamic>? innerMap,
  }) {
    //If the innerMap is not null, use it, otherwise use the map
    final Map<String, dynamic> tempMap = innerMap ?? map;

    //If the value of the given key is already a bool, return it
    if (tempMap[key] is bool?) {
      return (tempMap[key] as bool?) ?? defaultValue;
    } else {
      //If the value of the given key is not a bool,
      //convert it to String and then to try to convert it to bool
      final String? result = tempMap[key]?.toString().toLowerCase();
      if (<String>["true", "1"].contains(result)) {
        return true;
      } else if (<String>["false", "0"].contains(result)) {
        return false;
      } else {
        //If the value of the given key is null, return the default value
        return defaultValue;
      }
    }
  }
}
