package com.doctor.service;

import com.doctor.model.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

@WebServlet("/DoctorsAPI")
public class DoctorsAPI extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private DoctorService doctorService = new DoctorService();

    public DoctorsAPI() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //NOT USED

        response.getWriter().append("Served at: ").append(request.getContextPath());


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("firstName2"));

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

    protected void doPut(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws ServletException, IOException {
        Map paras = getParasMap(request);


        Doctor doctor = new Doctor();

        doctor.setDoctor_id(Integer.parseInt(String.valueOf(paras.get("doctor_id2"))));
        doctor.setFirstName(String.valueOf(paras.get("firstName2")));
        doctor.setLastName(String.valueOf(paras.get("lastName2")));
        doctor.setGender(String.valueOf(paras.get("gender2")));
        doctor.setEmail(String.valueOf(paras.get("email2")));
        doctor.setPassword(String.valueOf(paras.get("password2")));
        doctor.setJoinedDate(String.valueOf(paras.get("joinedDate2")));
        doctor.setPhone(Integer.parseInt(String.valueOf(paras.get("phone2"))));
        doctor.setSpecialization(String.valueOf(paras.get("specialization2")));
        doctor.setAddress(String.valueOf(paras.get("address2")));
        doctor.setNIC(String.valueOf(paras.get("NIC2")));
        doctor.setHospital_id(Integer.parseInt(String.valueOf(paras.get("hospital_id2"))));

        String output = doctorService.updateDoctor(Integer.parseInt(String.valueOf(paras.get("hidDoctorIDSave"))),doctor);

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
