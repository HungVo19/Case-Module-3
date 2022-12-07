package com.example.online_electronics_store.controller;

import com.example.online_electronics_store.service.impl.FeedbackService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ReviewServlet", value = "/review")
public class ReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        controller(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        controller(request, response);
    }

    private void controller(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "comment":
                    comment(request, response);
                    break;
                case "rate":
                    rating(request, response);
                    break;
                default:
            }
        } catch (SQLException | ServletException | IOException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void comment(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException, ClassNotFoundException {
        Long id = FeedbackService.getInstance().comment(request);
        response.sendRedirect("product?action=details&id=" + id);
    }

    private void rating(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        Long id = FeedbackService.getInstance().rate(request);
        response.sendRedirect("product?action=details&id=" + id);
    }
}
