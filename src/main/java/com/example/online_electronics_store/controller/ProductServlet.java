package com.example.online_electronics_store.controller;

import com.example.online_electronics_store.dao.impl.ProductDAO;
import com.example.online_electronics_store.model.Product;

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
                case "view":

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
                    displayAll(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void displayAll(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> products = ProductDAO.getInstance().findAll();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop/shop.jsp");
        dispatcher.forward(request, response);
    }

    private void displayByPage(HttpServletRequest request, HttpServletResponse response) {
        int index = Integer.parseInt(request.getParameter("page"));
    }
}
