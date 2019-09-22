<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*,java.net.*" %>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.parser.ParseException"%>
<!-- JSON 형태를 parsing 하기 위해 필요한 클래스를 import -->
<html>
<head>
</head>
<body>
<%
	JSONParser parser = new JSONParser();
	// JSON parsing을 수행할 객체 생성

	URL link = new URL("https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey= zUqLx6mzd6HsalKgK2MeFmQr29vXkXGl&searchdate=20190801&data=AP01");
	// java.net.URL 클래스의 객체 생성
	// URL(Unifor Resource Locator)은 인터넷 상의 자원에 대해 참조하기 위한 클래스
    // 환율 API 키는 한국수출입은행에서 발급받을 수 있음

	URLConnection urlConn = link.openConnection();
	// java.net.URLConnection 클래스의 객체 생성
	// 앞서 생성한 URL에서 openConnection() 메소드를 이용
	// Application과 URL의 연결을 나타내는 모든 클래스의 슈퍼클래스 (HttpURLConnection은 이를 상속받은 것)

	BufferedReader in = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
	// 연결한 URL을 버퍼를 통해 (효율적으로) 읽기 위해 java.io.BufferedReader 객체 생성

	String inputLine;
	inputLine = in.readLine();
	// readLine은 "\n" 또는 "\r"을 만날 때까지 앞선 개행문자를 퐇마해 한 줄을 전부 읽어오는 메소드
	// 위의 URL에 접속해서 source를 보면 한 줄에 모두 입력되어 있으므로 여기에서는 반복문이 없어도 inputLine에 모든 내용이 입력됨

	JSONArray arr = (JSONArray) parser.parse(inputLine);
		// 위에서 읽어온 값을 parser로 parsing한 후 JSONArray에 저장
		// JSON은 {"key1":"value1", "key2":"value2", ...} 가 이어지는 배열로 이루어져 있는 게 기본 형식
		// [{"key1":"value1-1", "key2":"value2-1", ...}, {"key1":"value1-2", "key2":"value2-2", ...}]의 형식의 경우, 기본형식이 Array 형태로 이어짐을 관찰
		// 아래 주석은 위의 URL을 주소창에 입력했을 때 나오는 내용 중 일부

// [{"result":1,"cur_unit":"AED","ttb":"318.55","tts":"324.98","deal_bas_r":"321.77","bkpr":"321","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"321","kftc_deal_bas_r":"321.77","cur_nm":"아랍에미리트 디르함"},
// {"result":1,"cur_unit":"AUD","ttb":"801.21","tts":"817.4","deal_bas_r":"809.31","bkpr":"809","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"809","kftc_deal_bas_r":"809.31","cur_nm":"호주 달러"},
// {"result":1,"cur_unit":"BHD","ttb":"3,103.65","tts":"3,166.36","deal_bas_r":"3,135.01","bkpr":"3,135","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"3,135","kftc_deal_bas_r":"3,135.01","cur_nm":"바레인 디나르"}]

		for (Object obj : arr) {
		// 앞서 만든 Array(위에 있는 내용 전부)에 있는 원소(obj)들인 {"key1":"value1", "key2":"value2", ...}에 대해서 각각 수행
			JSONObject jsonObj = (JSONObject) obj;
			// 매개변수로 들어온 obj를 JSONObject로 해석한다고 선언

			String cur_unit = (String) jsonObj.get("cur_unit");
			// JSONJbject의 "key"가 "cur_unit"인 부분의 "value"를 변수에 대입
      String cur_nm = (String) jsonObj.get("cur_nm");
			// JSONJbject의 "key"가 "cur_nm"인 부분의 "value"를 변수에 대입

			out.println("check : " + cur_unit + " ("+cur_nm+")<br>");
			// 값이 잘 출력되는지 확인
		}

	in.close();
	// 문서를 열어서 읽었으니 닫아주는 부분

%>
</body>
</html>