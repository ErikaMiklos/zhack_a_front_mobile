class GitHubEvents {
  GitHubEvents({
    required this.id,
    required this.type,
    required this.actor,
    required this.repo,
    required this.payload,
    required this.public,
    required this.createdAt,
  });
  late final String id;
  late final String type;
  late final Actor actor;
  late final Repo repo;
  late final Payload payload;
  late final bool public;
  late final String createdAt;

  GitHubEvents.fromJson(Map<String, dynamic> json){
    id = json['id'];
    type = json['type'];
    actor = Actor.fromJson(json['actor']);
    repo = Repo.fromJson(json['repo']);
    payload = Payload.fromJson(json['payload']);
    public = json['public'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['actor'] = actor.toJson();
    _data['repo'] = repo.toJson();
    _data['payload'] = payload.toJson();
    _data['public'] = public;
    _data['created_at'] = createdAt;
    return _data;
  }
}

class Actor {
  Actor({
    required this.id,
    required this.login,
    required this.displayLogin,
    required this.gravatarId,
    required this.url,
    required this.avatarUrl,
  });
  late final int id;
  late final String login;
  late final String displayLogin;
  late final String gravatarId;
  late final String url;
  late final String avatarUrl;

  Actor.fromJson(Map<String, dynamic> json){
    id = json['id'];
    login = json['login'];
    displayLogin = json['display_login'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['login'] = login;
    _data['display_login'] = displayLogin;
    _data['gravatar_id'] = gravatarId;
    _data['url'] = url;
    _data['avatar_url'] = avatarUrl;
    return _data;
  }
}

class Repo {
  Repo({
    required this.id,
    required this.name,
    required this.url,
  });
  late final int id;
  late final String name;
  late final String url;

  Repo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Payload {
  Payload({
    required this.pushId,
    required this.size,
    required this.distinctSize,
    required this.ref,
    required this.head,
    required this.before,
    required this.commits,
  });
  late final int pushId;
  late final int size;
  late final int distinctSize;
  late final String ref;
  late final String head;
  late final String before;
  late final List<Commits> commits;

  Payload.fromJson(Map<String, dynamic> json){
    pushId = json['push_id'];
    size = json['size'];
    distinctSize = json['distinct_size'];
    ref = json['ref'];
    head = json['head'];
    before = json['before'];
    commits = List.from(json['commits']).map((e)=>Commits.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['push_id'] = pushId;
    _data['size'] = size;
    _data['distinct_size'] = distinctSize;
    _data['ref'] = ref;
    _data['head'] = head;
    _data['before'] = before;
    _data['commits'] = commits.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Commits {
  Commits({
    required this.sha,
    required this.author,
    required this.message,
    required this.distinct,
    required this.url,
  });
  late final String sha;
  late final Author author;
  late final String message;
  late final bool distinct;
  late final String url;

  Commits.fromJson(Map<String, dynamic> json){
    sha = json['sha'];
    author = Author.fromJson(json['author']);
    message = json['message'];
    distinct = json['distinct'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sha'] = sha;
    _data['author'] = author.toJson();
    _data['message'] = message;
    _data['distinct'] = distinct;
    _data['url'] = url;
    return _data;
  }
}

class Author {
  Author({
    required this.email,
    required this.name,
  });
  late final String email;
  late final String name;

  Author.fromJson(Map<String, dynamic> json){
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['name'] = name;
    return _data;
  }
}