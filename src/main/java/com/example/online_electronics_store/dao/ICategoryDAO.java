package com.example.online_electronics_store.dao;

import com.example.online_electronics_store.model.Category;

public interface ICategoryDAO extends InterfaceDAO<Category, Long> {
    Category  findByName(String name);

}
