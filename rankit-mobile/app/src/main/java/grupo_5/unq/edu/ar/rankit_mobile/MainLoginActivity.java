package grupo_5.unq.edu.ar.rankit_mobile;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;


import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndex;
import com.google.android.gms.appindexing.Thing;
import com.google.android.gms.common.api.GoogleApiClient;

import grupo_5.unq.edu.ar.rankit_mobile.service.UsuarioService;
import model.IServiceFactory;
import model.UserException;
import model.Usuario;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;
import retrofit.mime.TypedByteArray;

/**
 * Created by Yo on 9/11/2016.
 */

public class MainLoginActivity extends Activity {

    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    private GoogleApiClient client;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        client = new GoogleApiClient.Builder(this).addApi(AppIndex.API).build();
    }

    @Override
    protected void onResume() {
        super.onResume();

        EditText usuarioText = (EditText) findViewById(R.id.usuario);
        EditText passText = (EditText) findViewById(R.id.password);

        usuarioText.setText("");
        passText.setText("");
    }

    public void ingresar(View view) {
        EditText usuarioText = (EditText) findViewById(R.id.usuario);
        EditText passText = (EditText) findViewById(R.id.password);

        Usuario loginUsuario = new Usuario();
        loginUsuario.setNombre(usuarioText.getText().toString());

        EditText passwordText = (EditText) findViewById(R.id.password);
        loginUsuario.setPassword(passwordText.getText().toString());

        validarUsuario(loginUsuario);

    }

    public void registrar(View view){

        EditText usuarioText = (EditText) findViewById(R.id.usuario);
        EditText passText = (EditText) findViewById(R.id.password);

        Usuario registrarUsuario = new Usuario();
        registrarUsuario.setNombre(usuarioText.getText().toString());

        EditText passwordText = (EditText) findViewById(R.id.password);
        registrarUsuario.setPassword(passwordText.getText().toString());

        this.registrarUsuario(registrarUsuario);

    }

    private void registrarUsuario(Usuario miUsuario) {

        new IServiceFactory().getServiceFactoryFor(UsuarioService.class).setRegistroUsuario(miUsuario, new Callback<Response>() {

            @Override
            public void success(Response respuesta, Response response) {
                Toast.makeText(getBaseContext(),"Ya podes ingresar a Rank-IT ;)",Toast.LENGTH_SHORT).show();
            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getBaseContext(),new UserException().obtenerError(error), Toast.LENGTH_SHORT).show();
            }
        });

    }

    private void validarUsuario(Usuario miUsuario) {


        new IServiceFactory().getServiceFactoryFor(UsuarioService.class).getUsuarioId(miUsuario, new Callback<Usuario>() {

            @Override
            public void success(Usuario usuario, Response response) {
                pantallaCalificacionDelUsuario(usuario);

            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getBaseContext(),new UserException().obtenerError(error), Toast.LENGTH_SHORT).show();
            }
        });
    }


    private void pantallaCalificacionDelUsuario(Usuario usuarioLogeado) {
        Intent intent = new Intent(this, CalificacionListActivity.class);
        intent.putExtra(CalificacionDetailFragment.IDUSUARIO, usuarioLogeado.getId());
        startActivity(intent);
    }

    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    public Action getIndexApiAction() {
        Thing object = new Thing.Builder()
                .setName("MainLogin Page") // TODO: Define a title for the content shown.
                // TODO: Make sure this auto-generated URL is correct.
                .setUrl(Uri.parse("http://[ENTER-YOUR-URL-HERE]"))
                .build();
        return new Action.Builder(Action.TYPE_VIEW)
                .setObject(object)
                .setActionStatus(Action.STATUS_TYPE_COMPLETED)
                .build();
    }

    @Override
    public void onStart() {
        super.onStart();

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        client.connect();
        AppIndex.AppIndexApi.start(client, getIndexApiAction());
    }

    @Override
    public void onStop() {
        super.onStop();

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        AppIndex.AppIndexApi.end(client, getIndexApiAction());
        client.disconnect();
    }
}
