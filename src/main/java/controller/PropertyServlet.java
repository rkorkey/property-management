package controller;

import dao.PropertyDAO;
import model.Property;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/property")
public class PropertyServlet extends HttpServlet {
    private PropertyDAO propertyDAO = new PropertyDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
            request.setAttribute("currentDate", today.toString());
            request.getRequestDispatcher("views/addProperty.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                propertyDAO.deleteProperty(id);
                response.sendRedirect("/property");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            try {
                List<Property> properties = propertyDAO.getAllProperties();
                request.setAttribute("properties", properties);
                request.getRequestDispatcher("views/listProperties.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            try {
                Property property = new Property();
                property.setCode(request.getParameter("code"));
                property.setArea(Double.parseDouble(request.getParameter("area")));
                property.setStatus(request.getParameter("status"));
                property.setFloor(Integer.parseInt(request.getParameter("floor")));
                property.setType(request.getParameter("type"));
                property.setDescription(request.getParameter("description"));
                property.setPrice(Double.parseDouble(request.getParameter("price")));

                String startDateStr = request.getParameter("startDate");
                String endDateStr = request.getParameter("endDate");

                if (startDateStr.isEmpty() || endDateStr.isEmpty()) {
                    throw new IllegalArgumentException("Ngày bắt đầu và ngày kết thúc không được để trống.");
                }

                java.sql.Date startDate = java.sql.Date.valueOf(startDateStr);
                java.sql.Date endDate = java.sql.Date.valueOf(endDateStr);

                java.sql.Date today = new java.sql.Date(System.currentTimeMillis());

                java.util.Calendar calendar = java.util.Calendar.getInstance();
                calendar.setTime(today);
                calendar.add(java.util.Calendar.DAY_OF_MONTH, 1);
                java.sql.Date tomorrow = new java.sql.Date(calendar.getTimeInMillis());

                if (startDate.before(tomorrow)) {
                    request.setAttribute("error", "Ngày bắt đầu phải từ ngày " + tomorrow.toString() + " trở đi.");
                    request.getRequestDispatcher("views/addProperty.jsp").forward(request, response);
                    return;
                }

                property.setStartDate(startDateStr);
                property.setEndDate(endDateStr);

                propertyDAO.addProperty(property);
                response.sendRedirect("/property");

            } catch (IllegalArgumentException e) {
                request.setAttribute("error", "Lỗi dữ liệu nhập vào: " + e.getMessage());
                request.getRequestDispatcher("views/addProperty.jsp").forward(request, response);
            } catch (SQLException e) {
                request.setAttribute("error", "Lỗi khi thêm dữ liệu vào cơ sở dữ liệu: " + e.getMessage());
                request.getRequestDispatcher("views/addProperty.jsp").forward(request, response);
            }
        }
    }


}

