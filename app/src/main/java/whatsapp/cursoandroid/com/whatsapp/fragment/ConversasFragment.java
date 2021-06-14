package whatsapp.cursoandroid.com.whatsapp.fragment;


import android.content.Intent;
import android.os.Bundle;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;



import java.util.ArrayList;

import whatsapp.cursoandroid.com.whatsapp.R;
import whatsapp.cursoandroid.com.whatsapp.activity.ConversaActivity;
import whatsapp.cursoandroid.com.whatsapp.adapter.ConversaAdapter;
import whatsapp.cursoandroid.com.whatsapp.config.ConfiguracaoFirebase;
import whatsapp.cursoandroid.com.whatsapp.helper.Base64Custom;
import whatsapp.cursoandroid.com.whatsapp.helper.Preferencias;
import whatsapp.cursoandroid.com.whatsapp.model.Conversa;

/**
 * A simple {@link Fragment} subclass.
 */
public class ConversasFragment extends Fragment {

    private ListView listView;
    private ArrayAdapter<Conversa> adapter;
    private ArrayList<Conversa> conversas;

    private DatabaseReference firebase;
    private ValueEventListener valueEventListenerConversas;

    public ConversasFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(final LayoutInflater inflater, final ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_conversas, container, false);

        // Monta listview e adapter
        conversas = new ArrayList<>();
        listView = (ListView) view.findViewById(R.id.lv_conversas);
        adapter = new ConversaAdapter(getActivity(), conversas );
        listView.setAdapter( adapter );

        // recuperar dados do usuário
        Preferencias preferencias = new Preferencias(getActivity());
        String idUsuarioLogado = preferencias.getIdentificador();

        // Recuperar conversas do Firebase
        firebase = ConfiguracaoFirebase.getFirebase()
                    .child("conversas")
                    .child( idUsuarioLogado );

        valueEventListenerConversas = new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {

                conversas.clear();
                for ( DataSnapshot dados: dataSnapshot.getChildren() ){
                    Conversa conversa = dados.getValue( Conversa.class );
                    conversas.add(conversa);
                }
                adapter.notifyDataSetChanged();

            }

            @Override
            public void onCancelled(DatabaseError databaseError) {

            }
        };

        //Adicionar evento de clique na lista
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Conversa conversa = conversas.get(position);
                Intent intent = new Intent(getActivity(), ConversaActivity.class );

                intent.putExtra("nome", conversa.getNome() );
                String email = Base64Custom.decodificarBase64( conversa.getIdUsuario() );
                intent.putExtra("email", email );

                startActivity(intent);

            }
        });

        return view;

    }

    @Override
    public void onStart() {
        super.onStart();
        firebase.addValueEventListener(valueEventListenerConversas);
    }

    @Override
    public void onStop() {
        super.onStop();
        firebase.removeEventListener(valueEventListenerConversas);
    }
}
