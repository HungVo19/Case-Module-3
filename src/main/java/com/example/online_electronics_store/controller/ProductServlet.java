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
                    sortProducts(request,response);
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

    private void toHomePage(HttpServletResponse response) throws SQLException, ServletException, IOException {
        response.sendRedirect("/shop/index.jsp");
    }

    private void sortProducts(HttpServletRequest request,HttpServletResponse response) throws SQLException, ServletException, IOException {
//        String path = ProductService.getInstance().renderDefault(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/shop/shop.jsp");
        String condition = request.getParameter("condition");
        List<Product> sortedList = ProductDAO.getInstance().sort(condition);
        List<Category> categories = CategoryDAO.getInstance().findAll();
        request.setAttribute("products",sortedList);
        request.setAttribute("categories",categories);
        dispatcher.forward(request,response);
    }
}
