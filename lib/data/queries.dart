abstract class Queries {
  static String character({Map<String, dynamic>? name, int? page}) {
    return '''
    query Query {
      characters(page: $page, filter: $name) {
        info {
          count
        }
        results {
          name
          image
          species
          status
          gender
        }
      }
      location(id: 1) {
        id
      }
      episodesByIds(ids: [1, 2]) {
        id
      }
    }
 ''';
  }
}
