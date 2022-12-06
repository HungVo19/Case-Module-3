package com.example.online_electronics_store.dao.impl;

import com.example.online_electronics_store.dao.DBConnection;
import com.example.online_electronics_store.dao.IFeedbackDAO;
import com.example.online_electronics_store.model.Feedback;
import com.example.online_electronics_store.model.Product;
import com.example.online_electronics_store.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO implements IFeedbackDAO {
    private final String SELECT_BY_PRODUCT = "select * from feedback where product_id = ?;";
    private final String INSERT_FEEDBACK = "insert into feedback (user_id, product_id, comment, date) values (?,?,?,?);";
    private final String UPDATE_FEEDBACK = "update feedback set comment = ?, date = ? where user_id = ? and product_id = ?;";
    private final String CANCEL_ORDER = "delete from order_detail where order_id = ?;";
    DBConnection dbConn = DBConnection.getInstance();
    private static FeedbackDAO instance;

    private FeedbackDAO() {

    }

    public static FeedbackDAO getInstance() {
        if (instance == null) {
            instance = new FeedbackDAO();
        }
        return instance;
    }
    @Override
    public Feedback findById(Product id) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public List<Feedback> findAll() throws SQLException, ClassNotFoundException {
        return null;
    }

    public List<Feedback> findByProduct(Product product) throws SQLException {
        try (PreparedStatement statement = dbConn.getConnection().prepareStatement(SELECT_BY_PRODUCT)) {
            statement.setLong(1, product.getId());
            ResultSet result = statement.executeQuery();
            return getList(result);
        }
    }

    @Override
    public void insert(Feedback feedback) throws SQLException, ClassNotFoundException {
        try (PreparedStatement statement = dbConn.getConnection().prepareStatement(INSERT_FEEDBACK)) {
            statement.setLong(1, feedback.getUser().getId());
            statement.setLong(2, feedback.getProduct().getId());
            statement.setString(3, feedback.getComment());
            Timestamp timestamp = Timestamp.valueOf(feedback.getDate());
            statement.setTimestamp(4, timestamp);
            statement.executeUpdate();
        }
    }

    @Override
    public boolean update(Product id, Feedback feedback) throws SQLException, ClassNotFoundException {
        try (PreparedStatement statement = dbConn.getConnection().prepareStatement(UPDATE_FEEDBACK)) {
            statement.setString(1, feedback.getComment());
            Timestamp timestamp = Timestamp.valueOf(feedback.getDate());
            statement.setTimestamp(2, timestamp);
            statement.setLong(3, feedback.getUser().getId());
            statement.setLong(4, feedback.getProduct().getId());
            statement.executeUpdate();
        }
        return true;
    }

    @Override
    public boolean delete(Product id) throws SQLException, ClassNotFoundException {
        return false;
    }

    @Override
    public List<Feedback> getList(ResultSet result) throws SQLException {
        List<Feedback> feedbacks = new ArrayList<>();
        while (result.next()) {
            Long userId = result.getLong("user_id");
            User user = UserDAO.getInstance().findById(userId);
            Long productId = result.getLong("product_id");
            Product product = ProductDAO.getInstance().findById(productId);
            Integer rate = result.getInt("rate");
            String comment = result.getString("comment");
            Timestamp timestamp = result.getTimestamp("date");
            LocalDateTime localDateTime = timestamp.toLocalDateTime();
            feedbacks.add(new Feedback(user, product, rate, comment, localDateTime));
        }
        return feedbacks;
    }

    @Override
    public void setStatement(Feedback feedback, PreparedStatement statement) throws SQLException {

    }
}
