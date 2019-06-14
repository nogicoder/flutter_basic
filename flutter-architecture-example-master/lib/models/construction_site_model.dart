class ConstructionSiteModel {  
  final int id;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String title;
  final int zones;
  final int levels;
  final int posts;
  final double longitude;
  final double latitude;
  final String picture;
  final String thumbnail;
  final String tags;
  final String description;

  ConstructionSiteModel(
    {
      this.id,
      this.address,
      this.city,
      this.state,
      this.zip,      
      this.title, 
      this.zones,
      this.levels,
      this.posts,
      this.longitude,
      this.latitude,
      this.picture,
      this.thumbnail,
      this.description,
      this.tags,      
      }
    );

  ConstructionSiteModel.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    address = json['address'],
    city = json['city'],
    state = json['state'],
    zip = json['zip'],
    title = json['title'],
    zones = json['zones'],
    levels = json['levels'],
    posts = json['posts'],
    longitude = json['longitude'],
    latitude = json['latitude'],
    picture = json['picture'],
    thumbnail = json['thumbnail'],
    description = json['description'],
    tags = json['tags']
  ;

  Map<String, dynamic> toJson() => {
    'id': id,
    'address': address,
    'city': city,
    'state': state,
    'zip': zip,
    'title': title,
    'zones': zones,
    'levels': levels,
    'posts': posts,
    'longitude': longitude,
    'latitude': latitude,
    'picture': picture,
    'thumbnail': thumbnail,
    'description': description,
    'tags': tags
  };
}