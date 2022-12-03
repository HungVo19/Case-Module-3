package com.example.online_electronics_store.model;

public class Product {
   private Long id;
   private String name;
   private Double price;
   private String description;
   private String image;
   private Boolean stockStatus;

   private Category categories;

   public Product() {
   }

   public Product(Long id, String name, Double price, String description, String image, Boolean stock_status, Boolean status, Category categories) {
      this.id = id;
      this.name = name;
      this.price = price;
      this.description = description;
      this.image = image;
      this.stockStatus = stock_status;
      this.categories = categories;
   }



   public Long getId() {
      return id;
   }

   public void setId(Long id) {
      this.id = id;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public Double getPrice() {
      return price;
   }

   public void setPrice(Double price) {
      this.price = price;
   }

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public String getImage() {
      return image;
   }

   public void setImage(String image) {
      this.image = image;
   }

   public Boolean getStock_status() {
      return stockStatus;
   }

   public void setStock_status(Boolean stock_status) {
      this.stockStatus = stock_status;
   }


   public Category getCategories() {
      return categories;
   }

   public void setCategories(Category categories) {
      this.categories = categories;
   }
}
