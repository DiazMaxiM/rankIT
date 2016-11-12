package model;

/**
 * Created by Yo on 9/11/2016.
 */

public class Calificacion {
    int id;
    PuntuableBasico evaluado;
    int puntos;
    int promedio;
    String detalle;

    public Calificacion(PuntuableBasico evaluado,int promedio,int puntos, String detalle,int id) {
        this.evaluado = evaluado;
        this.promedio=promedio;
        this.puntos = puntos;
        this.detalle = detalle;
        this.id=id;
    }
    public Calificacion(){

    }

    public PuntuableBasico getEvaluado() {
        return evaluado;
    }

    public void setEvaluado(PuntuableBasico evaluado) {
        this.evaluado= evaluado;
    }

    public void setGenero(PuntuableBasico evaluado) {
        this.evaluado = evaluado;
    }

    public int getPromedio() {
        return promedio;
    }

    public void setPromedio(int promedio) {
        this.promedio = promedio;
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
