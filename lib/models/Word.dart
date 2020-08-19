 class Word {
    String id;
    String word;
    String pronunciation;
    String meaning;
    String examples;
    String synonyms;
    String antonyms;
    String excerpt;

    Word({this.id, this.word, this.pronunciation, this.meaning, this.examples, this.synonyms, this.antonyms, this.excerpt});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
     id: json['id'] as String,
     word: json['word'] as String,
     pronunciation: json['pronunciation'] as String,
     meaning: json['meaning'] as String,
     examples: json['examples'] as String,
     synonyms: json['synonyms'] as String,
     antonyms: json['antonyms'] as String,
     excerpt: json['word'] as String,
    );
  }
  }