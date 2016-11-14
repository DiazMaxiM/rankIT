package grupo_5.unq.edu.ar.rankit_mobile.service;

import java.util.List;

import model.PuntuablesBasico;
import retrofit.Callback;
import retrofit.http.GET;

/**
 * Created by Yo on 13/11/2016.
 */

public interface EvaluadosService {
    @GET("/evaluados")
    public void getEvaluados(Callback<List<PuntuablesBasico>> callback);
}
