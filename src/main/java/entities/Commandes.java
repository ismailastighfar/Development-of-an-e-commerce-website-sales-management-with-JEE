package entities;

import java.sql.Date;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Commandes {

	@Id
	@GeneratedValue
	private int codeCmd;
	private String client;
	private int codeArt;
	private int qteCmd;
	private Date dateCmd;
	
	public Commandes() {
		super();
	}
	
	public Commandes(int codeCmd, String client, int codeArt, int qteCmd, Date dateCmd) {
		super();
		this.codeCmd = codeCmd;
		this.client = client;
		this.codeArt = codeArt;
		this.qteCmd = qteCmd;
		this.dateCmd = dateCmd;
	}
	
	public int getCodeCmd() {
		return codeCmd;
	}
	
	public void setCodeCmd(int codeCmd) {
		this.codeCmd = codeCmd;
	}
	
	public String getClient() {
		return client;
	}
	
	public void setClient(String client) {
		this.client = client;
	}
	
	public int getCodeArt() {
		return codeArt;
	}
	
	public void setCodeArt(int codeArt) {
		this.codeArt = codeArt;
	}
	
	public int getQteCmd() {
		return qteCmd;
	}
	
	public void setQteCmd(int qteCmd) {
		this.qteCmd = qteCmd;
	}
	
	public Date getDateCmd() {
		return dateCmd;
	}
	
	public void setDateCmd(Date dateCmd) {
		this.dateCmd = dateCmd;
	}
	
}
