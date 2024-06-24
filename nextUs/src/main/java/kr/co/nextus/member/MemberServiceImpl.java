package kr.co.nextus.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper; // MemberMapper 주입

    @Override
    public boolean regist(MemberVO vo) {
        return mapper.regist(vo) == 1; // 가입 성공 여부 반환
    }

    @Override
    public int emailCheck(String email) {
        return mapper.emailCheck(email);
    }

    @Override
    public MemberVO login(MemberVO vo) {
        return mapper.login(vo);
    }


    @Override
    public MemberVO detail(MemberVO vo) {
        return mapper.detail(vo);
    }
    
    @Override
    public int update(MemberVO vo) {
        return mapper.update(vo);
    }

    @Override
    public MemberVO findId(MemberVO vo) {
    	return mapper.findId(vo);
         // 결과가 null이 아니면 true 반환
    }

    @Override
    public MemberVO findByEmail(String email) {
        return mapper.findByEmail(email);
    }

    @Override
    public boolean checkMemberExist(String email) {
        // 실제 데이터베이스에서 회원을 조회하여 존재하는지 확인
        // 예시로 직접 구현한 메서드 호출
        return mapper.findByEmail(email)==null ? false : true;
    } 
    
    public boolean insertMember(MemberVO vo) {
        try {
        	mapper.insertMember(vo);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public String getAccessToken(String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=2acf526c8960600ac4bb86eac6ea31ab"); // 카카오 개발자 페이지에서 발급받은 클라이언트 ID
            sb.append("&redirect_uri=http://localhost:8090/member/kakaocallback"); // 등록된 Redirect URI
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder response = new StringBuilder();

            while ((line = br.readLine()) != null) {
                response.append(line);
            }

            br.close();
            bw.close();

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(response.toString());

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    }

    @Override
    public HashMap<String, Object> getUserInfo(String access_Token) {
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder response = new StringBuilder();

            while ((line = br.readLine()) != null) {
                response.append(line);
            }

            br.close();

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(response.toString());

            if (element.isJsonObject()) {
                JsonObject jsonObject = element.getAsJsonObject();

                if (jsonObject.has("kakao_account")) {
                    JsonObject kakao_account = jsonObject.getAsJsonObject("kakao_account");
                    String email = kakao_account.has("email") ? kakao_account.getAsJsonPrimitive("email").getAsString() : null;
                    userInfo.put("email", email);
                }

                if (jsonObject.has("properties")) {
                    JsonObject properties = jsonObject.getAsJsonObject("properties");
                    String nickname = properties.has("nickname") ? properties.getAsJsonPrimitive("nickname").getAsString() : null;
                    userInfo.put("nickname", nickname);
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return userInfo;
    }

    @Override
    public boolean processKakaoLogin(HashMap<String, Object> userInfo) {
        String email = (String) userInfo.get("email");

        if (email == null) {
            return false; // 이메일 정보가 없으면 처리 불가능
        }

        // DB에서 해당 이메일로 회원 조회
        MemberVO member = mapper.findByEmail(email);

        if (member != null) {
            // 이미 회원으로 등록된 경우, 추가적인 로그인 처리 또는 세션 등의 처리 가능
            return true;
        } else {
            // 새로운 회원으로 DB에 저장
            String nickname = (String) userInfo.get("nickname");
            MemberVO newMember = new MemberVO();
            newMember.setEmail(email);
            newMember.setNickname(nickname);

            // 신규 회원 등록
            int result = mapper.insertMember(newMember);

            return result > 0;
        }
    }
   
	
	@Override
	public int sellerRegist(int no) {
		mapper.sellerRegist(no);
		return 1;
	}
	
	//관리자
	@Override
	public Map list(MemberVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<MemberVO> list = mapper.list(param); // 목록
        
        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);
        
        // 하단에 페이징처리
        int endPage = (int)(Math.ceil(param.getPage()/10.0)*10);
        int startPage = endPage - 9;
        if (endPage > totalPage) endPage = totalPage;
        boolean isPrev = startPage > 1;
        boolean isNext = endPage < totalPage;
        map.put("endPage", endPage);
        map.put("startPage", startPage);
        map.put("isPrev", isPrev);
		map.put("isNext", isNext);
		return map;
	}
	
	//10개씩 출력하는게 아니라 한번에 쫘르륵 하게하는거임요ㅋ
	@Override
	public Map listAtOnce(MemberVO param) {
		List<MemberVO> list = mapper.listAtOnce(param);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}

	//제재내역추가할때 누적신고횟수 보여주는놈
	@Override
	public Map<String, Object> reportCountList(MemberVO param,int isSeller) {
		List<MemberVO> list;
		if(isSeller==0) {
			list=mapper.memberReportCountList(param);
		}else {
			list=mapper.sellerReportCountList(param);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}

    @Override
    public void updatePassword(String email, String newPassword) {
    	Map<String, String> map = new HashMap<>();
    	map.put("pwd", newPassword);
    	map.put("email", email);
        mapper.updatePassword(map);
    }
	
}
