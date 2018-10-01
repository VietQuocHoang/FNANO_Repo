package com.viethq.bookmanage.DAO;

import com.viethq.bookmanage.DTO.Book;
import com.viethq.bookmanage.mapper.BookMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class BookDAO{
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Book> findAll() {

        String sql = "Select b.id, b.name, b.author, b.releaseDate " +
                "from tblBook b";
        List<Book> bookList = jdbcTemplate.query(sql, new BookMapper());
        return bookList;
    }

    public Book findById(int id) {
        String sql = "Select b.id, b.name, b.author, b.releaseDate " +
                "from tblBook b " +
                "where b.id=?";
        Book book = (Book) jdbcTemplate.queryForObject(sql, new Object[]{id}, new BookMapper());
        return book;
    }

    public int insert(Book b) {

        String sql = "Insert into tblBook(name, author, releaseDate) " +
                "values(?, ?, ?)";
        return jdbcTemplate.update(sql, b.getName(), b.getAuthor(), b.getReleaseDate());

    }

    public int update(Book b) {

        String sql = "Update tblBook " +
                "Set name=?, author=?, releaseDate=? " +
                "where id=?";

        return jdbcTemplate.update(sql, b.getName(), b.getAuthor(), b.getReleaseDate(), b.getId());
    }

    public int removeById(int id) {

        String sql = "Delete from tblBook where id=?";

        return jdbcTemplate.update(sql, id);
    }
}
