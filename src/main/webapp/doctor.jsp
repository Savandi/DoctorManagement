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
<body>
<nav class="navbar navbar-light" style="margin-top: -25px;background-color: #5a1dc736" width="2000px">
    <span class="navbar-brand text-center col-12 mx-auto"
          style="font-family: Helvetica; color: black; font-weight: bold">DOCTOR MANAGEMENT PORTAL
    <img src="Views/doctor.jpg" width="40" height="40" class="d-inline-block align-top" alt=""></span>
</nav>
<br>
<div class="row">
    <div class="container">
        <div class=" border bg-light col-8 mx-auto">
            <h6 class="navbar-brand text-center col-12 mx-auto" style="padding: 0.7em;background-color:#5a1dc736">
                <a style="font-size: medium; font-weight: bold; color:black">Register/Update Doctor</a>
            </h6>
            <form id="formDoctor" style="color: black" name="formDoctor" method="post"
                  action="doctor.jsp">
                <!-- FIRSTNAME -->
                <br>
                <div class="row">
                    <div class="col-4">
                        First Name
                        <input type="text" id="firstName2" name="firstName2" class="form-control form-control-sm"
                               placeholder="First Name"></div>
                    <!-- LASTNAME -->
                    <div class="col-4">
                        Last Name
                        <input type="text" id="lastName2" name="lastName2" class="form-control form-control-sm"
                               placeholder="Last Name"></div>
                    <br>
                    <!-- GENDER -->
                    <div class="col-4">
                        Gender<br>
                        <div class="control">
                            <label class="radio">
                                <input id="male" type="radio" name="gender" value="Male">
                                Male
                            </label>
                            <label class="radio">
                                <input id="female" type="radio" name="gender" value="Female">
                                Female
                            </label>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="row">
                    <!-- EMAIL -->
                    <div class="col-4">
                        Email
                        <input type="email" id="email2" name="email2" class="form-control form-control-sm"
                               placeholder="Email"></div>
                    <!-- PASSWORD -->
                    <div class="col-4">
                        Password
                        <input type="password" id="password2" name="password2" class="form-control form-control-sm"
                               placeholder="Password"></div>
                    <div class="col-4">
                        Confirm Password
                        <input type="password" id="confPassword" name="confPassword"
                               class="form-control form-control-sm"
                               placeholder="Confirm Password"></div>
                    <br>
                </div>
                <div class="row">
                    <div class="col-6">
                        <!-- NIC -->
                        NIC
                        <input type="text" id="NIC2" name="NIC2" class="form-control form-control-sm" placeholder="NIC">
                    </div>
                    <div class="col-6">
                        <!-- PHONE -->
                        Contact Number
                        <input type="number" id="phone2" name="phone2" class="form-control form-control-sm"
                               placeholder="Phone"></div>
                    <br>
                </div>
                <div class="row">
                    <div class="col-6">
                        <!-- ADDRESS -->
                        Address
                        <input type="text" id="address2" name="address2" class="form-control form-control-sm"
                               placeholder="Address"></div>
                    <div class="col-6">
                        <!-- SPECIALIZATION -->
                        Specialization
                        <input type="text" id="specialization2" name="specialization2"
                               class="form-control form-control-sm"
                               placeholder="Specialization"></div>
                    <br>
                </div>
                <div class="row">
                    <div class="col-6">
                        <!-- JOINED DATE -->
                        Joined Date
                        <%
                            GetDate todaydate = new GetDate();
                            out.print(todaydate.today());
                        %>
                    </div>
                    <div class="col-6">
                        <!-- HOSPITAL ID -->
                        Hospital ID
                        <input type="number" id="hospital_id2" name="hospital_id2" class="form-control form-control-sm"
                               placeholder="Hospital ID"></div>
                    <br>
                </div>
                <div class="row">
                    <div class="mx-auto">
                        <br>
                        <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-outline-success">&nbsp;&nbsp;
                        <input id="btnReset" name="btnReset" type="reset" value="Reset"
                               class="btn btn-outline-secondary">
                    </div>
                </div>

                <input type="hidden" id="hidDoctorIDSave" name="hidDoctorIDSave" value="">
            </form>
            <div id="alertSuccess" class="alert alert-success"></div>

            <div id="alertError" class="alert alert-danger"></div>
            <br>
        </div>
    </div>
    <div class="col-12" id="divDoctorGrid" style="padding:2rem">
        <%
            DoctorService doctorService2 = new DoctorService();
            out.print(doctorService2.readDoctors());
        %>
    </div>

</div>
</body>
</html>
