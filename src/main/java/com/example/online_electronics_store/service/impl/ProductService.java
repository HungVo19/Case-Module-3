package com.example.online_electronics_store.service.impl;

import com.example.online_electronics_store.dao.impl.CategoryDAO;
import com.example.online_electronics_store.dao.impl.ProductDAO;
import com.example.online_electronics_store.model.Category;
import com.example.online_electronics_store.model.Product;
import com.example.online_electronics_store.service.IProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService {
    private static ProductService instance;
    private ProductService() {
    }

    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }
        return instance;
    }

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

    public String renderPage(HttpServletRequest request) throws SQLException {
        int index = Integer.parseInt(request.getParameter("page"));
        List<Product> productsPage = ProductDAO.getInstance().pagingProduct((index - 1) * 6);
        return render(request, index, productsPage);
    }

    public String renderDefault(HttpServletRequest request) throws SQLException {
        int index = 1;
        List<Product> productsPage = ProductDAO.getInstance().pagingProduct(0);
        return render(request, index, productsPage);
    }

    private String render(HttpServletRequest request, int index, List<Product> productsPage) throws SQLException {
        int count = ProductDAO.getInstance().getTotalCount();
        int pages = count / 6;
        if (count % 6 != 0) {
            pages++;
        }
        List<Category> categories = CategoryDAO.getInstance().findAll();
        request.setAttribute("index", index);
        request.setAttribute("products", productsPage);
        request.setAttribute("pages", pages);
        request.setAttribute("categories", categories);
        return  "/shop/shop.jsp";
    }
}
