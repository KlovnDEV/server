$(document).ready(function() {
    HealthIndicator = new ProgressBar.Circle("#HealthIndicator", {
        color: "rgb(59, 178, 115)",
        trailColor: "rgb(59, 178, 115, .45)", 
        strokeWidth: 40,
        trailWidth: 40,
        duration: 250,
        easing: "easeInOut",
    });

    ArmorIndicator = new ProgressBar.Circle("#ArmorIndicator", {
        color: "rgb(21, 101, 172)",
        trailColor: "rgb(21, 101, 172, .45)", 
        strokeWidth: 40,
        trailWidth: 40,
        duration: 250,
        easing: "easeInOut",
    });

    HungerIndicator = new ProgressBar.Circle("#HungerIndicator", {
        color: "rgb(255, 109, 0)",
        trailColor: "rgb(230, 112, 19, .45)",
        strokeWidth: 40,
        trailWidth: 40,
        duration: 250,
        easing: "easeInOut",
    });

    ThirstIndicator = new ProgressBar.Circle("#ThirstIndicator", {
        color: "rgb(2, 119, 189)",
        trailColor: "rgb(2, 119, 189, .45)",
        strokeWidth: 40,
        trailWidth: 40,
        duration: 250,
        easing: "easeInOut",
    });

    StressIndicator = new ProgressBar.Circle("#StressIndicator", {
        color: "rgb(152, 68, 71)",
        trailColor: "rgb(152, 68, 71, .45)",
        strokeWidth: 40,
        trailWidth: 40,
        duration: 250,
        easing: "easeInOut",
    });

    OxygenIndicator = new ProgressBar.Circle("#OxygenIndicator", {
        color: "rgb(73, 90, 116)",
        trailColor: "rgb(73, 90, 116, .45)",
        strokeWidth: 40,
        trailWidth: 40,
        duration: 250,
        easing: "easeInOut",
    });


    DevMode = new ProgressBar.Circle("#DevMode", {
        color: "rgb(1, 1 ,1)",
        trailColor: "rgb(1, 1 ,1)",
        strokeWidth: 40,
        trailWidth: 40,
        duration: 250,
        easing: "easeInOut",
    });

    DebugMode = new ProgressBar.Circle("#DebugMode", {
        color: "rgb(1, 1 ,1)",
        trailColor: "rgb(1, 1 ,1)",
        strokeWidth: 40,
        trailWidth: 40,
        duration: 250,
        easing: "easeInOut",
    });

    // Speedometer = new ProgressBar.Circle("#SpeedGauge", {
    //     color: "#235157",
    //     trailColor: "#ffffff",
    //     strokeWidth: 8,
    //     duration: 100,
    //     trailWidth: 8,
    //     easing: "easeInOut",
    // });

    // FuelIndicator = new ProgressBar.Circle("#GasGauge", {
    //     color: "#235157",
    //     trailColor: "#ffffff",
    //     strokeWidth: 13,
    //     duration: 100,
    //     trailWidth: 13,
    //     easing: "easeInOut",
    // });

    // NosIndicator = new ProgressBar.Line("#NosGauge", {
    //     color: "#235157",
    //     trailColor: "#ffffff",
    //     strokeWidth: 13,
    //     duration: 100,
    //     trailWidth: 13,
    //     easing: "easeInOut",
    // });

    VoiceIndicator = new ProgressBar.Circle("#VoiceIndicator", {
        trailColor: "rgb(255, 255, 255, .45)",
        strokeWidth: 40,
        trailWidth: 40,
        easing: "easeInOut",
    });
    VoiceIndicator.animate(0.66);
});

