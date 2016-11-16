package grupo_5.unq.edu.ar.rankit_mobile.service;

import java.util.List;

import model.Usuario;
import retrofit.Callback;
import retrofit.client.Response;
import retrofit.http.POST;
import retrofit.http.PUT;

/**
 * Created by Yo on 10/11/2016.
 */

public interface UsuarioService {

    @POST("/usuarios")
   public void getUsuarioId(@retrofit.http.Body Usuario usuario, Callback<Usuario> callback);

    @PUT("/usuarios")
    public void setRegistroUsuario(@retrofit.http.Body Usuario usuario, Callback<Response> callback);
}
