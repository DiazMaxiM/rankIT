package excepciones


import org.uqbar.commons.model.UserException

class NombreInvalidoException extends UserException{
	
	new(String message) {
		super(message)
	}
	
}