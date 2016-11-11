package model;

/**
 * Created by Yo on 10/11/2016.
 */

public class Usuario {
    String nombre;
    String password;
    int id;


    public String getNombre(){
        return nombre;
    }
    public String getPassword(){
        return password;
    }

    public void setNombre(String nombre){
        this.nombre=nombre;
    }


    public int getId(){
        return id;
    }

    public void setId(int id){
        this.id=id;
    }

    public void setPassword(String password){
        this.password=password;
    }
}
