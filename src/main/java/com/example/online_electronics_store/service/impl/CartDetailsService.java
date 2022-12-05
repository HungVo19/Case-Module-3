package com.example.online_electronics_store.service.impl;

import com.example.online_electronics_store.model.CartDetails;
import com.example.online_electronics_store.model.User;
import com.example.online_electronics_store.service.ICartDetailsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class CartDetailsService implements ICartDetailsService {
    private static CartDetailsService instance;
    private CartDetailsService() {
    }

    public static CartDetailsService getInstance() {
        if (instance == null) {
            instance = new CartDetailsService();
        }
        return instance;
    }

    @Override
    public boolean create(HttpServletRequest request) throws ServletException, IOException, SQLException {
        return false;
    }

    @Override
    public void render(HttpServletRequest request, List<CartDetails> lists) throws SQLException {

    }

    @Override
    public void update(HttpServletRequest request) throws SQLException {

    }

    @Override
    public void delete(HttpServletRequest request) {

    }

    @Override
    public CartDetails getObject(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object userObj = session.getAttribute("user");
        User user = (User) userObj;
        return null;
    }
}
