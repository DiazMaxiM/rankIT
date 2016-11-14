package grupo_5.unq.edu.ar.rankit_mobile.service;

import org.json.JSONObject;

import java.util.List;

import model.Calificacion;
import model.Usuario;
import retrofit.Callback;
import retrofit.client.Response;
import retrofit.http.Body;
import retrofit.http.DELETE;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.PUT;

/**
 * Created by Yo on 10/11/2016.
 */

public interface CalificacionService {
 @GET("/calificaciones/{id}")
 public void getCalificaciones(@retrofit.http.Path("id") String id , Callback<List<Calificacion>> callback);

 @POST("/calificaciones")
 public void getCalificacion(@retrofit.http.Body Calificacion calificacion,Callback<Response>callback);

 @DELETE("/calificaciones/{id}")
 public void deleteCalificacion(@retrofit.http.Path("id") int id , Callback<Response> callback);

 @PUT("/calificaciones")
 public void updateCalificacion(@retrofit.http.Body Calificacion calificacion,Callback<Response>callback);

}
