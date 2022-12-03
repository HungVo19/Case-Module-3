package com.example.online_electronics_store.dao;

import com.example.online_electronics_store.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO implements ICategoryDAO{
    private final Connection connection;
    private final String SELECT_ALL_CATEGORIES = "select * from category;";
    private final String SELECT_CATEGORY_BY_ID = "select * from category where id=?;";

    public CategoryDAO(){
        connection = DBConnection.getConnection();
    }

    @Override
    public Category findByName(String name) {
        return null;
    }

    @Override
    public Category findById(Long id) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public List<Category> findAll() throws SQLException, ClassNotFoundException {
        List<Category> categories = new ArrayList<>();
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORIES)){
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Long id = resultSet.getLong("id");
                String name = resultSet.getString("name");
                return new Category(id, name);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void insert(Category category) throws SQLException, ClassNotFoundException {

    }

    @Override
    public boolean update(Long id, Category category) throws SQLException, ClassNotFoundException {
        return false;
    }

    @Override
    public boolean delete(Long id) throws SQLException, ClassNotFoundException {
        return false;
    }

    @Override
    public List<Category> getList(ResultSet result) throws SQLException {
        return null;
    }
}
