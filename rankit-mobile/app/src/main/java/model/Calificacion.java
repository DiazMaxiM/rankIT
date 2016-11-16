package model;

/**
 * Created by Yo on 9/11/2016.
 */

public class Calificacion {
    int id;
    PuntuablesBasico evaluado;
    String puntos;
    int promedio;
    String detalle;
    int usuario;

    public Calificacion(PuntuablesBasico evaluado, int promedio,String puntos, String detalle, int id,int usuario) {
        this.evaluado = evaluado;
        this.promedio=promedio;
        this.puntos = puntos;
        this.detalle = detalle;
        this.id=id;
        this.usuario=usuario;
    }
    public Calificacion(){

    }

    public PuntuablesBasico getEvaluado() {
        return evaluado;
    }

    public void setEvaluado(PuntuablesBasico evaluado) {
        this.evaluado= evaluado;
    }

    public int getPromedio() {
        return promedio;
    }

    public void setPromedio(int promedio) {
        this.promedio = promedio;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int id) {
        this.usuario = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getPuntos() {
        return  puntos;
    }

    public void setPuntos(String puntos){this.puntos = puntos;
    }


}
