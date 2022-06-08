

final String baseUrl = "http://103.38.50.113:8070/api/v1/";


Map<String, String> getHeader() => {
  'Content-Type': 'application/json',
};

Map<String, String> getHeader1(String token) => {
  'Authorization': 'Bearer '+token,
  'Content-Type': 'application/json',
};

Map<String, String> getHeader3(String token) => {
  'Authorization': 'Bearer '+token,
};

Map<String, String> getHeader2() => {
  'Content-Type': 'image/png',
};


Map<String, String> getpdfHeader2() => {
  'Content-Type': 'application/pdf',
};

String LoginUrl = baseUrl+ 'users/login';
String RegisterUrl = baseUrl + 'users/register';
String EmailOtpUrl = baseUrl + 'otp/send-otp';

String ForgetOtpUrl = baseUrl + 'users/send-mail';


String UpdateProfileUrl = baseUrl + '/users-buyer-seller/me';
String ResendEmailOtpUrl = baseUrl + '/auth/local/resend-email-otp';
String StateUrl = baseUrl + '/states';
String AgentProfileUrl = baseUrl + '/users-agent/me';
String RealEsatesUrl = baseUrl + '/real-estate-types';
String SetUserTypeUrl = baseUrl + '/set-user-type';
String SendMobileOtpUrl = baseUrl + '/auth/local/send-mobile-otp';
String VerifyMobileOtpUrl = baseUrl + '/auth/local/verify-mobile';
String ResendMobileOtpUrl = baseUrl + '/auth/local/resend-mobile-otp';
String ImageUrl = baseUrl + '/users-custom/getUploadPresignedUrl';
String SocialLoginUrl = baseUrl+ '/auth/local/social-login';
String LandingUrl = baseUrl + '/users-landing-page';
String CreatepostUrl = baseUrl + '/posts';

String CityByNameUrl = baseUrl + '/city';
String BuyerSellerProfileUrl = baseUrl + '/users/me';
String SaveAmountUrl = baseUrl + '/post/get-saved-amount';
String FileUploadUrl = baseUrl + '/users-custom/getUploadPresignedUrl';

String BuyerContractUrl = baseUrl + '/users-custom/get-buyer-contract-template';
String SellerContractUrl = baseUrl + '/users-custom/get-seller-contract-template';

//sigin

final paramUsername = 'email';
final paramPassword = 'password';
final paramMobile = 'phoneNumber';


//Reg

final paramRegEmail = 'email';
final paramRegUsername = 'username';
final paramRegUserRoleID = 'user_role_id';

//Otp
final paramEmailOtp = 'email_otp';
final paramMobileOtp = 'mobile_otp';


final paramType = 'type';

final paramFilename = 'fileName';

//socialLogin

final paramProvider = 'provider';
final paramProviderUserId = 'provider_user_id';
final paramName = 'name';

//saveAmount
final commission = 'commission';
final minAmount = 'min_amount';
final maxAmount = 'max_amount';

//
final social = 'social_plateform';





