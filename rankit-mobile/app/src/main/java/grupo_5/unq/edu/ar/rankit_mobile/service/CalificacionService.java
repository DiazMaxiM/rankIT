package grupo_5.unq.edu.ar.rankit_mobile.service;

import org.json.JSONObject;

import java.util.List;

import model.Calificacion;
import model.Usuario;
import retrofit.Callback;
import retrofit.client.Response;
import retrofit.http.Body;
import retrofit.http.GET;
import retrofit.http.POST;

/**
 * Created by Yo on 10/11/2016.
 */

public interface CalificacionService {
 @GET("/calificaciones/{id}")
 public void getCalificaciones(@retrofit.http.Path("id") String id , Callback<List<Calificacion>> callback);

 @POST("/calificaciones")
 public void getCalificacion(@retrofit.http.Body Calificacion calificacion,Callback<Response>callback);
}
