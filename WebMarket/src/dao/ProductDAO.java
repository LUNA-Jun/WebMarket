package dao;

import java.sql.*;
import java.util.ArrayList;
import org.apache.jasper.tagplugins.jstl.core.Out;
import dto.ProductDTO;

public class ProductDAO {
	private ArrayList<ProductDTO> listOfProducts = new ArrayList<>();
	
	private static ProductDAO instance = new ProductDAO(); 
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static String url = "jdbc:mariadb://3.35.235.65:3306/project";
	private static String user = "jundb";
	private static String password = "1q2w3e4r";
	
	public static ProductDAO getInstacne() {
		return instance;
	}
	
	public ProductDAO() {
	}

	public ArrayList<ProductDTO> getAllProducts(){
		String sql = "select * from product";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product = new ProductDTO();
				
				product.setProductId(rs.getString("p_id"));
				product.setName(rs.getString("p_name"));
				product.setPrice(rs.getInt("p_price"));
				product.setDescription(rs.getString("p_description"));
				product.setCategory(rs.getString("p_category"));
				product.setStock(rs.getLong("p_stock"));
				product.setState(rs.getString("p_state"));
				product.setFilename(rs.getString("p_filename"));
				
				listOfProducts.add(product);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				System.out.println("DB연동 해제");
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return listOfProducts;
	}
	

	public ProductDTO getProductById(String productId) {
		String sql = "select * from product where p_id =?";
		ProductDTO productById = new ProductDTO();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				return null;
			}
			
			if(rs.next()) {
				productById.setProductId(rs.getString("p_id"));
				productById.setName(rs.getString("p_name"));
				productById.setPrice(rs.getInt("p_price"));
				productById.setDescription(rs.getString("p_description"));
				productById.setCategory(rs.getString("p_category"));
				productById.setStock(rs.getLong("p_stock"));
				productById.setState(rs.getString("p_state"));
				productById.setFilename(rs.getString("p_filename"));
			}
		}catch(Exception e) {
			e.getMessage();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				System.out.println("DB연동 해제");
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return productById;
	}
	
	public void addProduct(ProductDTO product) {
		listOfProducts.add(product);
	}
	
	public Connection getConnection() {
		// TODO Auto-generated method stub
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB연동 완료");
		}catch (Exception e) {
			System.out.println("DB연동 실패");
			System.out.println("DB연동 실패 이유 : ");
			e.printStackTrace();
		}
		return conn;
	}
}
