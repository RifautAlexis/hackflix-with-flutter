enum Filter { popular, inTheater, topRated, upcoming }

class Filters {
  // comment from class Colors
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  Filters._();

  static const Map<Filter, String> FilterMapping = const {
    Filter.popular: "POPULAR",
    Filter.inTheater: "IN_THEATER",
    Filter.topRated: "TOP_RATED",
    Filter.upcoming: "UPCOMING"
  };
}
