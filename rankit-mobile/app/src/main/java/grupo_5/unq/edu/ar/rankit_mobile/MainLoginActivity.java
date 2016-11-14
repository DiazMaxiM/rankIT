package grupo_5.unq.edu.ar.rankit_mobile;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;


import grupo_5.unq.edu.ar.rankit_mobile.service.UsuarioService;
import model.IServiceFactory;
import model.Usuario;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

/**
 * Created by Yo on 9/11/2016.
 */

public class MainLoginActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
    }

    @Override
    protected void onResume() {
        super.onResume();

        EditText usuarioText= (EditText)findViewById(R.id.usuario);
        EditText passText= (EditText)findViewById(R.id.password);

        usuarioText.setText("");
        passText.setText("");
    }

    public void ingresar(View view){
        EditText usuarioText= (EditText)findViewById(R.id.usuario);
        EditText passText= (EditText)findViewById(R.id.password);

        Usuario loginUsuario = new Usuario();
        loginUsuario.setNombre(usuarioText.getText().toString());

        EditText passwordText= (EditText)findViewById(R.id.password);
        loginUsuario.setPassword(passwordText.getText().toString());

       validarUsuario(loginUsuario);

    }

    private void validarUsuario(Usuario miUsuario) {


        new IServiceFactory().getServiceFactoryFor(UsuarioService.class).getUsuarioId(miUsuario,new Callback<Usuario>() {

            @Override
            public void success(Usuario usuario, Response response) {
                pantallaCalificacionDelUsuario(usuario);

            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getBaseContext(),error.getBody().toString(),Toast.LENGTH_SHORT);
            }
        });
    }


    private void pantallaCalificacionDelUsuario(Usuario usuarioLogeado) {
        Intent intent=new Intent(this,CalificacionListActivity.class);
        intent.putExtra(CalificacionDetailFragment.ID,usuarioLogeado.getId());
        startActivity(intent);
    }
}
