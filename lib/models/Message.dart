 class Message {
    String id_author;
    String name;
    String file_name;
    String name_fr;
    

    // ignore: non_constant_identifier_names
    Message({this.id_author, this.name, this.file_name, this.name_fr});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
     id_author: json['_id_author'] as String,
     name: json['name'] as String,
     file_name: json['file_name'] as String,
     name_fr: json['name_fr'] as String,
    );
  }
  }