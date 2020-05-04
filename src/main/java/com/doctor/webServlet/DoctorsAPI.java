package com.doctor.webServlet;

import com.doctor.model.Doctor;
import com.doctor.service.DoctorService;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

@WebServlet("/DoctorsAPI")
public class DoctorsAPI extends javax.servlet.http.HttpServlet {
    DoctorService doctorService = new DoctorService();


    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        //NOT USED
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        Doctor doctor = new Doctor();

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

        Doctor doctor = new Doctor();

        doctor.setFirstName(paras.get("firstName2").toString().replace("+"," "));
        doctor.setLastName((paras.get("lastName2").toString()).replace("+"," "));
        doctor.setGender((paras.get("gender2").toString().replace("+"," ")));
        doctor.setEmail((paras.get("email2").toString().replace("%40","@").replace("+"," ")));
        doctor.setPassword((paras.get("password2").toString().replace("+"," ")));
        doctor.setJoinedDate((paras.get("joinedDate2").toString().replace("+"," ")));
        doctor.setPhone(Integer.parseInt((paras.get("phone2").toString().replace("+"," "))));
        doctor.setSpecialization((paras.get("specialization2").toString().replace("+"," ")));
        doctor.setAddress((paras.get("address2").toString().replace("+"," ")));
        doctor.setNIC((paras.get("NIC2").toString().replace("+"," ")));
        doctor.setHospital_id(Integer.parseInt((paras.get("hospital_id2").toString().replace("+"," "))));
        String output = doctorService.updateDoctor(Integer.parseInt((paras.get("hidDoctorIDSave").toString().replace("+"," "))),doctor);

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
