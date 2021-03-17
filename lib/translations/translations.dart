import 'package:get/get.dart';

class TextTransaltions extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
        'fr_BE': {
          "POPULAR": "Populaires",
          "IN_THEATER": "Au cinéma",
          "TOP_RATED": "Les mieux notés",
          "UPCOMING": "A venir",
          "NO_MOVIES_HAVE_BEEN_FOUND": "Aucun film n'a été trouvé"
        },
        'en_US': {
          "POPULAR": "Popular",
          "IN_THEATER": "In Theater",
          "TOP_RATED": "Top Rated",
          "UPCOMING": "Upcoming",
          "NO_MOVIES_HAVE_BEEN_FOUND": "No Movies have been found"
        }
      };
}