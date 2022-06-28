//Urutkan Berdasarkan Abjad A-Z
enum AssetGambar {
  logo,
  bell,
  kris,
}
class DrawableX{
  //Urutkan Berdasarkan Abjad A-Z
  static String imageAsset(AssetGambar assetGambar){
    switch (assetGambar){
      case AssetGambar.logo      : return "assets/logo/djubli.png";
      case AssetGambar.bell      : return "assets/components/bell.png";
      case AssetGambar.kris      : return "assets/components/kris.png";
    }
  }
}
