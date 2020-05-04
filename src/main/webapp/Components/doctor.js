$(document).ready(function () {
    if ($("#alertSuccess").text().trim() === "") {
        $("#alertSuccess").hide();
    }
    $("#alertError").hide();
});


// SAVE ============================================
$(document).on("click", "#btnSave", function (event) {
// Clear alerts---------------------
    $("#alertSuccess").text("");
    $("#alertSuccess").hide();
    $("#alertError").text("");
    $("#alertError").hide();


// Form validation-------------------
    var status = validateDoctorForm();

    if (status !== true) {
        $("#alertError").text(status);
        $("#alertError").show();
        return;
    }

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
        }

    } else if (status === "error") {

        $("alertError").text("Error while saving");
        $("alertError").show();
    } else {
        $("#alertError").text("Unknown error while saving");
        $("#alertError").show();
    }
    $("#hidDoctorIDSave").val("");


}

//DELETE
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
            $("#divDoctorGrid").html(resultSet.data);

        } else if (resultSet.status.trim() === "error") {
            $("#alertError").text(resultSet.data);
            $("#alertError").show();
        }
    } else if (status === "error") {
        $("#alertError").text("Error while deleting.");
        $("#alertError").show();
    } else {
        $("#alertError").text("Unknown error while deleting..");
        $("#alertError").show();
    }


}

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function (event) {
    $("#hidDoctorIDSave").val($(this).closest("tr").find('#hidDoctorIDUpdate').val());
    $("#firstName2").val($(this).closest("tr").find('td:eq(1)').text());
    $("#lastName2").val($(this).closest("tr").find('td:eq(2)').text());
    $("#gender2").val($(this).closest("tr").find('td:eq(3)').text());
    $("#email2").val($(this).closest("tr").find('td:eq(4)').text());
    $("#password2").val($(this).closest("tr").find('td:eq(5)').text());
    $("#joinedDate2").val($(this).closest("tr").find('td:eq(6)').text());
    $("#phone2").val($(this).closest("tr").find('td:eq(7)').text());
    $("#specialization2").val($(this).closest("tr").find('td:eq(8)').text());
    $("#address2").val($(this).closest("tr").find('td:eq(9)').text());
    $("#NIC2").val($(this).closest("tr").find('td:eq(10)').text());
    $("#hospital_id2").val($(this).closest("tr").find('td:eq(11)').text());

});

// CLIENT- MODEL=========================================================================
function validateDoctorForm() {
    // FIRSTNAME
    if ($("#firstName2").val().trim() === "") {
        return "Insert First Name";
    }
    // LASTNAME
    if ($("#lastName2").val().trim() === "") {
        return "Insert Last Name";
    }
    // GENDER
    if ($("#gender2").val().trim() === "") {
        return "Insert Gender";
    }
    // EMAIL
    if ($("#email2").val().trim() === "") {
        return "Insert Email";
    }
    // PASSWORD
    if ($("#password2").val().trim() === "") {
        return "Insert Password";
    }
    // JOINEDDATE
    if ($("#joinedDate2").val().trim() === "") {
        return "Insert Joined Date";
    }
    // PHONE
    if ($("#phone2").val().trim() === "") {
        return "Insert Contact Number";
    }
    // SPECIALIZATION
    if ($("#specialization2").val().trim() === "") {
        return "Insert Specialization";
    }
    // ADDRESS
    if ($("#address2").val().trim() === "") {
        return "Insert Address";
    }
    // NIC
    if ($("#NIC2").val().trim() === "") {
        return "Insert NIC";
    }
    // HOSPITALID
    if ($("#hospital_id2").val().trim() === "") {
        return "Insert Hospital ID";
    }
    //check email
    var regex = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;

    if (!(regex.test($("#email2").val()))) {
        return "Insert a valid email";
    }
    return true;

    //phone number length
    //if ($("#phone2").val().length !== 10 || $("#phone2").val().length !== 9){
    //      return "Please enter a valid phone number";
    //}
}

// function saveBtnValidation() {
//
//     var toValidate = jQuery('#doctor_id2, #firstName2, #lastName2, #email2,#password2,#gender2, #joinedDate2, #phone2, #specialization2, #address2, #NIC2, #hospital_id2'),
//         valid = false;
//     toValidate.keyup(function () {
//         if (jQuery(this).val().length > 0) {
//             jQuery(this).data('valid', true);
//         } else {
//             jQuery(this).data('valid', false);
//         }
//         toValidate.each(function () {
//             if (jQuery(this).data('valid') == true) {
//                 valid = true;
//             } else {
//                 valid = false;
//             }
//         });
//         if (valid === true) {
//             jQuery("#btnSave").prop('disabled', false);
//         } else {
//             jQuery("#btnSave").prop('disabled', true);
//         }
//     });
//
// }
