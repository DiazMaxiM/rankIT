package grupo_5.unq.edu.ar.rankit_mobile.service;

import java.util.List;

import model.Usuario;
import retrofit.Callback;
import retrofit.http.POST;

/**
 * Created by Yo on 10/11/2016.
 */

public interface UsuarioService {

    @POST("/usuarios")
    void getUsuarioId(@retrofit.http.Body Usuario usuario, Callback<Usuario> callback);
}
