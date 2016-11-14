package model;

/**
 * Created by Yo on 9/11/2016.
 */

public class PuntuablesBasico {
    int id;
    String nombre;
    TipoDePuntuable tipo;

    public PuntuablesBasico(String nombre, TipoDePuntuable tipo) {
        this.nombre = nombre;
        this.tipo=tipo;
    }
    public PuntuablesBasico(){
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

    public TipoDePuntuable getTipo() {
        return tipo;
    }

    public void setTipo(TipoDePuntuable tipo) {
        this.tipo = tipo;
    }
}
