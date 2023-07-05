package dao.Commandes;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entities.Commandes;

public class CommandesDAOImpl implements ICommandesDAO {
	
	@PersistenceContext
	private EntityManager eManager;

	@Override
	public void addCommande(Commandes c) {
		eManager.persist(c);	
	}

	@Override
	public List<Commandes> listsCommandes() {
		Query req = eManager.createQuery("SELECT c from Commandes c");
		return req.getResultList();
	}

	@Override
	public Commandes getCommande(int codeCmd) {
		
		return eManager.find(Commandes.class,codeCmd);
	}

	@Override
	public void deleteCommande(int codeCmd) {
		Commandes commande = getCommande(codeCmd);
		eManager.remove(commande);
		
	}

	@Override
	public void updateCommande(Commandes c) {
		eManager.merge(c);
		
	}

}
