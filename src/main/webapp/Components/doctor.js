$(document).ready(function () {
    if ($("#alertSuccess").text().trim() === "") {
        $("#alertSuccess").hide();
    }
    $("#alertError").hide();
});


// SAVE ==========================================================
$(document).on("click", "#btnSave", function (event) {
    // Form validation-------------------
    var status = validateDoctorForm();

    if (status !== true) {
        $("#alertError").text(status);
        $("#alertError").show();
        $("#alertSuccess").hide();
        return;
    }

    // Clear alerts---------------------
    $("#alertSuccess").text("");
    $("#alertSuccess").hide();
    $("#alertError").text("");
    $("#alertError").hide();

    // If valid------------------------
    var type = ($("#hidDoctorIDSave").val() === "") ? "POST" : "PUT";

    $.ajax(
        {
            url: "DoctorsAPI",
            type: type,
            data: $("#formDoctor").serialize(),
            dataType: "text",
            complete: function (response, status) {
                onDoctorSaveComplete(response.responseText, status);

            }
        });

});

function onDoctorSaveComplete(response, status) {

    if (status === "success") {

        var resultSet = JSON.parse(response);

        if (resultSet.status.trim() === "success") {

            $("#alertSuccess").text("Successfully Saved. ");
            $("#alertSuccess").show();
            $("#formDoctor")[0].reset();
            $("#divDoctorGrid").html(resultSet.data);
        } else if (resultSet.status.trim() === "error") {

            $("#alertError").text(resultSet.data);
            $("#alertError").show();
            $("#alertSuccess").hide();
        }

    } else if (status === "error") {

        $("alertError").text("Error while saving");
        $("alertError").show();
        $("#alertSuccess").hide();
    } else {
        $("#alertError").text("Unknown error while saving");
        $("#alertError").show();
        $("#alertSuccess").hide();
    }
    $("#hidDoctorIDSave").val("");


}

//DELETE=================================================
$(document).on("click", ".btnRemove", function (event) {
    $.ajax({
        url: "DoctorsAPI",
        type: "DELETE",
        data: "doctor_id2=" + $(this).data("doctor_id"),
        dataType: "text",
        complete: function (response, status) {

            onDoctorDeleteComplete(response.responseText, status);
        }
    });

});

function onDoctorDeleteComplete(response, status) {

    if (status === "success") {

        var resultSet = JSON.parse(response);

        if (resultSet.status.trim() === "success") {

            $("#alertSuccess").text("Successfully Deleted.");
            $("#alertSuccess").show();
            $("#alertError").hide();
            $("#divDoctorGrid").html(resultSet.data);


        } else if (resultSet.status.trim() === "error") {
            $("#alertError").text(resultSet.data);
            $("#alertError").show();
            $("#alertSuccess").hide();

        }
    } else if (status === "error") {
        $("#alertError").text("Error while deleting.");
        $("#alertError").show();
        $("#alertSuccess").hide();
    } else {
        $("#alertError").text("Unknown error while deleting..");
        $("#alertError").show();
        $("#alertSuccess").hide();
    }


}

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function (event) {
    //clear alerts
    $("#alertSuccess").hide();
    $("#alertError").hide();

    $("#hidDoctorIDSave").val($(this).closest("tr").find('#hidDoctorIDUpdate').val());
    $("#firstName2").val($(this).closest("tr").find('td:eq(1)').text());
    $("#lastName2").val($(this).closest("tr").find('td:eq(2)').text());
    if ($(this).closest("tr").find('td:eq(3)').text() === "Female")
        $("#female").prop("checked", true);
    else if ($(this).closest("tr").find('td:eq(3)').text() === "Male")
        $("#male").prop("checked", true);
    $("#email2").val($(this).closest("tr").find('td:eq(4)').text());
    $("#password2").val($(this).closest("tr").find('td:eq(5)').text());
    $("#confPassword").val($(this).closest("tr").find('td:eq(5)').text());
    $("#joinedDate2").val($(this).closest("tr").find('td:eq(6)').text());
    $("#phone2").val($(this).closest("tr").find('td:eq(7)').text());
    $("#specialization2").val($(this).closest("tr").find('td:eq(8)').text());
    $("#address2").val($(this).closest("tr").find('td:eq(9)').text());
    $("#NIC2").val($(this).closest("tr").find('td:eq(10)').text());
    $("#hospital_id2").val($(this).closest("tr").find('td:eq(11)').text());
    $("#firstName2").focus();

});

//RESET================================================================================
$(document).on("click", ".btnReset", function (event) {
    $("#alertSuccess").hide();
    $("#alertError").hide();
    $("#formDoctor")[0].reset();
});

// CLIENT- MODEL=========================================================================
function validateDoctorForm() {

    // FIRSTNAME EMPTY CHECK
    if ($("#firstName2").val().trim() === "") {
        return "Insert First Name";
    }
    // LASTNAME EMPTY CHECK
    if ($("#lastName2").val().trim() === "") {
        return "Insert Last Name";
    }
    //GENDER EMPTY CHECK
    if ($('input[name="gender"]:checked').length === 0) {
        return "Select gender.";
    }

    // EMAIL EMPTY CHECK
    if ($("#email2").val().trim() === "") {
        return "Insert Email";
    }
    //CHECK EMAIL VALIDATION
    var regexEmail = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;

    if (!(regexEmail.test($("#email2").val()))) {
        return "Insert a Valid Email";
    }
    // PASSWORD EMPTY CHECK
    if ($("#password2").val().trim() === "") {
        return "Insert Password";
    }
    // CONFIRM PASSWORD EMPTY CHECK
    if ($("#confPassword").val().trim() === "") {
        return "Confirm Password";
    }
    //PASSWORD MISMATCH CHECK
    if (!($("#confPassword").val() === $("#password2").val())) {

        return "Password does not match";
    }
    // NIC EMPTY CHECK
    if ($("#NIC2").val().trim() === "") {
        return "Insert NIC";
    }
    //CHECK NIC NUMBER LENGTH AND PATTERN
    var regexNIC = /^[0-9]{9}[vVxX]$/;

    if ($("#NIC2").val().length !== 10) {
        return "Enter a Valid NIC number";
    }
    if (!(regexNIC.test($("#NIC2").val()))) {
        return "Enter a Valid NIC number";
    }

    // PHONE EMPTY CHECK
    if ($("#phone2").val().trim() === "") {
        return "Insert Contact Number";
    }
    //PHONE LENGTH VALIDATION CHECK
    if ($("#phone2").val().length > 11 || $("#phone2").val().length < 7) {
        return "Insert a valid contact number";
    }
    // ADDRESS EMPTY CHECK
    if ($("#address2").val().trim() === "") {
        return "Insert Address";
    }
    // SPECIALIZATION EMPTY CHECK
    if ($("#specialization2").val().trim() === "") {
        return "Insert Specialization";
    }
    // JOINEDDATE EMPTY CHECK
    if ($("#joinedDate2").val().trim() === "") {
        return "Insert Joined Date";
    }
    // HOSPITALID EMPTY CHECK
    if ($("#hospital_id2").val().trim() === "") {
        return "Insert Hospital ID";
    }

    return true;
}