window.addEventListener("message", function(event) {
    let data = event.data;

    if (data.action == "update_hud") {
        HealthIndicator.animate(data.hp / 100);
        ArmorIndicator.animate(data.armor / 100);
        HungerIndicator.animate(data.hunger / 100);
        ThirstIndicator.animate(data.thirst / 100);
        StressIndicator.animate(data.stress / 100);
        OxygenIndicator.animate(data.oxygen / 100);
    }

    // Get current voice level and animate path
    if (data.action == "voice_level") {
        switch (data.voicelevel) {
            case 1:
                data.voicelevel = 33;
                break;
            case 2:
                data.voicelevel = 66;
                break;
            case 3:
                data.voicelevel = 100;
                break;
            default:
                data.voicelevel = 33;
                break;
        }
        VoiceIndicator.animate(data.voicelevel / 100);
    }

    if (data.pActive == true) {
        VoiceIndicator.path.setAttribute("stroke", "#ff3361");
        VoiceIndicator.trail.setAttribute("stroke", 'rgb(255, 51, 97, .45)');
    } else if (data.talking == true) {
        VoiceIndicator.path.setAttribute("stroke", "#f2ef45");
        VoiceIndicator.trail.setAttribute("stroke", 'rgb(212, 219, 69, .45)');
    } else if (data.talking == false) {
        VoiceIndicator.path.setAttribute("stroke", "#ffffff");
        VoiceIndicator.trail.setAttribute("stroke", 'rgb(255, 255 ,255, 0.45)');
    }

    if (data.checkseatbelt == false) {
        $("#Seatbelt_Icon2").fadeIn(1000);
        $("#Seatbelt_Icon2").addClass("engineBad");
    } else if (data.checkseatbelt == true) {
        $("#Seatbelt_Icon2").fadeOut(1000);
    }

    if (data.DevMode == false) {
        $("#DevMode").fadeOut();
    } else if (data.DevMode == true) {
        $("#DevMode").show();
    }


    if (data.DebugMode == false) {
        $("#DebugMode").fadeOut();
    } else if (data.DebugMode == true) {
        $("#DebugMode").show();
    }


    // Headset icon if using radio
    if (data.radio == true) {
        $("#VoiceIcon").removeClass("fa-microphone");
        $("#VoiceIcon").addClass("fa-headset");
    } else if (data.radio == false) {
        $("#VoiceIcon").removeClass("fa-headset");
        $("#VoiceIcon").addClass("fa-microphone");
    }

    // Hide stress if disabled
    if (data.action == "disable_stress") {
        $("#StressIndicator").hide();
    }

    // Hide voice if disabled
    if (data.action == "disable_voice") {
        $("#VoiceIndicator").hide();
    }

    // Show oxygen if underwater
    if (data.showOxygen == true) {
        $("#OxygenIndicator").show();
    } else if (data.showOxygen == false) {
        $("#OxygenIndicator").hide();
    }

    if (data.stress == 0 || data.stress <= 10) {
        $("#StressIndicator").fadeOut();
    } else if (data.stress > 10) {
        $("#StressIndicator").fadeIn();
    }

// AUTOMATICS    
    if (data.hp == 100) {
        $("#HealthIndicator").fadeOut(2300);
    }
    else if (data.hp < 95) 
        $("#HealthIndicator").fadeIn(2300);{
    }

    if (data.armor == 100) {
        $("#ArmorIndicator").fadeOut(2300);
    }
        else if (data.armor < 95) 
        $("#ArmorIndicator").fadeIn(2300);{
    }

    if (data.hunger > 95) {
        $("#HungerIndicator").fadeOut(2300);
    }
    else if (data.hunger < 95) 
        $("#HungerIndicator").fadeIn(2300);{
    }

    if (data.thirst > 95) {
        $("#ThirstIndicator").fadeOut(2300);
    }
    else if (data.thirst < 95) 
        $("#ThirstIndicator").fadeIn(2300);{
    }
// 

    if (data.hp == 0 || data.death == true) {
        HealthIndicator.path.setAttribute("stroke", "rgb(213, 0, 0, .45)");
        HealthIndicator.trail.setAttribute("stroke", '#d50000');
    } else if (data.hp < 25) {
        HealthIndicator.path.setAttribute("stroke", "rgb(221, 81, 0)");
        HealthIndicator.trail.setAttribute("stroke", 'rgb(244, 0, 0, .45)');
    } else if (data.hp > 25) {
        HealthIndicator.path.setAttribute("stroke", "rgb(59, 178, 115)");
        HealthIndicator.trail.setAttribute("stroke", 'rgb(43, 147, 115, .45)');
    }

    if (data.armor == 0) {
        ArmorIndicator.path.setAttribute("stroke", "rgb(21, 101, 172)");
        ArmorIndicator.trail.setAttribute("stroke", '#d50000');
    } else if (data.armor < 25) {
        ArmorIndicator.path.setAttribute("stroke", "rgb(221, 81, 0)");
        ArmorIndicator.trail.setAttribute("stroke", 'rgb(244, 0, 0, .45)');
    } else if (data.armor > 25) {
        ArmorIndicator.path.setAttribute("stroke", "rgb(21, 101, 172)");
        ArmorIndicator.trail.setAttribute("stroke", 'rgb(21, 101, 172, .45)');
    }

    if (data.engine == false) {
        $("#checkengine").fadeOut(1000);
    } else if (data.engine == true) {
        $("#checkengine").fadeIn(1000);
        $("#checkengine").addClass("engineBad");
    }

    if (data.thirst == 0) {
        ThirstIndicator.path.setAttribute("stroke", "#d50000");
        ThirstIndicator.trail.setAttribute("stroke", '#d50000');
    } else if (data.thirst < 25) {
        ThirstIndicator.path.setAttribute("stroke", "rgb(221, 81, 0)");
        ThirstIndicator.trail.setAttribute("stroke", 'rgb(244, 0, 0, .45)');
    } else if (data.thirst > 25) {
        ThirstIndicator.path.setAttribute("stroke", "rgb(2, 119, 189)");
        ThirstIndicator.trail.setAttribute("stroke", 'rgb(2, 119, 189, .45)');
    }

    if (data.hunger == 0) {
        HungerIndicator.path.setAttribute("stroke", "#d50000");
        HungerIndicator.trail.setAttribute("stroke", '#d50000');
    } else if (data.hunger < 25) {
        HungerIndicator.path.setAttribute("stroke", "rgb(255, 109, 0, .45)");
        HungerIndicator.trail.setAttribute("stroke", 'rgb(255, 109, 0)');
    } else if (data.hunger > 25) {
        HungerIndicator.path.setAttribute("stroke", "#rgb(255, 109, 0, .45)");
        HungerIndicator.path.setAttribute("stroke", "rgb(255, 109, 0)");
    }

    if (data.direction) {
        $(".direction").find(".image").attr('style', 'transform: translate3d(' + data.direction + 'px, 0px, 0px)');
    return;
    }

    $(".Street_1").text(data.street);
    $(".Street_2").text(data.street2);

    if (data.speed > 0) {
        $(".Speed_Meter").text(data.speed);
        let multiplier = data.maxspeed * 0.1;
        let SpeedoLimit = data.maxspeed + multiplier;
        setProgressSpeed(data.speed,'.Speed_Meter');
    } else if (data.speed == 0) {
        $(".Speed_Meter").text("0");
    }

    if (data.action == "update_fuel") {
        setProgressFuel(data.fuel,'.Gas_gauge');
    }

    if (data.showUi == true) {
        $(".container").show();
    } else if (data.showUi == false) {
        $(".container").hide();
    }

    if (data.showCarUi == true) {
        $(".Vehicle_hud").show();
        $("#Street1").show()
        $("#Street2").show()
        $("#streetwrapper").show()
        $("#compassindicator").show()
    } else if (data.showCarUi == false && data.ShowLocation == false) {
        $(".Vehicle_hud").hide();
        $("#Street1").hide()
        $("#Street2").hide()
        $("#streetwrapper").hide()
        $("#compassindicator").hide()
    }



     if (data.ShowLocation == true) {
        $("#Street1").show()
        $("#Street2").show()
        $("#streetwrapper").show()
        $("#compassindicator").show()
        $(".Vehicle_hud").hide();
    } else if (data.ShowLocation == false) {
        $("#Street1").hide()
        $("#Street2").hide()
        $("#streetwrapper").hide()
        $("#compassindicator").hide()
        $(".Vehicle_hud").hide();
    }


    // if (data.showNitrous == true) {
    //     $("#NosGauge").show();
    //     $("#Noslabel").show();
    // } else if (data.showNitrous == false) {
    //     $("#NosGauge").hide();
    //     $("#Noslabel").hide();
    // }

    if (data.action == "toggle_hud") {
        $("body").fadeToggle()
    }
});

function setProgressSpeed(value, element){
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    var html = $(element).parent().parent().find('span');
    var percent = value*100/220;
  
    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;
  
    const offset = circumference - ((-percent*73)/100) / 100 * circumference;
    circle.style.strokeDashoffset = -offset;
  
    var predkosc = Math.floor(value * 1.8)
    if (predkosc == 81 || predkosc == 131) {
      predkosc = predkosc - 1
    }
  
    html.text(predkosc);
  }
  
  function setProgressFuel(percent, element){
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    var html = $(element).parent().parent().find('span');
  
    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;
  
    const offset = circumference - ((-percent*73)/100) / 100 * circumference;
    circle.style.strokeDashoffset = -offset;
  
    html.text(Math.round(percent));
  }