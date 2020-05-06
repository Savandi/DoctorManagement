package com.doctor.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GetDate {

    public GetDate() {

    }

    //Function to get today's date generated through Java to be added as doctor's joined date
    public String today() {
        Date date = new Date();
        StringBuilder formatDate = new StringBuilder();
        formatDate.append("<input type='text' id='joinedDate2' name='joinedDate2' class='form-control form-control-sm' value='");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        formatDate.append(format.format(date)).append("' readonly='readonly' placeholder='Joined Date'>");

        return formatDate.toString();
    }


}
