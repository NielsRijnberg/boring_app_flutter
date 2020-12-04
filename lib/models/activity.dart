class Activity {
  static const int itemCount = 5;

  String activity;
  num accessibility;
  String type;
  int participants;
  num price;
  String link;
  String key;

  Activity(
      {this.activity,
      this.accessibility,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key});

  Activity.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    accessibility = json['accessibility'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'];
    link = json['link'];
    key = json['key'];
  }

  double getAccessibilityRating() {
    return (this.accessibility * itemCount).round().toDouble();
  }

  double getPriceRating() {
    return (this.price * itemCount).round().toDouble();
  }
}

final Activity likedActivity = Activity(
    activity: 'Learn Flutter',
    accessibility: 0.8,
    type: 'education',
    participants: 1,
    price: 0.0,
    link: '',
    key: '');

List<Activity> favorites = [likedActivity];

List<String> types = [
  'education',
  'recreational',
  'social',
  'diy',
  'charity',
  'cooking',
  'relaxation',
  'music',
  'busywork'
];
