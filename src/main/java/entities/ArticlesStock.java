package entities;

import javax.persistence.Entity;

import javax.persistence.Id;

@Entity
public class ArticlesStock {

	@Id
	private int codeArt;
	private int qteArt;
	private String nomArt;
	private String descArt;
	private int prixArt;
	
	public ArticlesStock() {
		super();
	}
	
	public ArticlesStock(int codeArt, int qteArt, String nomArt, String descArt, int prixArt) {
		super();
		this.codeArt = codeArt;
		this.qteArt = qteArt;
		this.nomArt = nomArt;
		this.descArt = descArt;
		this.prixArt = prixArt;
	}


	public int getCodeArt() {
		return codeArt;
	}
	public void setCodeArt(int codeArt) {
		this.codeArt = codeArt;
	}
	public int getQteArt() {
		return qteArt;
	}
	public void setQteArt(int qteArt) {
		this.qteArt = qteArt;
	}
	public String getNomArt() {
		return nomArt;
	}
	public void setNomArt(String nomArt) {
		this.nomArt = nomArt;
	}
	public String getDescArt() {
		return descArt;
	}
	public void setDescArt(String descArt) {
		this.descArt = descArt;
	}
	public int getPrixArt() {
		return prixArt;
	}
	public void setPrixArt(int prixArt) {
		this.prixArt = prixArt;
	}
	
	
}
