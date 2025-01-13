package dao;

import model.Property;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PropertyDAO {

    private static final String jdbcURL = "jdbc:mysql://localhost:3306/tcomplex_management?useSSL=false&serverTimezone=UTC";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "locvip92";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Kết nối thành công!");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Property> getAllProperties() throws SQLException {
        List<Property> properties = new ArrayList<>();
        String query = "SELECT * FROM properties ORDER BY area ASC";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Property property = new Property();
                property.setId(rs.getInt("id"));
                property.setCode(rs.getString("code"));
                property.setArea(rs.getDouble("area"));
                property.setStatus(rs.getString("status"));
                property.setFloor(rs.getInt("floor"));
                property.setType(rs.getString("type"));
                property.setDescription(rs.getString("description"));
                property.setPrice(rs.getDouble("price"));
                property.setStartDate(rs.getString("startDate"));
                property.setEndDate(rs.getString("endDate"));
                properties.add(property);
            }
        }
        return properties;
    }

    public void addProperty(Property property) throws SQLException {
        String query = "INSERT INTO properties (code, area, status, floor, type, description, price, startDate, endDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, property.getCode());
            ps.setDouble(2, property.getArea());
            ps.setString(3, property.getStatus());
            ps.setInt(4, property.getFloor());
            ps.setString(5, property.getType());
            ps.setString(6, property.getDescription());
            ps.setDouble(7, property.getPrice());
            ps.setDate(8, Date.valueOf(property.getStartDate()));
            ps.setDate(9, Date.valueOf(property.getEndDate()));
            ps.executeUpdate();
        }
    }

    public void deleteProperty(int id) throws SQLException {
        String query = "DELETE FROM properties WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
