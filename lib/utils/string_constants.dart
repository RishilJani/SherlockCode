// ignore_for_file: constant_identifier_names

// region App Data
const String APPLICATION_NAME = "SherlockCode";
const String VERSION_NO = "1.0.0";
const String DU_URL = "https://www.darshan.ac.in/";
const String ANDROID_APP_URL = "URL Here";
const String IOS_APP_URL = "URL Here";
const String SHARE_APP_MESSAGE =
    'Start you journey of cyber security by learning Encryption Decryption algorithms practically';
const String APP_LOGO_PATH = 'assets/image/SherlockCode.jpg';
const String DU_LOGO_PATH = 'assets/image/DU_Logo.jpeg';
const String ASWDC_LOGO_PATH = 'assets/image/ASWDC.jpeg';
// endregion

// region AppBar title
const String APPBAR_TITLE_DASHBOARD = "Dashboard";
const String APPBAR_TITLE_ENCRYPTION = "Encryption";
const String APPBAR_TITLE_DECRYPTION = "DECRYPTION";
// endregion

// region Encryption Methods
const String EN_CEASER_CIPHER = "Ceaser Cipher";
const String EN_ATBASH_CIPHER = "Atbash Cipher";
const String EN_RAIL_FENCE = "Rail Fence";
const String EN_PLAY_FAIR = "PlayFair";

const String CEASER_CIPHER_DESC =
    "Caesar cipher is one of the simplest and most widely known encryption techniques, where each letter is shifted exactly k places.(Generally 3)";
const String ATBASH_CIPHER_DESC =
    "The Atbash cipher is a particular type of monoalphabetic cipher formed by taking the alphabet and mapping it to its reverse, so that the first letter becomes the last letter, the second letter becomes the second to last letter, and so on.";
const String RAIL_FENCE_DESC = "This is Rail Fence Cipher";
const String PLAY_FAIR_DESC = "This is play fair cipher";
// endregion

// region enum
enum EncryptionDecryptionTypes {
  CeaseCipher,
  Atbash_Cipher,
  Rail_Fence_Cipher,
  Play_Fair_Cipher
}

List<EncryptionDecryptionTypes> encryptionDecryptionMethods = EncryptionDecryptionTypes.values;
// endregion

// region Routes
const String RT_SPLASH_SCREEN = "/splash_screen";
const String RT_DASHBOARD = "/dashboard";
const String RT_MAIN_SCREEN = "/main_screen";
const String RT_FEEDBACK_SCREEN = "/feedback_screen";
const String RT_ABOUT_US_SCREEN = "/about_us_screen";
const String RT_DASHBOARD_ENCRYPT_DECRYPT = "/dashboard_encrypt_decrypt";

const String RT_ENCRYPTION_VIEW = "/encryption_view";
const String RT_DECRYPTION_VIEW = "/decryption_views";

const String RT_ENCRYPTION_VIEW2 = "/encryption_view_2";
// endregion

// region Get Tags
const String TAG_ENCRYPT = "encrypt";
const String TAG_DECRYPT = "decrypt";
// endregion

// region ApiConstants
const String BASE_URL =
    "http://api.aswdc.in/Api/MST_AppVersions/PostAppFeedback/AppPostFeedback";

const String API_APP_NAME = "AppName";
const String API_VERSiON_NO = "VersionNo";
const String API_PLATFORM = "Platform";
const String API_PERSON_NAME = "PersonName";
const String API_MOBILE = "Mobile";
const String API_EMAIL = "Email";
const String API_MESSAGE = "Message";
const String API_REMARKS = "Remarks";
const String API_KEY = "API_KEY";

// endregion
