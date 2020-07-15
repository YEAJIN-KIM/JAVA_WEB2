package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Person;

public class PersonDao {

	public int insert (Connection conn, Person person) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement
			("insert into person (name, address, age, registerTime) values (?,?,?,?)");
			pstmt.setString(1, person.getName());
			pstmt.setString(2, person.getAddress());
			pstmt.setInt(3, person.getAge());
			pstmt.setTimestamp(4, new Timestamp(person.getRegisterTime().getTime()));
			return pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}
	}
	
	public int update (Connection conn, Person person) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement
			("update person set name=?, address=?, age=?, "
					+ "registertime=? where personId=?");
			pstmt.setString(1, person.getName());
			pstmt.setString(2, person.getAddress());
			pstmt.setInt(3, person.getAge());
			pstmt.setTimestamp(4, new Timestamp(person.getRegisterTime().getTime()));
			pstmt.setInt(5, person.getPersonId());
			return pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}
	}
	
	public Person select (Connection conn, int personId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement
					("select * from person where personId = ?");
			pstmt.setInt(1, personId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				Person person = new Person();
				person.setPersonId(rs.getInt("personId"));
				person.setName(rs.getString("name"));
				person.setAddress(rs.getString("address"));
				person.setAge(rs.getInt("age"));
				person.setRegisterTime(rs.getTimestamp("registerTime"));
				return person;
			} else {
				return null;
			}
		} finally {
			pstmt.close();
			rs.close();
		}
	}
	
	public int delete(Connection conn, int personId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement
					("delete from person where personId = ?");
			pstmt.setInt(1, personId);
			return pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}
	}
	
	public List<Person> selectList (Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from person");
			rs = pstmt.executeQuery();  //전체 레코드 가져오기
			if (rs.next()){
				List<Person> personList = new ArrayList<Person>();
				do {
					Person person = new Person();
					person.setPersonId(rs.getInt("personId"));
					person.setName(rs.getString("name"));
					person.setAddress(rs.getString("address"));
					person.setAge(rs.getInt("age"));
					person.setRegisterTime(rs.getTimestamp("registerTime"));
					personList.add(person);
				} while (rs.next());
				return personList;
			} else {
				return null;
			}
		} finally {
			pstmt.close();
			rs.close();
		}
	}
}

















