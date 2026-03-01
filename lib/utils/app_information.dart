class AppInformation {
  static String getVersion() {
    return "3.4.2";
  }

  static String supportURL() {
    return "https://github.com/ldeso/call-tracker";
  }

  static String supportEmail() {
    return "hello@leodesouza.net";
  }

  static Uri getReportLink() {
    Uri reportLink = Uri.parse('https://github.com/ldeso/call-tracker/issues');
    return reportLink;
  }

  static Uri getRepoLink() {
    Uri reportLink = Uri.parse('https://github.com/ldeso/call-tracker');
    return reportLink;
  }

}
