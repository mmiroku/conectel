package mx.com.gahm.conenctel.services;

import java.io.Serializable;
import java.util.List;

import javax.ejb.Remote;

import mx.com.gahm.conenctel.model.Usuario;

@Remote
public interface IUsuarioService extends Serializable {
	public List<Usuario> getAll();
	
	public Usuario login(String user, String password);
}
