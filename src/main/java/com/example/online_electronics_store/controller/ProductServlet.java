package com.example.online_electronics_store.controller;

import com.example.online_electronics_store.dao.impl.CategoryDAO;
import com.example.online_electronics_store.dao.impl.ProductDAO;
import com.example.online_electronics_store.model.Category;
import com.example.online_electronics_store.model.Product;
import com.example.online_electronics_store.service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "home":
                    toHomePage(response);
                    break;
                case "view":
                    displayByPage(request, response);
                    break;
                case "sort":
                    sortProducts(request, response);
                    break;
                case "viewByAdmin":
                    displayForAdmin(request, response);
                    break;
//                case "signup":
//                    signup(request, response);
//                    break;
//                case "login":
//                    login(request, response);
//                    break;
//                case "update":
//                    // update
//                    break;
                default:
                    displayDefault(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createProduct(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "update":
                try {
                    updateProduct(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                try {
                    deleteProduct(request,response);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void displayDefault(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String path = ProductService.getInstance().renderDefault(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
    }

    private void displayByPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String path = ProductService.getInstance().renderPage(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
    }

    private void displayDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ProductService.getInstance().renderDetails(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop/product-details.jsp");
        dispatcher.forward(request, response);
    }

    private void toHomePage(HttpServletResponse response) throws SQLException, ServletException, IOException {
        response.sendRedirect("/shop/index.jsp");
    }

    private void sortProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/shop/shop.jsp");
        String condition = request.getParameter("condition");
        List<Product> sortedList = ProductDAO.getInstance().sort(condition);
        List<Category> categories = CategoryDAO.getInstance().findAll();
        request.setAttribute("products", sortedList);
        request.setAttribute("categories", categories);
        dispatcher.forward(request, response);
    }

    private void displayForAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/product.jsp");
        List<Product> products = ProductDAO.getInstance().findAll();
        List<Category> categories = CategoryDAO.getInstance().findAll();
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        dispatcher.forward(request, response);
    }

    private void createProduct(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException {
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        boolean stock = false;
        if (request.getParameter("stock").equals("true")) {
            stock = true;
        }
        Long categoryId = Long.parseLong(request.getParameter("category"));
        Product product = new Product(name,price,description,image,stock,CategoryDAO.getInstance().findById(categoryId));
        ProductDAO.getInstance().insert(product);
        response.sendRedirect("http://localhost:8080/product?action=viewByAdmin");
    }

    private void deleteProduct(HttpServletRequest request,HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        ProductDAO.getInstance().delete(id);
        response.sendRedirect("http://localhost:8080/product?action=viewByAdmin");
    }

    private void updateProduct(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
        ProductService.getInstance().update(request);
        response.sendRedirect("http://localhost:8080/product?action=viewByAdmin");
    }

}
