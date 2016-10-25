package excepciones


import org.uqbar.commons.model.UserException

class PasswordIncorrectoException extends UserException {
	
	new(String message) {
		super(message)
	}
	
}