<%@page import="com.doctor.service.DoctorService" %>
<%@ page import="com.doctor.model.Doctor" %>
<%@ page import="java.net.http.HttpRequest" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
 
<%
    //Save---------------------------------
    if (request.getParameter("doctor_id") != null) {
        DoctorService doctorService = new DoctorService();
        String stsMsg = "";

        //Insert--------------------------
        if (request.getParameter("hidDoctorIDSave") == "") {
            stsMsg = doctorService.insertDoctor(request.getParameter("itemCode"), request.getParameter("itemName"),
                    request.getParameter("itemPrice"), request.getParameter("itemDesc"));
        }

        //Update----------------------
        else {
            stsMsg = doctorService.updateDoctor(request.getParameter("hidDoctorIDSave"), request.getParameter("itemCode"),
                    request.getParameter("itemName"), request.getParameter("itemPrice"), request.getParameter("itemDesc"));
        }

        session.setAttribute("statusMsg", stsMsg);

    }

    //Delete-----------------------------
    if (request.getParameter("hidDoctorIDDelete") != null) {
        DoctorService doctorService = new DoctorService();
        String stsMsg = doctorService.deleteDoctor(request.getParameter("hidItemIDDelete"));
        session.setAttribute("statusMsg", stsMsg);
    }

%>


<!DOCTYPE html> 
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Doctor Management</title>
    <link rel="stylesheet" href="Views/bootstrap.min.css">
    <script src="Components/jquery-3.2.1.min.js"></script>
    <script src="Components/doctor.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-8">
            <h1 class="m-3">Doctor details</h1>
            <form id="formDoctor" name="formDoctor" method="post" action="doctor.jsp">


                <!-- DOCTOR ID -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="doctor_id1">
                        ID:
                    </span>
                    </div>
                    <input type="number" id="doctor_id2" name="doctor_id2" class="form-control form-control-sm">
                </div>

                <!-- FIRSTNAME -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="firstName1">
                    Doctor Name:
                    </span>
                    </div>
                    <input type="text" id="firstName2" name="firstName2" class="form-control form-control-sm">
                </div>

                <!-- LASTNAME -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="lastName1">
                    Doctor Name:
                    </span>
                    </div>
                    <input type="text" id="lastName2" name="lastName2" class="form-control form-control-sm">
                </div>

                <!-- GENDER -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"><span class="input-group-text" id="gender">
                        Gender:
                    </span></div>
                    &nbsp;&nbsp;Male
                    <input type="radio" id="rdoGenderMale" name="rdoGender" value="Male"> &nbsp;&nbsp;Female
                    <input type="radio" id="rdoGenderFemale" name="rdoGender" value="Female">
                </div>

                <!-- EMAIL -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="email1">
                    Email:
                    </span>
                    </div>
                    <input type="email" id="email2" name="email2" class="form-control form-control-sm">
                </div>

                <!-- PASSWORD -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="password1">
                    Password:
                    </span>
                    </div>
                    <input type="password" id="password2" name="password2" class="form-control form-control-sm">
                </div>

                <!-- JOINED DATE -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="joinedDate1">
                    Joining Date:
                    </span>
                    </div>
                    <input type="date" id="joinedDate2" name="joinedDate2" class="form-control form-control-sm">
                </div>

                <!-- PHONE -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="phone1">
                    Contact Number:
                    </span>
                    </div>
                    <input type="number" id="phone2" name="phone2" class="form-control form-control-sm">
                </div>


                <!-- SPECIALIZATION -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="specialization1">
                    Specialization:
                    </span>
                    </div>
                    <input type="text" id="specialization2" name="specialization2" class="form-control form-control-sm">
                </div>

                <!-- ADDRESS -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="address1">
                    Address:
                    </span>
                    </div>
                    <input type="text" id="address2" name="address2" class="form-control form-control-sm">
                </div>

                <!-- NIC -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="NIC1">
                    NIC:
                    </span>
                    </div>
                    <input type="text" id="NIC2" name="NIC2" class="form-control form-control-sm">
                </div>

                <!-- HOSPITAL ID -->
                <div class="input-group input-group-sm mb-3">
                    <div class="input-group-prepend"> 
                    <span class="input-group-text" id="hospital_id1">
                    Hospital ID:
                    </span>
                    </div>
                    <input type="number" id="hospital_id2" name="hospital_id2" class="form-control form-control-sm">
                </div>


                <div id="alertSuccess" class="alert alert-success"></div>
                <div id="alertError" class="alert alert-danger"></div>

                <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
                <input type="hidden" id="hidDoctorIDSave" name="hidDoctorIDSave" value="">

            </form>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-12" id="colStudents">
        </div>
    </div>
</div>

<%
    System.out.print(session.getAttribute("statusMsg"));

%>
<br>
<%
    DoctorService doctorService2 = new DoctorService();
    System.out.print(doctorService2.readDoctors());
%>
</body>
</html>
