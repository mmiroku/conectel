package model
{
	import mx.collections.ArrayCollection;
	
	[RemoteClass(alias="mx.com.gahm.conenctel.model.Usuario")]
	public class Usuario
	{
		public var usuario:String;
		public var contrasena:String;
		public var nombreCompleto:String;
		public var activo:Boolean;
		
		public var idsPantallas:ArrayCollection;
		public var perfil:Catalogo;
		
		public function Usuario()
		{
		}
	}
}