<%@page import="com.doctor.service.DoctorService" %>
<%@ page import="com.doctor.model.Doctor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html> 
<html>
<head>
    <title>Doctor Management</title>
    <link rel="stylesheet" href="Views/bootstrap.min.css">
    <script src="Components/jquery-3.2.1.min.js"></script>
    <script src="Components/doctor.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-8">
            <h1 class="m-3">Doctor Details</h1>
            <form id="formDoctor" name="formDoctor" method="post" action="doctor.jsp">
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
                Joining Date:
                <input type="date" id="joinedDate2" name="joinedDate2" class="form-control form-control-sm">

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
                <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
                <input type="hidden" id="hidDoctorIDSave" name="hidDoctorIDSave" value="">
            </form>


            <div id="alertSuccess" class="alert alert-success"></div>

            <div id="alertError" class="alert alert-danger"></div>
            <br>

            <div id="divDoctorGrid">
                <%
                    DoctorService doctorService2 = new DoctorService();
                    out.print(doctorService2.readDoctors());
                %>
            </div>

        </div>
    </div>
</div>
</body>
</html>
