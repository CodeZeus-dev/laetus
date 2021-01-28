import 'package:flutter/foundation.dart';

int findMedian({int r, int g, int b}) {
  List<int> rgbList = [r, g, b];

  rgbList.sort((a, b) => a.compareTo(b));

  int median;

  int middle = rgbList.length ~/ 2;

  if (rgbList.length % 2 == 1) {
    median = rgbList[middle];
  } else {
    median = ((rgbList[middle - 1] + rgbList[middle]) / 2.0).round();
  }
  return median;
}

Map<String, dynamic> changeColour(
    {double a,
    @required int r,
    @required int g,
    @required int b,
    @required double shiftValue,
    double currentSlideValue}) {
  int medianRGB = findMedian(r: r, g: g, b: b);

  if (currentSlideValue > 40.0) {
    if (r == medianRGB) {
      return {'a': a, 'r': r + shiftValue, 'g': g, 'b': b};
    } else if (g == medianRGB) {
      return {'a': a, 'r': r, 'g': g + shiftValue, 'b': b};
    } else if (b == medianRGB) {
      return {'a': a, 'r': r, 'g': g, 'b': b + shiftValue};
    }
  } else if (currentSlideValue < 40.0) {
    if (r == medianRGB) {
      return {'a': a, 'r': r - shiftValue, 'g': g, 'b': b};
    } else if (g == medianRGB) {
      return {'a': a, 'r': r, 'g': g - shiftValue, 'b': b};
    } else if (b == medianRGB) {
      return {'a': a, 'r': r, 'g': g, 'b': b - shiftValue};
    }
  }
  return {'a': a, 'r': r, 'g': g, 'b': b};
}
