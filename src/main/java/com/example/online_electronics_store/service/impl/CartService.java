package com.example.online_electronics_store.service.impl;

import com.example.online_electronics_store.model.Cart;
import com.example.online_electronics_store.service.ICartService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class CartService implements ICartService {
    @Override
    public boolean create(HttpServletRequest request) throws ServletException, IOException, SQLException {
        return false;
    }

    @Override
    public void render(HttpServletRequest request, List<Cart> lists) throws SQLException {

    }

    @Override
    public void update(HttpServletRequest request) throws SQLException {

    }

    @Override
    public void delete(HttpServletRequest request) {

    }

    @Override
    public Cart getObject(HttpServletRequest request) {

        return null;
    }
}
