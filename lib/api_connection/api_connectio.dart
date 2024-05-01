class API {
  static const hostConnect = "http://192.168.100.90/api_space_market";
  static const hostConnectUser = "$hostConnect/user";
  static const hostConnectAdmin = "$hostConnect/admin";

  //singUp user
  static const validationEmail = "$hostConnectUser/validate_email.php";
  static const signup = "$hostConnectUser/signup.php";
  static const login = "$hostConnectUser/login.php";
  //login admin
  static const adminLogin = "$hostConnectAdmin/login.php";
}
