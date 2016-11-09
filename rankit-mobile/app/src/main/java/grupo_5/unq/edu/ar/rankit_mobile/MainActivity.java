package grupo_5.unq.edu.ar.rankit_mobile;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

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
        Intent intent=new Intent(this,CalificacionesDelUsuarioActivity.class);
        startActivity(intent);
    }
}
