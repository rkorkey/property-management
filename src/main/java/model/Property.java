
package model;


public class Property {
    private int id;
    private String code;  // Mã mặt bằng
    private double area;  // Diện tích
    private String status;  // Trạng thái
    private int floor;  // Tầng
    private String type;  // Loại văn phòng
    private String description;  // Mô tả chi tiết
    private double price;  // Giá cho thuê
    private String startDate;  // Ngày bắt đầu
    private String endDate;  // Ngày kết thúc

    public Property() {
    }

    public Property(int id, String code, String status, double area, int floor, String type, String description, double price, String startDate, String endDate) {
        this.id = id;
        this.code = code;
        this.status = status;
        this.area = area;
        this.floor = floor;
        this.type = type;
        this.description = description;
        this.price = price;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
