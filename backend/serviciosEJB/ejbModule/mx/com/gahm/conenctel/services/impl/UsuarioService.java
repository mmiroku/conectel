package mx.com.gahm.conenctel.services.impl;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;

import mx.com.gahm.conenctel.model.Catalogo;
import mx.com.gahm.conenctel.model.Usuario;
import mx.com.gahm.conenctel.services.IFooService;
import mx.com.gahm.conenctel.services.IUsuarioService;

/**
 * Session Bean implementation class UsuarioService
 */
@Stateless(mappedName = "ejb/UsuarioService")
public class UsuarioService implements IUsuarioService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public UsuarioService() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public List<Usuario> getAll() {
		// TODO Auto-generated method stub
		List<Usuario> temp;
		temp = new ArrayList<Usuario>();
		Usuario user = null;
		user = new Usuario();
		user.setActivo(false);
		user.setContrasena("notiene");
		user.setIdsPantallas(null);
		user.setNombreCompleto("Manuel Gaytan");
		Catalogo perfil = new Catalogo();
		perfil.setId(1l);
		perfil.setEtiqueta("Operador");
		user.setPerfil(perfil );
		user.setUsuario("mgaytan");
		temp.add( user );
		user = new Usuario();
		user.setActivo(false);
		user.setContrasena("notiene");
		user.setIdsPantallas(null);
		user.setNombreCompleto("Miriam Ballesteros");
		perfil = new Catalogo();
		perfil.setId(2l);
		perfil.setEtiqueta("Gerente");
		user.setPerfil(perfil );
		user.setUsuario("mballesteros");
		temp.add( user );
		return temp;
	}

	@Override
	public Usuario login(String user, String password) {
		// TODO Auto-generated method stub
		Usuario userLogged = null;
		if( user.equals(password) ){
			userLogged = new Usuario();
			userLogged.setActivo(false);
			userLogged.setContrasena("notiene");
			userLogged.setIdsPantallas(null);
			userLogged.setNombreCompleto("Manuel Gaytan");
			Catalogo perfil = new Catalogo();
			perfil.setId(1l);
			perfil.setEtiqueta("Operador");
			userLogged.setPerfil(perfil );
			userLogged.setUsuario("mgaytan");
		}
		return userLogged;
	}
    
}
