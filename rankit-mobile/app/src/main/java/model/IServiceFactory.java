package model;

import grupo_5.unq.edu.ar.rankit_mobile.service.UsuarioService;
import retrofit.RestAdapter;

/**
 * Created by maxi on 13/11/16.
 */

public class IServiceFactory {
    public IServiceFactory() {
    }

    public <T> T getServiceFactoryFor(Class<T> clases){

        String SERVER_IP_GENY = "192.168.43.31";
        String API_URL = "http://"+ SERVER_IP_GENY +":9001";

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build();
        return restAdapter.create(clases);
    }
}
