package whatsapp.cursoandroid.com.whatsapp.adapter;


import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

import whatsapp.cursoandroid.com.whatsapp.fragment.ContatosFragment;
import whatsapp.cursoandroid.com.whatsapp.fragment.ConversasFragment;

public class TabAdapter extends FragmentPagerAdapter {

    private String[] tituloAbas = {"CONVERSAS", "CONTATOS"};

    public TabAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int position) {

        Fragment fragment = null;

        switch (position){
            case 0:
                fragment = new Fragment();
                break;
            case 1:
                fragment = new Fragment();
                break;
        }

        return fragment;

    }

    @Override
    public int getCount() {
        return tituloAbas.length;
    }

    @Override
    public CharSequence getPageTitle(int position) {
        return tituloAbas[position];
    }
}
