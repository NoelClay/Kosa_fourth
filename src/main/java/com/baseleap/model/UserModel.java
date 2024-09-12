package com.baseleap.model;

public class UserModel {

    private int id;
    private String email;
    private String password;
    private String nickName;
    private String profileImage;
    private String userIntroduce;
    private String createdTime;
    private String lastLoginTime;
    private String validationQuizQuestion;
    private String validationQuizAnswer;


    public UserModel() {
    }

    public UserModel(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }

    public String getUserIntroduce() {
        return userIntroduce;
    }

    public void setUserIntroduce(String userIntroduce) {
        this.userIntroduce = userIntroduce;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getValidationQuizQuestion() {
        return validationQuizQuestion;
    }

    public void setValidationQuizQuestion(String validationQuizQuestion) {
        this.validationQuizQuestion = validationQuizQuestion;
    }

    public String getValidationQuizAnswer() {
        return validationQuizAnswer;
    }

    public void setValidationQuizAnswer(String validationQuizAnswer) {
        this.validationQuizAnswer = validationQuizAnswer;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "UserModel{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", nickName='" + nickName + '\'' +
                ", profileImage='" + profileImage + '\'' +
                ", userIntroduce='" + userIntroduce + '\'' +
                ", createdTime='" + createdTime + '\'' +
                ", lastLoginTime='" + lastLoginTime + '\'' +
                ", validationQuizQuestion='" + validationQuizQuestion + '\'' +
                ", validationQuizAnswer='" + validationQuizAnswer + '\'' +
                '}';
    }
}
