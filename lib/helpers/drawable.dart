//Urutkan Berdasarkan Abjad A-Z
enum AssetGambar {
  logo,
  bell,
}
class DrawableX{
  //Urutkan Berdasarkan Abjad A-Z
  static String imageAsset(AssetGambar assetGambar){
    switch (assetGambar){
      case AssetGambar.logo      : return "assets/logo/djubli.png";
      case AssetGambar.bell      : return "assets/components/bell.png";
    }
  }
}
