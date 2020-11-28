package com.example.whitegoods;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

public class EmployeeNav extends AppCompatActivity {

    String userRole;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_employee_nav);

        Intent intent = getIntent();
        userRole = intent.getStringExtra("role");

        BottomNavigationView navView = findViewById(R.id.nav_view);
        navView.getMenu().clear(); //clear old inflated items.
        switch (userRole) {
            case "1":
                Toast.makeText(this, "Manager", Toast.LENGTH_SHORT).show();
                navView.inflateMenu(R.menu.bottom_nav_menu2);
                navView.setSelectedItemId(R.id.navigation_home);
                navView.setOnNavigationItemSelectedListener(navListener);

                getSupportFragmentManager().beginTransaction().replace(R.id.nav_host_fragment, new ManagerHomeFragment()).commit();
                break;
            case "2":
                Toast.makeText(this, "Employee", Toast.LENGTH_SHORT).show();
                navView.inflateMenu(R.menu.bottom_nav_menu);
                navView.setSelectedItemId(R.id.navigation_home);
                navView.setOnNavigationItemSelectedListener(navListener);

                getSupportFragmentManager().beginTransaction().replace(R.id.nav_host_fragment, new HomeFragment()).commit();
        }

    }

    private BottomNavigationView.OnNavigationItemSelectedListener navListener = new BottomNavigationView.OnNavigationItemSelectedListener() {
        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
            Fragment selectedFragment = null;

            switch (userRole) {
                case "2":
                    switch (menuItem.getItemId()) {
                        case R.id.navigation_home:
                            selectedFragment = new HomeFragment();
                            break;
                        case R.id.navigation_inventory:
                            selectedFragment = new InventoryFragment();
                            break;
                        case R.id.navigation_profile:
                            selectedFragment = new ProfileFragment();
                            break;
                    }
                    break;
                case "1":
                    switch (menuItem.getItemId()) {
                        case R.id.navigation_inventory:
                            selectedFragment = new InventoryFragment();
                            break;
                        case R.id.navigation_discount:
                            selectedFragment = new DiscountFragment();
                            break;
                        case R.id.navigation_home:
                            selectedFragment = new ManagerHomeFragment();
                            break;
                        case R.id.navigation_req:
                            selectedFragment = new RequestFragment();
                            break;
                        case R.id.navigation_emp:
                            selectedFragment = new EmployeeListFragment();
                            break;
                    }
            }

            getSupportFragmentManager().beginTransaction().replace(R.id.nav_host_fragment, selectedFragment).commit();

            return true;
        }
    };

}