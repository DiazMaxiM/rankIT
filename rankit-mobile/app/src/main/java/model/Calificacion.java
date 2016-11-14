package model;

/**
 * Created by Yo on 9/11/2016.
 */

public class Calificacion {
    int id;
    PuntuablesBasico evaluado;
    int puntos;
    int promedio;
    String detalle;
    int idUsuario;

    public Calificacion(PuntuablesBasico evaluado, int promedio, int puntos, String detalle, int id) {
        this.evaluado = evaluado;
        this.promedio=promedio;
        this.puntos = puntos;
        this.detalle = detalle;
        this.id=id;
    }
    public Calificacion(){

    }

    public PuntuablesBasico getEvaluado() {
        return evaluado;
    }

    public void setEvaluado(PuntuablesBasico evaluado) {
        this.evaluado= evaluado;
    }

    public void setGenero(PuntuablesBasico evaluado) {
        this.evaluado = evaluado;
    }

    public int getPromedio() {
        return promedio;
    }

    public void setPromedio(int promedio) {
        this.promedio = promedio;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int id) {
        this.idUsuario = id;
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

    public Integer getPuntos() {
        return  puntos;
    }

    public void setPuntos(int puntos){this.puntos = puntos;
    }


    public String toString() {
        return getEvaluado().getNombre();
    }
}
