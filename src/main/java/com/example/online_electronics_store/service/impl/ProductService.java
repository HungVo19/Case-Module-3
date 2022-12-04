package com.example.online_electronics_store.service.impl;

import com.example.online_electronics_store.dao.impl.ProductDAO;
import com.example.online_electronics_store.model.Product;
import com.example.online_electronics_store.service.IProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService {
    @Override
    public boolean create(HttpServletRequest request) {
        return false;
    }

    @Override
    public void render(HttpServletRequest request, List<Product> lists) {

    }

    @Override
    public void update(HttpServletRequest request) {

    }

    @Override
    public void delete(HttpServletRequest request) {

    }

    @Override
    public Product getObject(HttpServletRequest request) {
        return null;
    }

    public void renderPage(HttpServletRequest request) throws SQLException {
        int index = (Integer.parseInt(request.getParameter("index")) - 1) * 3;
        List<Product> productsPage = ProductDAO.getInstance().pagingProduct(index);
        request.setAttribute("products", productsPage);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product?action=view&page=" + index);
    }
}
