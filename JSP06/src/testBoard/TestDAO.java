package testBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TestDAO {
	private String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
	private String id = "java";
	private String pwd="1234";
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TestDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<TestDTO> list() {
		String sql = "select * from paging order by num desc";
		ArrayList<TestDTO> listDto = new ArrayList<TestDTO>();
		try{
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				TestDTO dto = new TestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setCount(rs.getInt("count"));
				dto.setTitle(rs.getString("title"));
				dto.setPdate(rs.getString("pdate"));
				listDto.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return listDto;
	}
	
	public void insert(TestDTO dto) {		//test_num.nextval: 가상의 넘버링, 시퀀스로 만든 test_num의 다음 값을 넣어준다는 뜻. 
		String sql = "insert into Paging(num, title, pdate, count) values(test_num.nextval, ?, sysdate, 0)";
		
		try{
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void count(int num) {
		String sql = "update paging set count = count+1 where num ="+num;
		
		try{
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getTotalPage() {	//시퀀스 번호를 찾으면(시퀀스는 숫자가 들어갈 때 사이에 몇 개가 빠지는 경우가 종종 발생) 페이지수에 오차가 생기므로
								//rownum으로 숫자를 찾을 것.
		String sql = "select count(*) from paging";	//현재 등록된 내용물 총 갯수(4행이면 4가 나옴)
		int totalPage = 0;
		try{
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) totalPage = rs.getInt(1);	//인덱스 1인 NUM의 총 갯수를 가져와(등록된 내용물 갯수) totalPage에 넣고 반환
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return totalPage;
	}
}

/* 생성한 sql 구문
create table paging(num number not null,
title varchar2(30) not null,
pdate varchar2(10) not null,
count number not null,
primary key(num));

create sequence test_num;
*/

/*sql 별칭 주는 방법
select a.num from(select * from paging order by num desc)a where num between 1 and 3;
(모든 값을 내림차순으로 가져온다)의 결과가 a에 들어가고 -> a.num으로 a를 쓴다. => a의 값을 1~3 사이에 있는 num만 보겠다
*/

/*최종적으로 사용할, 페이징을 위한 sql문.. rn은 rownum에게 붙여준 별칭.
select B.* from(select rownum rn, A.* from(
  select * from paging order by num desc)A)B	num을 내림차순으로 정렬하여 모든 값을 가져와서 A에 저장
    where rn between 변수명 and 변수명;				rownum을 변수명~변수명 사이의 결과만 보여달라
*/
