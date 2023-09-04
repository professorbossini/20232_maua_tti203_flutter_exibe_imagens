class ImageModel {
  late String url;
  late String alt;

  ImageModel(this.url, this.alt);

  // ImageModel.fromJSON(decodedJSON) {
  //   alt = decodedJSON['photos'][0]['alt'];
  //   url = decodedJSON['photos'][0]['src']['medium'];
  // }

  ImageModel.fromJSON(decodedJSON)
      : alt = decodedJSON['photos'][0]['alt'],
        url = decodedJSON['photos'][0]['src']['medium'];

  @override
  String toString() {
    return 'url: $url, alt: $alt';
  }
}
