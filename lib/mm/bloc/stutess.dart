abstract class NewsState{}
class NewInitialState extends NewsState{}
class NewChangeBottomNavState extends NewsState{}
class NewsGetBusinessSuccess extends NewsState{}
class NewsLoudingBusiness extends NewsState{}

class NewsGetBusinessError extends NewsState{
  final String error;

  NewsGetBusinessError(this.error);
}
class NewsGetSportsSuccess extends NewsState{}
class NewsLoudingSports extends NewsState{}

class NewsGetSportsError extends NewsState{
  final String error;

  NewsGetSportsError(this.error);


}
class NewsGetScienceSuccess extends NewsState{}
class NewsLoudingScience extends NewsState{}

class NewsGetScienceError extends NewsState{
  final String error;
  NewsGetScienceError(this.error);
}
class NewsGetSerchSuccess extends NewsState{}
class NewsLoudingSerch extends NewsState{}

class NewsGetSerchError extends NewsState{
  final String error;
  NewsGetSerchError(this.error);
}



class NewsGetSearchSuccess extends NewsState{}
class NewsLoudingSearch extends NewsState{}

class NewsGetSearchError extends NewsState{
  final String error;
  NewsGetSearchError(this.error);
}
