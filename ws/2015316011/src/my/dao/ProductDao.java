package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Product;

public class ProductDao {

	public int insert (Connection conn, Product product) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement
			("insert into product (name, price, productDate) values (?,?,?)");
			pstmt.setString(1, product.getName());
			pstmt.setInt(2, product.getPrice());
			pstmt.setTimestamp(3, new Timestamp(product.getProductDate().getTime()));
			return pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}
	}
	
	public int update (Connection conn, Product product) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement
			("update product set name=?, price=?, productDate=? where productId=?");
			pstmt.setString(1, product.getName());
			pstmt.setInt(2, product.getPrice());
			pstmt.setTimestamp(3, new Timestamp(product.getProductDate().getTime()));
			pstmt.setInt(4, product.getProductId());
			return pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}
	}
	
	public Product select (Connection conn, int productId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product where productId = ?");
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				Product product = new Product();
				product.setProductId(rs.getInt("productId"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getInt("price"));
				product.setProductDate(rs.getTimestamp("productDate"));
				return product;
			} else {
				return null;
			}
		} finally {
			pstmt.close();
			rs.close();
		}
	}
	
	public int delete(Connection conn, int productId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement
					("delete from product where productId = ?");
			pstmt.setInt(1, productId);
			return pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}
	}
	
	public List<Product> selectList (Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from product");
			rs = pstmt.executeQuery();  //전체 레코드 가져오기
			if (rs.next()){
				List<Product> productList = new ArrayList<Product>();
				do {
					Product product = new Product();
					product.setProductId(rs.getInt("productId"));
					product.setName(rs.getString("name"));
					product.setPrice(rs.getInt("price"));
					product.setProductDate(rs.getTimestamp("productDate"));
					productList.add(product);
				} while (rs.next());
				return productList;
			} else {
				return null;
			}
		} finally {
			pstmt.close();
			rs.close();
		}
	}
}

















