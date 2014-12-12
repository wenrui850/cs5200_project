package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Message {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String sendername;
	private String receivername;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSendername() {
		return sendername;
	}
	public void setSendername(String sendername) {
		this.sendername = sendername;
	}
	public String getReceivername() {
		return receivername;
	}
	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}
	public Message() {
		super();
	}
	public Message(String sendername, String receivername) {
		super();
		this.sendername = sendername;
		this.receivername = receivername;
	}
	public Message(int id, String sendername, String receivername) {
		super();
		this.id = id;
		this.sendername = sendername;
		this.receivername = receivername;
	}

}
