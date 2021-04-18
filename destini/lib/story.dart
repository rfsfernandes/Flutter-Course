class Story {
  String _storyTitle;
  String _choice1;
  String _choice2;

  Story({storyTitle: String, choice1: String, choice2: String}) {
    this._storyTitle = storyTitle;
    this._choice1 = choice1;
    this._choice2 = choice2;
  }

  String get choice2 => _choice2;

  String get choice1 => _choice1;

  String get storyTitle => _storyTitle;

}
