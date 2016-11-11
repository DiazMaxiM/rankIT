package model;

/**
 * Created by Yo on 9/11/2016.
 */

public class Calificacion {
        Long id;
        PuntuableBasico evaluado;
        String puntos;
        String detalle;

        public Calificacion(PuntuableBasico evaluado, String puntos, String detalle) {
            this.evaluado = evaluado;
            this.puntos = puntos;
            this.detalle = detalle;
        }
        public Calificacion(){

        }

        public PuntuableBasico getEvaluado() {
            return evaluado;
        }

        public void setGenero(PuntuableBasico evaluado) {
            this.evaluado = evaluado;
        }

        public Long getId() {
            return id;
        }

        public void setId(Long id) {
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


        public String toString() {
            return getEvaluado().getNombre();
        }
}
