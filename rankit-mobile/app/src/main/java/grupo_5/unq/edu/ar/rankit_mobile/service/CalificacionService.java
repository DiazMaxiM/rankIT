package grupo_5.unq.edu.ar.rankit_mobile.service;

import java.util.List;

import model.Calificacion;
import retrofit.Callback;
import retrofit.http.GET;

/**
 * Created by Yo on 10/11/2016.
 */

public interface CalificacionService {
    @GET("/calificaciones")
    void getLibros(Callback<List<Calificacion>> callback);
}
