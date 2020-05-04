package com.doctor.service;

import com.doctor.model.Doctor;

import javax.print.Doc;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebServlet("/DoctorsAPI")
public class DoctorsAPI extends javax.servlet.http.HttpServlet {
    DoctorService doctorService = new DoctorService();


    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        //NOT USED
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {


        Doctor doctor = new Doctor();

        doctor.setDoctor_id(Integer.parseInt(request.getParameter("doctor_id2")));
        doctor.setFirstName(request.getParameter("firstName2"));
        doctor.setLastName(request.getParameter("lastName2"));
        doctor.setGender(request.getParameter("gender2"));
        doctor.setEmail(request.getParameter("email2"));
        doctor.setPassword(request.getParameter("password2"));
        doctor.setJoinedDate(request.getParameter("joinedDate2"));
        doctor.setPhone(Integer.parseInt(request.getParameter("phone2")));
        doctor.setSpecialization(request.getParameter("specialization2"));
        doctor.setAddress(request.getParameter("address2"));
        doctor.setNIC(request.getParameter("NIC2"));
        doctor.setHospital_id(Integer.parseInt(request.getParameter("hospital_id2")));

        String output = doctorService.insertDoctor(doctor);
        response.getWriter().write(output);
    }

    protected void doPut(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Map paras = getParasMap(request);

        System.out.println();
        Doctor doctor = new Doctor();

        doctor.setDoctor_id(Integer.parseInt(((paras.get("doctor_id2").toString()))));
        doctor.setFirstName(paras.get("firstName2").toString());
        doctor.setLastName((paras.get("lastName2").toString()));
        doctor.setGender((paras.get("gender2").toString()));
        doctor.setEmail((paras.get("email2").toString()));
        doctor.setPassword((paras.get("password2").toString()));
        doctor.setJoinedDate((paras.get("joinedDate2").toString()));
        doctor.setPhone(Integer.parseInt((paras.get("phone2").toString())));
        doctor.setSpecialization((paras.get("specialization2").toString()));
        doctor.setAddress((paras.get("address2").toString()));
        doctor.setNIC((paras.get("NIC2").toString()));
        doctor.setHospital_id(Integer.parseInt((paras.get("hospital_id2").toString())));
        String output = doctorService.updateDoctor(Integer.parseInt((paras.get("hidDoctorIDSave").toString())),doctor);

        response.getWriter().write(output);

    }

    protected void doDelete(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Map paras = getParasMap(request);

        String output = doctorService.deleteDoctor(Integer.parseInt(String.valueOf(paras.get("doctor_id2"))));
        response.getWriter().write(output);
    }

    private static Map getParasMap(HttpServletRequest request) {
        Map<String, String> map = new HashMap<String, String>();
        try {
            Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
            String queryString = scanner.hasNext() ?
                    scanner.useDelimiter("\\A").next() : "";
            scanner.close();
            String[] params = queryString.split("&");
            for (String param : params) {
                String[] p = param.split("=");
                map.put(p[0], p[1]);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }
}
