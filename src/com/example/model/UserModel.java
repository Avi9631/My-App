package com.example.model;

import java.util.ArrayList;
import java.util.List;

public class UserModel {
	private String userName;
	private String userEmail;
	private String userMobile;
//	public static List<NotebookModel> notebookList=new ArrayList<>();
	public static List<NotebookModel> noteBookListCopy=new ArrayList<>();
	public static List<NotesModel> noteList=new ArrayList<>();

	public UserModel(String userName, String userEmail, String userMobile) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userMobile = userMobile;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	
	
	
}
