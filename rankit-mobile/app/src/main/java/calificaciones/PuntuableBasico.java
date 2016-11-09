package calificaciones;

/**
 * Created by Yo on 9/11/2016.
 */

public class PuntuableBasico {
    Long id;

    String nombre;
    String tipo;

    public PuntuableBasico(String nombre,String tipo) {

        this.nombre = nombre;
        this.tipo=tipo;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
