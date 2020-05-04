<%@page import="com.doctor.service.DoctorService" %>
<%@ page import="com.doctor.model.Doctor" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.doctor.utils.GetDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html> 
<html>
<head>
    <title>Doctor Management</title>
    <link rel="stylesheet" href="Views/bootstrap.min.css">
    <script src="Components/jquery-3.2.1.min.js"></script>
    <script src="Components/doctor.js"></script>
</head>
<body style="background-color: #5b07f11c">

<nav class="navbar navbar-light" style="margin-top: -25px; width: 1540px; background-color: #5a1dc736">
    <span class="navbar-brand mb-0 h1">Doctor Management
    <img src="Views/doctor.jpg" width="30" height="30" class="d-inline-block align-top" alt=""></span>

</nav>
<h1 style="font-family: verdana; color: #6f42c1; margin-left: 36%; font-weight: bold">DOCTOR DETAILS</h1>
<br>
<div class="container">
    <div class="row">
        <div class="col-6" style="margin-left:25%">
            <form id="formDoctor" style="color: #6f42c1;  font-weight: bold" name="formDoctor" method="post"
                  action="doctor.jsp" >
                <!-- DOCTOR ID -->
                ID:
                <input type="number" id="doctor_id2" name="doctor_id2" class="form-control form-control-sm">
                <!-- FIRSTNAME -->
                <br>
                First Name:
                <input type="text" id="firstName2" name="firstName2" class="form-control form-control-sm">

                <!-- LASTNAME -->
                <br>
                Last Name:
                <input type="text" id="lastName2" name="lastName2" class="form-control form-control-sm">

                <!-- GENDER -->
                <br>
                Gender:
                <input type="text" id="gender2" name="gender2" class="form-control form-control-sm">

                <!-- EMAIL -->
                <br>
                Email:
                <input type="email" id="email2" name="email2" class="form-control form-control-sm">

                <!-- PASSWORD -->
                <br>
                Password:
                <input type="password" id="password2" name="password2" class="form-control form-control-sm">

                <!-- JOINED DATE -->
                <br>
                Joined Date:
                <%
                    GetDate todaydate = new GetDate();
                    out.print(todaydate.today());
                %>
                <!-- PHONE -->
                <br>
                Contact Number:
                <input type="number" id="phone2" name="phone2" class="form-control form-control-sm">

                <!-- SPECIALIZATION -->
                <br>
                Specialization:
                <input type="text" id="specialization2" name="specialization2" class="form-control form-control-sm">

                <!-- ADDRESS -->
                <br>
                Address:
                <input type="text" id="address2" name="address2" class="form-control form-control-sm">

                <!-- NIC -->
                <br>
                NIC:
                <input type="text" id="NIC2" name="NIC2" class="form-control form-control-sm">

                <!-- HOSPITAL ID -->
                <br>
                Hospital ID:
                <input type="number" id="hospital_id2" name="hospital_id2" class="form-control form-control-sm">

                <br>
                <div style="margin-left: 35%">
                    <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-outline-success">
                    <input id="btnReset" name="btnReset" type="reset" value="Reset" class="btn btn-outline-secondary">
                </div>

                <input type="hidden" id="hidDoctorIDSave" name="hidDoctorIDSave" value="">
            </form>


            <div id="alertSuccess" class="alert alert-success"></div>

            <div id="alertError" class="alert alert-danger"></div>
            <br>

        </div>

    </div>

</div>
<div id="divDoctorGrid">
    <%
        DoctorService doctorService2 = new DoctorService();
        out.print(doctorService2.readDoctors());
    %>
</div>
</body>
</html>
