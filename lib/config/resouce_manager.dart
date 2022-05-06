class ImageHelper{
  static const String baseUrl ='';
  static const String img ="https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1256863125,2563728258&fm=26&gp=0.jpg";
  static const String emptyImg="assets/img/null.png";
  static String wrapUrl(String url) {
    if (url.startsWith('http')) {
      return url;
    }else{}
    return baseUrl + url;
  }

  static String wrapAssets(String url) {
    return "assets/img/" + url;
  }
}