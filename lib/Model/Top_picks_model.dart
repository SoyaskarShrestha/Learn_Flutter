
class TopPicksModel {
  String? icon;
  String? imageUrl;
  String? title;
  double? rating;

  TopPicksModel({this.imageUrl, this.title, this.rating});
}


final List<TopPicksModel> topPicksList = [
  TopPicksModel(
    imageUrl: 'https://i.ibb.co/TbJ9cwZ/movie3.jpg',
    title: 'Breaking Bad',
    rating: 8.5
  ),
  TopPicksModel(
      imageUrl: 'https://i.ibb.co/QCT5fMF/movie2.jpg',
      title: 'Barry',
      rating: 5.4
  ),
  TopPicksModel(
      imageUrl: 'https://i.ibb.co/XVYT7M7/movie1.jpg',
      title: 'OMG',
      rating: 9.5,
  ),

];