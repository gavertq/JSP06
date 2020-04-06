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
		String sql = "select * from paging";
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
	
	public void insert(TestDTO dto) {
		String sql = "insert into Paging(num, title, pdate, count) values(test_num.nextval, ?, sysdate, 0)";
		ArrayList<TestDTO> listDto = new ArrayList<TestDTO>();
		try{
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
