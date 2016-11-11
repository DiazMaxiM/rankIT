package grupo_5.unq.edu.ar.rankit_mobile;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;

import grupo_5.unq.edu.ar.rankit_mobile.service.UsuarioService;
import model.Usuario;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

/**
 * Created by Yo on 9/11/2016.
 */

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
    }

    public void ingresar(View view){
        Usuario loginUsuario = new Usuario();
       AutoCompleteTextView usuarioText= (AutoCompleteTextView)findViewById(R.id.usuario);
        loginUsuario.setNombre(usuarioText.getText().toString());

        EditText passwordText= (EditText)findViewById(R.id.password);
        loginUsuario.setPassword(passwordText.getText().toString());

       validarUsuario(loginUsuario);

        Intent intent=new Intent(this,CalificacionListActivity.class);
        startActivity(intent);


    }

    private void validarUsuario(Usuario miUsuario) {

        UsuarioService usuarioService = crearUsuarioService();
        usuarioService.getUsuarioId(miUsuario,new Callback<Usuario>() {

            @Override
            public void success(Usuario usuario, Response response) {
                cambiarAPantallaTanto();

            }

            @Override
            public void failure(RetrofitError error) {

            }
        });
    }
    private void cambiarAPantallaTanto() {
        Intent intent=new Intent(this,CalificacionListActivity.class);
        startActivity(intent);
    }

    private UsuarioService crearUsuarioService() {
        //MMM código repetido, habría que modificar esto no?
        String SERVER_IP = "10.0.2.2"; //esta ip se usa para comunicarse con mi localhost en el emulador de Android Studio
        String SERVER_IP_GENY = "192.168.1.33";//esta ip se usa para comunicarse con mi localhost en el emulador de Genymotion
        String API_URL = "http://"+ SERVER_IP_GENY +":9001";

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build();
        UsuarioService usuarioService = restAdapter.create(UsuarioService.class);
        return usuarioService;
    }
}
