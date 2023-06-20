abstract class Api {
  /// A People resource is an individual person or character within the Star Wars universe.
  static const baseUrl =
      'https://us-central1-ss-devops.cloudfunctions.net/GraphQL';

  // get all the people resources
  static const queryFavoriteBooks = """
  query {
    favoriteBooks {
      id
      name
      cover
      author {
        name
      }
    }
  }
  """;

  // get film data resources
  static const queryFavoriteAuthors = """
    query {
      favoriteAuthors {
        name
        booksCount
        picture
      }
    }
    """;

  // get all the people resources
  static const queryAllBooks = """
  query {
    allBooks {
      name
      cover
      author {
        name
      }
    }
  }
  """;
}
