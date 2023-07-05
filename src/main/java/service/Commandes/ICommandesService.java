package service.Commandes;

import java.util.List;

import entities.Commandes;

public interface ICommandesService {
	
	public void addCommande(Commandes c);
	public List<Commandes> listsCommandes();	
	public Commandes getCommande (int codeCmd);
	public void deleteCommande(int codeCmd);
	public void updateCommande(Commandes c);

}
