package excepciones


import org.uqbar.commons.model.UserException

class NoExisteCalificacionException extends UserException {
	
	new(String message) {
		super(message)
	}
	
}