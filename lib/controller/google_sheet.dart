import 'package:gsheets/gsheets.dart';
import 'package:mdc_anies/controller/sheet_column.dart';

class GoogleSheet {
  static const String _sheetId = "1Vv69TJB61izU--s8XtM6tzA9-SSBV2V1mVusbV2i45c";
  static const _gKey = r'''
{
  "type": "service_account",
  "project_id": "future-bucksaw-317319",
  "private_key_id": "c9e0824223ac565d0f88d8fd41810e0b9c3d4c1c",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDRIyt9s1o/QoZS\nwbZq1R8F1Efjz67tpnQudZB7elx006yl+c/w4ehwpERZ+/WIh6Re537XOgDFO7sm\nJ2V6Xy6VI0/qF7cfZ3fzek45Az5Li7jdTvJLtHQVpub496HNNZbl4es98+WtllGb\nEoC6bgYBl4fdWgqfRoVIxRYDA0o0U0jG8zeh0SJrLuPQibWj5714JprgpdBjli1X\nxh94aAk5B90HfleGwok69ZJs2cY1k4yRnkPE+HkjQPIJbdY53oRhI6hGeXAHB1D4\nfweulIQc+IVONkxMhXhmh6wKXR+epcUKLq3iAFTsZPqT+jYNbxbvtNO6S0DhW6xh\nLXuMxU4RAgMBAAECggEAU+N3noRCvv1ARBHPyiqStxPfglHcKReLotcljWIXlAUU\nS79Y2ZbEVeqOQEoAwzMli6vwBQUPKg47k6JZ4iwr00bG12+L1Nz8EH4Owm+6nTL+\nhEcWiadoqQa5v0QVcur8DFoCsmcSyf5x3XIekKlxX1IY/YEQobL346iqm6rGKRZE\n/KC4ROio7krYqtbqeDZId2vG5WLALEDBEHQ+ls3gIAvZTn/K3WXvAfePHwos5Hmf\nx4pECtBkOECb4epsCCeodGawNmKBUIRm153FapoOwoF3AhP2MGDovcz//0ZTgVgd\nwFi38bVpALxCW1PzUKDEMy6Ap3B7XTQXdbeLwpvzwQKBgQD59BzvBYe/1e5ygt2N\n4+d2lGRt6N8czwJBVwR+d8TVeBy8gG3m8WUqzhJ5+LAtpZHPh6/i4+gKOo8KJ+NY\nuu+2GlpcTmq0gsbMXYzNEoUpWcgQezW0kNrCix71sU+sYhObvCKf690wL7zeMn6l\n6AuuEQ1SKPNaFBqgisabokVMmwKBgQDWMktoL4U89ujO5DEC/JrWGpAtHMP/oGkZ\nfQsGo/amc6y2AcGB5/AGALByIzSK3TnyAPO4Fa+G+cmMjN+Vd0MYK4cIEC6ZXT5D\n03YTQ2hjXZjp9fQMFTCezzMiXLr/jIugQ2OKWqmBYrOcYoMOJ1/HaNVu99thSwAG\n6WuwwwEcwwKBgQCqsEs55prnI95rkHZfuOyNi5Rxgf8qmyq9GAFXo85kwFtPVpy2\ngs5FRuhTJsKYyWIjSFOSK3R/17FqjAayxyV/Q8vFET/I+S1szc2jFSyeKlN2/cyU\n+/6Hr516xpTT8T3WsckrUFSB3XeqfO0DusyPF9Hy80gLkYMFcv9htJSCVQKBgCrr\ncQizXPNWVlf+iYObsjrsn68qcGusbOLal3cBK882pojh2TB6lTHeuXxlaYXZxl6j\nqjJcxgs5yhULtVFx0FPrhOcstumsMWnN2X8KpsQiYR2gVwKEzHVF920PP7ktJF08\no5l5iTWP3YWch74yTZLbgsj1iVP5f0vjQdztdi+ZAoGBANiEoYNH3jbxbmUtSPNN\nSM3K5qSqL/elqg0/NuRIUuN91V60n754Q1vN4NK2cpuyI8PulOxTdscrkkg1QjxH\nwDjraq6IRJ7aBDnejZ9MgeXAoMtHML0tYSIEVManEl6l5Bz2RggAGG69aYDoUo3c\n+SbmzIjxIFrRdUztQHv7mYsP\n-----END PRIVATE KEY-----\n",
  "client_email": "fluttergooglesheets@future-bucksaw-317319.iam.gserviceaccount.com",
  "client_id": "112285957673804834844",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fluttergooglesheets%40future-bucksaw-317319.iam.gserviceaccount.com"
}
''';

  static Worksheet? _userWorksheet;
  static final _gsheets = GSheets(_gKey);

  static Future init() async {
    try {
      final spreedsheets = await _gsheets.spreadsheet(_sheetId);
      _userWorksheet = await _getWorksheet(spreedsheets, title: "datayao");
      final firstRow = SheetColumn.getColumn();
      _userWorksheet!.values.insertRow(1, firstRow);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  static Future<Worksheet?> _getWorksheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title);
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    _userWorksheet?.values.map.appendRows(rowList);
  }
}
