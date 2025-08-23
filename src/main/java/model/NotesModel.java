package model;

import dao.DBConnect;

public class NotesModel {

	private int noteid;
	private String title;
	private String description;
	private String photo;
	private String createdate;
	private String email;
	
	
	public NotesModel(String title,String desc,String photo,String email)	
	{
		this.title=title;
		this.description=desc;
		this.photo=photo;
		this.setEmail(email);
	}
	
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNoteid() {
		return noteid;
	}
	public void setNoteid(int noteid) {
		this.noteid = noteid;
	}
	
	public boolean insertData() throws Exception {
		DBConnect c = new DBConnect();
		c.QueryExecuter(
	"insert into notes(title,description,photo,email) values ('"
		+ this.getTitle() + "','" + this.getDescription() 
		+ "','" + this.getPhoto()	+ "','"+this.getEmail()+ "')");
		return true;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
