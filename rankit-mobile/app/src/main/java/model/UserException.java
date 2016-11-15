package model;

import org.json.JSONObject;

import retrofit.RetrofitError;
import retrofit.mime.TypedByteArray;

/**
 * Created by maxi on 15/11/16.
 */

public class UserException {

    private String msg;

    public String obtenerError(RetrofitError error) {
        try{
            String json =  new String(((TypedByteArray)error.getResponse().getBody()).getBytes());
            JSONObject jsonObject = new JSONObject(json);
            msg= jsonObject.get("error").toString();
        }catch(Exception e) {
            msg= "Se produjo un error inesperado";
        }
    return msg;
    }



}
