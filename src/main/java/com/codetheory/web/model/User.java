package com.codetheory.web.model;


public class User {
    private Long id;
    private String username;
    private String name;
    private String password;
    private String email;
    
    public void setId (long id){
        this.id = id;
    }
    public long getId (){
        return this.id;
    }

    public void setUsername (String username){
        this.username = username;
    }
    public String getUsername (){
        return this.username;
    }

    public void setName (String name){
        this.name = name;
    }
    public String getName (){
        return this.name;
    }

    public void setEmail (String email){
        this.email = email;
    }
    public String getEmail (){
        return this.email;
    }

}