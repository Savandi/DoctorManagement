package com.doctor.utils;


import java.util.ArrayList;

public class DoctorIDValidate {

    public static Integer generateDoctorIDs(ArrayList<Integer> arrayList){

        int id;
        int next = arrayList.size();
        next++;
        id = next;
        if(arrayList.contains(id)){
            next++;
            id = next;
        }
        return id;
    }
}
