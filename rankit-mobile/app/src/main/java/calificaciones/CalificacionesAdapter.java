package calificaciones;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;

import grupo_5.unq.edu.ar.rankit_mobile.DetalleCalificacionActivity;
import grupo_5.unq.edu.ar.rankit_mobile.R;

/**
 * Created by Yo on 9/11/2016.
 */

public class CalificacionesAdapter extends RecyclerView.Adapter<CalificacionesAdapter.CalificacionesViewHolder> {
    ArrayList<Calificacion> calificaciones;
    Activity activity;

    public CalificacionesAdapter(ArrayList<Calificacion> calificaciones,Activity activity){
        this.calificaciones=calificaciones;
        this.activity=activity;
    }
    //infla
    @Override
    public CalificacionesViewHolder onCreateViewHolder(ViewGroup parent, int viewType){
        View v= LayoutInflater.from(parent.getContext()).inflate(R.layout.calificacion_row,parent,false);
        return  new CalificacionesViewHolder(v);
    }
    //asocia un elemento de la lista con cada view
    @Override
    public void  onBindViewHolder(CalificacionesViewHolder calificacionesViewHolder,int position){
        final  Calificacion calificacion=calificaciones.get(position);
        calificacionesViewHolder.nombreCalificado.setText(calificacion.getEvaluado().getNombre());
        calificacionesViewHolder.nombreCalificado.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                Toast.makeText(activity,calificacion.getEvaluado().getNombre(),Toast.LENGTH_SHORT).show();
                Intent intent=new Intent(activity, DetalleCalificacionActivity.class);
                intent.putExtra("nombre",calificacion.getEvaluado().getNombre());
                intent.putExtra("puntos",calificacion.getPuntos());
                intent.putExtra("motivo",calificacion.getDetalle());
                activity.startActivity(intent);
            }
        });

    }


    @Override
    public int getItemCount(){
        //cantidad de elementos que contiene la lista
        return calificaciones.size();
    }




    public  static class CalificacionesViewHolder extends RecyclerView.ViewHolder{
        TextView nombreCalificado;
        public CalificacionesViewHolder(View itemView){
            super(itemView);
            nombreCalificado=(TextView) itemView.findViewById(R.id.nombreCalificado);
        }
    }
}
