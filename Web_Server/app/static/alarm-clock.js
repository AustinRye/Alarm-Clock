$(document).ready(function () {

    var displayAlarm = false;

    setInterval(function () {
        $.get("time", function (data) {
            if (!displayAlarm) {
                $("#hours1stDigit").text(data["time"][0]);
                $("#hours2ndDigit").text(data["time"][1]);
                $("#minutes1stDigit").text(data["time"][2]);
                $("#minutes2ndDigit").text(data["time"][3]);
                $("#seconds1stDigit").text(data["time"][4]);
                $("#seconds2ndDigit").text(data["time"][5]);
                if (data["time"][6]) {
                    $("#pm").text("PM");
                } else {
                    $("#pm").text("AM");
                }
            }
        });
    }, 1000);
    setInterval(function () {
        $.get("alarmTime", function (data) {
            if (displayAlarm) {
                $("#hours1stDigit").text(data["alarmTime"][0]);
                $("#hours2ndDigit").text(data["alarmTime"][1]);
                $("#minutes1stDigit").text(data["alarmTime"][2]);
                $("#minutes2ndDigit").text(data["alarmTime"][3]);
                $("#seconds1stDigit").text(data["alarmTime"][4]);
                $("#seconds2ndDigit").text(data["alarmTime"][5]);
                if (data["alarmTime"][6]) {
                    $("#pm").text("PM");
                } else {
                    $("#pm").text("AM");
                }
            }
        });
    }, 1000);
    setInterval(function () {
        $.get("alarmOn", function (data) {
            if (data["alarmOn"] == 1) {
                $("#alarmOn").addClass("active");
            } else {
                $("#alarmOn").removeClass("active");
            }
        });
    }, 1000);
    setInterval(function () {
        $.get("alarmEnabled", function (data) {
            if (data["alarmEnabled"] == 1) {
                $("#alarmEnabled").addClass("active");
            } else {
                $("#alarmEnabled").removeClass("active");
            }
        });
    }, 1000);

    $("#reset").on('mousedown touchstart', function () {
        $.post("reset?reset=1");
    });
    $("#reset").on('mouseup touchstop', function () {
        $.post("reset?reset=0");
    });
    $("#displayAlarm").mousedown(function () {
        if ($(this).hasClass("active")) {
            displayAlarm = false;
            $(this).removeClass('active');
            $.post("changeAlarm?changeAlarm=0");
        } else {
            displayAlarm = true;
            $(this).addClass('active');
            $.post("changeAlarm?changeAlarm=1");
        }
    });
    $("#changeEnable").mousedown(function () {
        if ($(this).hasClass("active")) {
            $(this).removeClass('active');
            $.post("changeEnable?changeEnable=0");
        } else {
            $(this).addClass('active');
            $.post("changeEnable?changeEnable=1");
        }
    });
    $("#alarmEnable").mousedown(function () {
        if ($(this).hasClass("active")) {
            $(this).removeClass('active');
            $.post("alarmEnable?alarmEnable=0");
        } else {
            $(this).addClass('active');
            $.post("alarmEnable?alarmEnable=1");
        }
    });

    $('#seconds1stDigitInc').on('mousedown touchstart', function () {
        $.post("seconds1stDigitInc?seconds1stDigitInc=1");
    });
    $('#seconds1stDigitInc').on('mouseup touchstop', function () {
        $.post("seconds1stDigitInc?seconds1stDigitInc=0");
    });
    $('#seconds1stDigitDec').on('mousedown touchstart', function () {
        $.post("seconds1stDigitDec?seconds1stDigitDec=1");
    });
    $('#seconds1stDigitDec').on('mouseup touchstop', function () {
        $.post("seconds1stDigitDec?seconds1stDigitDec=0");
    });
    $("#seconds2ndDigitInc").on('mousedown touchstart', function () {
        $.post("seconds2ndDigitInc?seconds2ndDigitInc=1");
    });
    $("#seconds2ndDigitInc").on('mouseup touchstop', function () {
        $.post("seconds2ndDigitInc?seconds2ndDigitInc=0");
    });
    $("#seconds2ndDigitDec").on('mousedown touchstart', function () {
        $.post("seconds2ndDigitDec?seconds2ndDigitDec=1");
    });
    $("#seconds2ndDigitDec").on('mouseup touchstop', function () {
        $.post("seconds2ndDigitDec?seconds2ndDigitDec=0");
    });

    $('#minutes1stDigitInc').on('mousedown touchstart', function () {
        $.post("minutes1stDigitInc?minutes1stDigitInc=1");
    });
    $('#minutes1stDigitInc').on('mouseup touchstop', function () {
        $.post("minutes1stDigitInc?minutes1stDigitInc=0");
    });
    $('#minutes1stDigitDec').on('mousedown touchstart', function () {
        $.post("minutes1stDigitDec?minutes1stDigitDec=1");
    });
    $('#minutes1stDigitDec').on('mouseup touchstop', function () {
        $.post("minutes1stDigitDec?minutes1stDigitDec=0");
    });
    $("#minutes2ndDigitInc").on('mousedown touchstart', function () {
        $.post("minutes2ndDigitInc?minutes2ndDigitInc=1");
    });
    $("#minutes2ndDigitInc").on('mouseup touchstop', function () {
        $.post("minutes2ndDigitInc?minutes2ndDigitInc=0");
    });
    $("#minutes2ndDigitDec").on('mousedown touchstart', function () {
        $.post("minutes2ndDigitDec?minutes2ndDigitDec=1");
    });
    $("#minutes2ndDigitDec").on('mouseup touchstop', function () {
        $.post("minutes2ndDigitDec?minutes2ndDigitDec=0");
    });

    $('#hours1stDigitInc').on('mousedown touchstart', function () {
        $.post("hours1stDigitInc?hours1stDigitInc=1");
    });
    $('#hours1stDigitInc').on('mouseup touchstop', function () {
        $.post("hours1stDigitInc?hours1stDigitInc=0");
    });
    $('#hours1stDigitDec').on('mousedown touchstart', function () {
        $.post("hours1stDigitDec?hours1stDigitDec=1");
    });
    $('#hours1stDigitDec').on('mouseup touchstop', function () {
        $.post("hours1stDigitDec?hours1stDigitDec=0");
    });
    $("#hours2ndDigitInc").on('mousedown touchstart', function () {
        $.post("hours2ndDigitInc?hours2ndDigitInc=1");
    });
    $("#hours2ndDigitInc").on('mouseup touchstop', function () {
        $.post("hours2ndDigitInc?hours2ndDigitInc=0");
    });
    $("#hours2ndDigitDec").on('mousedown touchstart', function () {
        $.post("hours2ndDigitDec?hours2ndDigitDec=1");
    });
    $("#hours2ndDigitDec").on('mouseup touchstop', function () {
        $.post("hours2ndDigitDec?hours2ndDigitDec=0");
    });

});