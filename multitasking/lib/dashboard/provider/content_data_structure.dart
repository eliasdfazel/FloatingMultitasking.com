class ContentDataStructure {

  String _packageName = "";

  String _applicationName = "";
  String _applicationSummary = "";
  String _applicationDescription = "";

  String _applicationIcon = "";
  String _applicationCover = "";
  /// CSV Of Screenshots Links
  String _applicationScreenshots = "";

  String _applicationYoutube = "https://www.youtube.com/@GeeksEmpireCo/community";
  String _applicationX = "https://twitter.com/GeeksEmpire";
  String _applicationFacebook = "https://facebook.com/GeeksEmpire";

  ContentDataStructure(String inputPackageName, String inputApplicationName, String inputApplicationSummary, String inputApplicationDescription,
      String inputApplicationIcon, String inputApplicationCover, String inputApplicationScreenshots,
      String inputApplicationYoutube, String inputApplicationX, String inputApplicationFacebook) {

    _packageName = inputPackageName;

    _applicationName = inputApplicationName;
    _applicationSummary = inputApplicationSummary;
    _applicationDescription = inputApplicationDescription;

    _applicationIcon = inputApplicationIcon;
    _applicationCover = inputApplicationCover;
    _applicationScreenshots = inputApplicationScreenshots;

    _applicationYoutube = inputApplicationYoutube;
    _applicationX = inputApplicationX;
    _applicationFacebook = inputApplicationFacebook;

  }

  String packageNameValue() {

    return _packageName.toString();
  }

  String applicationNameValue() {

    return _applicationName.toString();
  }

  String applicationSummaryValue() {

    return _applicationSummary.toString();
  }

  String applicationDescriptionValue() {

    return _applicationDescription.toString();
  }

  String applicationIconValue() {

    return _applicationIcon.toString();
  }

  String applicationCoverValue() {

    return _applicationCover.toString();
  }

  List<String> applicationScreenshotsValue() {

    return _applicationScreenshots.toString().split(",");
  }

  String applicationYoutubeValue() {

    return _applicationYoutube.toString();
  }

  String applicationXValue() {

    return _applicationX.toString();
  }

  String applicationFacebookValue() {

    return _applicationFacebook.toString();
  }

}