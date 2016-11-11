package model;

/**
 * Created by Yo on 9/11/2016.
 */

public class PuntuableBasico {
    int id;

    String nombre;
    String tipo;

    public PuntuableBasico(int id,String nombre,String tipo) {
        this.id=id;
        this.nombre = nombre;
        this.tipo=tipo;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
