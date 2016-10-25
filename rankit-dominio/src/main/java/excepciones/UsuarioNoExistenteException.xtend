package excepciones


import org.uqbar.commons.model.UserException

class UsuarioNoExistenteException extends UserException {
	
	new(String message) {
		super(message)
	}
	
}