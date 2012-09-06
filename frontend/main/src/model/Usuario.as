package model
{
	import mx.collections.ArrayCollection;

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