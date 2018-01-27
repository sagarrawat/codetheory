package com.codetheory.web.dao;

import com.codetheory.web.model.User;
import com.codetheory.web.viewModel.Register;
import java.util.List;

public interface UserDAO {
    public void addUser(User user);
    public User getUserById(int id);
    public User getUserByUsername(String username);
    public void updateUser(User user);
    public int updateUser(String p , String np , String u);
    public void deleteUser(int id);
    public boolean userExist(String username);
    public List<User> getAllUsers();
    public void registerUser (Register reg);
    public List<String> suggest(String name);
}