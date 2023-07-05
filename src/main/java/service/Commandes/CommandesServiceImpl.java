package service.Commandes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.Commandes.ICommandesDAO;
import entities.Commandes;

@Service
@Transactional
public class CommandesServiceImpl implements ICommandesService {
	
	private ICommandesDAO cmddao;
	
	public void setCmddao(ICommandesDAO cmddao) {
		this.cmddao = cmddao;
	}

	
	
	@Override
	public void addCommande(Commandes c) {
		cmddao.addCommande(c);
		
	}

	@Override
	public List<Commandes> listsCommandes() {
		
		return cmddao.listsCommandes();
	}

	@Override
	public Commandes getCommande(int codeCmd) {
		
		return cmddao.getCommande(codeCmd);
	}

	@Override
	public void deleteCommande(int codeCmd) {
		cmddao.deleteCommande(codeCmd);
		
	}

	@Override
	public void updateCommande(Commandes c) {
		cmddao.updateCommande(c);
	}

	
}
