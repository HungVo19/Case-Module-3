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
        controller(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        controller(request, response);
    }

    private void controller(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
                case "details":
                    displayDetail(request, response);
                    break;
                case "filter":
                    displayByCategory(request, response);
                    break;
                case "display_admin":
                    displayAsAdmin(request, response);
                    break;
                case "price":
                    displayByPrice(request, response);
                    break;
                default:
                    displayDefault(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
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

    private void toHomePage(HttpServletResponse response) throws SQLException, IOException {
        response.sendRedirect("/shop/index.jsp");
    }

    private void sortProducts(HttpServletRequest request,HttpServletResponse response) throws SQLException, ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/shop/shop.jsp");
        String condition = request.getParameter("condition");
        List<Product> sortedList = ProductDAO.getInstance().sort(condition);
        List<Category> categories = CategoryDAO.getInstance().findAll();
        request.setAttribute("products", sortedList);
        request.setAttribute("categories", categories);
        dispatcher.forward(request,response);
    }

    private void displayByCategory(HttpServletRequest request,HttpServletResponse response) throws SQLException, ServletException, IOException {
        ProductService.getInstance().renderByCategory(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop/shop.jsp");
        dispatcher.forward(request, response);
    }

    private void displayAsAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ProductService.getInstance().renderProductAsAdmin(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop/admin-page.jsp");
        dispatcher.forward(request, response);
    }

    private void displayByPrice(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ProductService.getInstance().renderByPrice(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/shop/shop.jsp");
        dispatcher.forward(request, response);
    }
}
