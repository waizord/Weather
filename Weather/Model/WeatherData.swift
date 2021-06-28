//
//  WeatherData.swift
//  Weather
//
//  Created by Ivan on 6/19/21.
//

import Foundation

struct Feels_like: Codable {
    var day: Double = 0.0
    var eve: Double = 0.0
    var morn: Double = 0.0
    var night: Double = 0.0
}

struct Daily: Codable {
    var weather = [Weather]()
    var feels_like = Feels_like()
    var clouds: Int = 0
    var dew_point: Double = 0.0
    var dt: Double = 0.0
    var humidity: Int = 0
    var moon_phase: Double = 0.0
    var moonrise: Double = 0.0
    var moonset: Double = 0.0
    var pop: Double = 0.0
    var pressure: Int = 0
    var sunrise: Double = 0.0
    var sunset: Double = 0.0
    var uvi: Double = 0.0
    var wind_deg: Double = 0.0
    var wind_gust: Double = 0.0
    var wind_speed: Double = 0.0
    var temp = Temp()
    var rain: Double?
}

struct Temp: Codable {
    var day: Double = 0.0
    var eve: Double = 0.0
    var max: Double = 0.0
    var min: Double = 0.0
    var morn: Double = 0.0
    var night: Double = 0.0
}

struct Hourly: Codable {
    var weather = [Weather]()
    var feels_like: Double = 0.0
    var clouds: Int = 0
    var dew_point: Double = 0.0
    var dt: Double = 0.0
    var humidity: Int = 0
    var pop: Double = 0.0
    var uvi: Double = 0.0
    var wind_deg: Double = 0.0
    var wind_speed: Double = 0.0
    var temp: Double = 0.0
}

struct Weather: Codable {
    var description: String = ""
    var icon: String = ""
    var id: Int = 0
    var main: String = ""
}

struct Current: Codable {
    var weather = [Weather]()
    var feels_like: Double = 0.0
    var clouds: Int = 0
    var dew_point: Double = 0.0
    var dt: Double = 0.0
    var humidity: Int = 0
    var pressure: Int = 0
    var sunrise: Double = 0.0
    var sunset: Double = 0.0
    var uvi: Double = 0.0
    var wind_deg: Double = 0.0
    var wind_speed: Double = 0.0
    var temp: Double = 0.0
}

struct WeatherData: Codable {
    var daily = [Daily]()
    var hourly = [Hourly]()
    var current = Current()
    var lat: Double = 0.0
    var lon: Double = 0.0
    var timezone:String = ""
    var timezone_offset: Int = 0
}


/*
 ["lon": 27.3152, "timezone_offset": 10800, "timezone": Europe/Minsk, "daily": <__NSArrayI 0x600003cdf2a0>(
 {
     clouds = 91;
     "dew_point" = "17.13";
     dt = 1624269600;
     "feels_like" =     {
         day = "27.93";
         eve = "27.94";
         morn = "20.02";
         night = "23.24";
     };
     humidity = 54;
     "moon_phase" = "0.37";
     moonrise = 1624285920;
     moonset = 1624231980;
     pop = "0.09";
     pressure = 1015;
     sunrise = 1624239675;
     sunset = 1624301025;
     temp =     {
         day = "27.24";
         eve = 27;
         max = "27.87";
         min = "17.47";
         morn = "19.7";
         night = "22.98";
     };
     uvi = "7.3";
     weather =     (
                 {
             description = "\U043f\U0430\U0441\U043c\U0443\U0440\U043d\U043e";
             icon = 04d;
             id = 804;
             main = Clouds;
         }
     );
     "wind_deg" = 102;
     "wind_gust" = "12.52";
     "wind_speed" = "5.62";
 },
 {
     clouds = 15;
     "dew_point" = "19.8";
     dt = 1624356000;
     "feels_like" =     {
         day = "30.17";
         eve = "31.28";
         morn = "21.48";
         night = "21.95";
     };
     humidity = 60;
     "moon_phase" = "0.41";
     moonrise = 1624377840;
     moonset = 1624319580;
     pop = "0.5";
     pressure = 1014;
     rain = "0.11";
     sunrise = 1624326088;
     sunset = 1624387436;
     temp =     {
         day = "28.47";
         eve = "28.62";
         max = "29.82";
         min = "19.1";
         morn = "20.95";
         night = "21.69";
     };
     uvi = "6.94";
     weather =     (
                 {
             description = "\U043d\U0435\U0431\U043e\U043b\U044c\U0448\U043e\U0439 \U0434\U043e\U0436\U0434\U044c";
             icon = 10d;
             id = 500;
             main = Rain;
         }
     );
     "wind_deg" = 167;
     "wind_gust" = "12.24";
     "wind_speed" = "5.33";
 },
 {
     clouds = 0;
     "dew_point" = "20.06";
     dt = 1624442400;
     "feels_like" =     {
         day = "30.03";
         eve = "31.35";
         morn = "20.42";
         night = "23.39";
     };
     humidity = 61;
     "moon_phase" = "0.45";
     moonrise = 1624469700;
     moonset = 1624407540;
     pop = "0.32";
     pressure = 1016;
     sunrise = 1624412506;
     sunset = 1624473843;
     temp =     {
         day = "28.3";
         eve = "28.66";
         max = "29.72";
         min = "17.56";
         morn = "20.06";
         night = "23.02";
     };
     uvi = "6.85";
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 170;
     "wind_gust" = "9.31";
     "wind_speed" = "4.4";
 },
 {
     clouds = 100;
     "dew_point" = "20.01";
     dt = 1624528800;
     "feels_like" =     {
         day = "29.59";
         eve = "32.07";
         morn = "22.48";
         night = "26.11";
     };
     humidity = 63;
     "moon_phase" = "0.5";
     moonrise = 1624560960;
     moonset = 1624496160;
     pop = "0.76";
     pressure = 1016;
     rain = "2.2";
     sunrise = 1624498926;
     sunset = 1624560246;
     temp =     {
         day = "27.87";
         eve = "29.59";
         max = "29.59";
         min = "19.79";
         morn = "21.84";
         night = "25.61";
     };
     uvi = "6.8";
     weather =     (
                 {
             description = "\U0434\U043e\U0436\U0434\U044c";
             icon = 10d;
             id = 501;
             main = Rain;
         }
     );
     "wind_deg" = 185;
     "wind_gust" = "4.67";
     "wind_speed" = "3.72";
 },
 {
     clouds = 93;
     "dew_point" = "20.84";
     dt = 1624615200;
     "feels_like" =     {
         day = "30.08";
         eve = "32.53";
         morn = "19.45";
         night = "18.62";
     };
     humidity = 66;
     "moon_phase" = "0.52";
     moonrise = 1624651140;
     moonset = 1624585740;
     pop = 1;
     pressure = 1013;
     rain = "8.16";
     sunrise = 1624585350;
     sunset = 1624646647;
     temp =     {
         day = "27.96";
         eve = "29.74";
         max = "29.74";
         min = "18.57";
         morn = "19.06";
         night = "18.57";
     };
     uvi = "6.22";
     weather =     (
                 {
             description = "\U0434\U043e\U0436\U0434\U044c";
             icon = 10d;
             id = 501;
             main = Rain;
         }
     );
     "wind_deg" = 182;
     "wind_gust" = "13.49";
     "wind_speed" = "5.35";
 },
 {
     clouds = 66;
     "dew_point" = "14.1";
     dt = 1624701600;
     "feels_like" =     {
         day = "23.2";
         eve = "24.39";
         morn = "16.21";
         night = "19.67";
     };
     humidity = 57;
     "moon_phase" = "0.5600000000000001";
     moonrise = 1624740240;
     moonset = 1624676340;
     pop = "0.97";
     pressure = 1015;
     rain = "4.2";
     sunrise = 1624671776;
     sunset = 1624733044;
     temp =     {
         day = "23.32";
         eve = "24.36";
         max = "25.24";
         min = "16.02";
         morn = "16.02";
         night = "19.62";
     };
     uvi = 7;
     weather =     (
                 {
             description = "\U0434\U043e\U0436\U0434\U044c";
             icon = 10d;
             id = 501;
             main = Rain;
         }
     );
     "wind_deg" = 273;
     "wind_gust" = "8.98";
     "wind_speed" = "4.13";
 },
 {
     clouds = 84;
     "dew_point" = "14.27";
     dt = 1624788000;
     "feels_like" =     {
         day = "22.89";
         eve = "22.74";
         morn = "15.58";
         night = "18.04";
     };
     humidity = 58;
     "moon_phase" = "0.6";
     moonrise = 0;
     moonset = 1624767600;
     pop = "0.1";
     pressure = 1013;
     sunrise = 1624758207;
     sunset = 1624819437;
     temp =     {
         day = "23.02";
         eve = "22.79";
         max = "24.27";
         min = "15.33";
         morn = "15.61";
         night = "18.04";
     };
     uvi = 7;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 261;
     "wind_gust" = "8.289999999999999";
     "wind_speed" = "5.23";
 },
 {
     clouds = 89;
     "dew_point" = "16.5";
     dt = 1624874400;
     "feels_like" =     {
         day = "21.09";
         eve = "20.34";
         morn = "15.21";
         night = 18;
     };
     humidity = 76;
     "moon_phase" = "0.63";
     moonrise = 1624828440;
     moonset = 1624859040;
     pop = 1;
     pressure = 1012;
     rain = "8.73";
     sunrise = 1624844640;
     sunset = 1624905827;
     temp =     {
         day = "20.95";
         eve = "20.11";
         max = "20.95";
         min = "14.3";
         morn = "15.18";
         night = "17.77";
     };
     uvi = 7;
     weather =     (
                 {
             description = "\U043d\U0435\U0431\U043e\U043b\U044c\U0448\U043e\U0439 \U0434\U043e\U0436\U0434\U044c";
             icon = 10d;
             id = 500;
             main = Rain;
         }
     );
     "wind_deg" = 260;
     "wind_gust" = "9.609999999999999";
     "wind_speed" = "5.42";
 }
 )
 , "lat": 53.5273, "hourly": <__NSArrayI 0x7fa1bdd1c160>(
 {
     clouds = 79;
     "dew_point" = "17.08";
     dt = 1624284000;
     "feels_like" = "27.87";
     humidity = 54;
     pop = 0;
     pressure = 1013;
     temp = "27.19";
     uvi = "3.21";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 97;
     "wind_gust" = "7.62";
     "wind_speed" = "5.28";
 },
 {
     clouds = 76;
     "dew_point" = "17.52";
     dt = 1624287600;
     "feels_like" = "28.13";
     humidity = 55;
     pop = 0;
     pressure = 1013;
     temp = "27.35";
     uvi = "1.84";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 98;
     "wind_gust" = "8.699999999999999";
     "wind_speed" = "5.53";
 },
 {
     clouds = 68;
     "dew_point" = "18.04";
     dt = 1624291200;
     "feels_like" = "27.94";
     humidity = 58;
     pop = 0;
     pressure = 1013;
     temp = 27;
     uvi = "0.85";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 102;
     "wind_gust" = "10.37";
     "wind_speed" = "5.62";
 },
 {
     clouds = 57;
     "dew_point" = "18.86";
     dt = 1624294800;
     "feels_like" = "26.29";
     humidity = 65;
     pop = 0;
     pressure = 1012;
     temp = "25.94";
     uvi = "0.33";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 105;
     "wind_gust" = "11.41";
     "wind_speed" = "5.44";
 },
 {
     clouds = 45;
     "dew_point" = "19.56";
     dt = 1624298400;
     "feels_like" = "24.94";
     humidity = 74;
     pop = 0;
     pressure = 1013;
     temp = "24.5";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0435\U0440\U0435\U043c\U0435\U043d\U043d\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 03d;
             id = 802;
             main = Clouds;
         }
     );
     "wind_deg" = 102;
     "wind_gust" = "11.94";
     "wind_speed" = "4.68";
 },
 {
     clouds = 1;
     "dew_point" = "18.61";
     dt = 1624302000;
     "feels_like" = "23.94";
     humidity = 74;
     pop = "0.03";
     pressure = 1013;
     temp = "23.59";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01n;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 105;
     "wind_gust" = "12.52";
     "wind_speed" = "5.31";
 },
 {
     clouds = 0;
     "dew_point" = "17.82";
     dt = 1624305600;
     "feels_like" = "23.24";
     humidity = 73;
     pop = "0.04";
     pressure = 1013;
     temp = "22.98";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01n;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 120;
     "wind_gust" = "12.29";
     "wind_speed" = "5.24";
 },
 {
     clouds = 7;
     "dew_point" = "17.84";
     dt = 1624309200;
     "feels_like" = "22.24";
     humidity = 78;
     pop = 0;
     pressure = 1013;
     temp = "21.95";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01n;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 121;
     "wind_gust" = "12.24";
     "wind_speed" = "4.77";
 },
 {
     clouds = 29;
     "dew_point" = "18.26";
     dt = 1624312800;
     "feels_like" = "22.11";
     humidity = 81;
     pop = 0;
     pressure = 1013;
     temp = "21.76";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0435\U0440\U0435\U043c\U0435\U043d\U043d\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 03n;
             id = 802;
             main = Clouds;
         }
     );
     "wind_deg" = 129;
     "wind_gust" = "11.76";
     "wind_speed" = "4.4";
 },
 {
     clouds = 43;
     "dew_point" = "18.48";
     dt = 1624316400;
     "feels_like" = "21.35";
     humidity = 86;
     pop = "0.1";
     pressure = 1013;
     temp = "20.95";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0435\U0440\U0435\U043c\U0435\U043d\U043d\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 03n;
             id = 802;
             main = Clouds;
         }
     );
     "wind_deg" = 132;
     "wind_gust" = "9.960000000000001";
     "wind_speed" = "3.61";
 },
 {
     clouds = 53;
     "dew_point" = "18.58";
     dt = 1624320000;
     "feels_like" = "20.52";
     humidity = 91;
     pop = "0.18";
     pressure = 1014;
     temp = "20.08";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04n;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 125;
     "wind_gust" = "8.83";
     "wind_speed" = "3.24";
 },
 {
     clouds = 99;
     "dew_point" = "18.58";
     dt = 1624323600;
     "feels_like" = "19.93";
     humidity = 95;
     pop = 0;
     pressure = 1013;
     temp = "19.45";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0430\U0441\U043c\U0443\U0440\U043d\U043e";
             icon = 04n;
             id = 804;
             main = Clouds;
         }
     );
     "wind_deg" = 123;
     "wind_gust" = "7.98";
     "wind_speed" = "3.06";
 },
 {
     clouds = 100;
     "dew_point" = "18.49";
     dt = 1624327200;
     "feels_like" = "19.6";
     humidity = 97;
     pop = "0.01";
     pressure = 1013;
     temp = "19.1";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0430\U0441\U043c\U0443\U0440\U043d\U043e";
             icon = 04d;
             id = 804;
             main = Clouds;
         }
     );
     "wind_deg" = 122;
     "wind_gust" = "7.97";
     "wind_speed" = "3.16";
 },
 {
     clouds = 98;
     "dew_point" = "18.76";
     dt = 1624330800;
     "feels_like" = "20.12";
     humidity = 96;
     pop = 0;
     pressure = 1013;
     temp = "19.6";
     uvi = "0.19";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0430\U0441\U043c\U0443\U0440\U043d\U043e";
             icon = 04d;
             id = 804;
             main = Clouds;
         }
     );
     "wind_deg" = 124;
     "wind_gust" = "7.8";
     "wind_speed" = "3.18";
 },
 {
     clouds = 80;
     "dew_point" = "19.35";
     dt = 1624334400;
     "feels_like" = "21.48";
     humidity = 91;
     pop = 0;
     pressure = 1013;
     temp = "20.95";
     uvi = "0.58";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 133;
     "wind_gust" = "7.45";
     "wind_speed" = "3.83";
 },
 {
     clouds = 75;
     "dew_point" = "19.83";
     dt = 1624338000;
     "feels_like" = "22.98";
     humidity = 85;
     pop = 0;
     pressure = 1014;
     temp = "22.46";
     uvi = "1.33";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 142;
     "wind_gust" = "7.75";
     "wind_speed" = "4.67";
 },
 {
     clouds = 67;
     "dew_point" = "20.14";
     dt = 1624341600;
     "feels_like" = "24.47";
     humidity = 79;
     pop = 0;
     pressure = 1014;
     temp = "23.96";
     uvi = "2.47";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 153;
     "wind_gust" = "7.9";
     "wind_speed" = "5.04";
 },
 {
     clouds = 10;
     "dew_point" = "20.23";
     dt = 1624345200;
     "feels_like" = "25.84";
     humidity = 74;
     pop = "0.08";
     pressure = 1014;
     temp = "25.32";
     uvi = "3.9";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 161;
     "wind_gust" = "7.32";
     "wind_speed" = "4.94";
 },
 {
     clouds = 8;
     "dew_point" = "20.2";
     dt = 1624348800;
     "feels_like" = "26.56";
     humidity = 68;
     pop = "0.08";
     pressure = 1014;
     temp = "26.56";
     uvi = "5.34";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 168;
     "wind_gust" = "6.79";
     "wind_speed" = "4.58";
 },
 {
     clouds = 13;
     "dew_point" = "20.17";
     dt = 1624352400;
     "feels_like" = "29.18";
     humidity = 64;
     pop = "0.04";
     pressure = 1014;
     temp = "27.54";
     uvi = "6.46";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043d\U0435\U0431\U043e\U043b\U044c\U0448\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 02d;
             id = 801;
             main = Clouds;
         }
     );
     "wind_deg" = 169;
     "wind_gust" = "7.07";
     "wind_speed" = "5.03";
 },
 {
     clouds = 15;
     "dew_point" = "19.8";
     dt = 1624356000;
     "feels_like" = "30.17";
     humidity = 60;
     pop = "0.04";
     pressure = 1014;
     temp = "28.47";
     uvi = "6.94";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043d\U0435\U0431\U043e\U043b\U044c\U0448\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 02d;
             id = 801;
             main = Clouds;
         }
     );
     "wind_deg" = 167;
     "wind_gust" = "7.2";
     "wind_speed" = "5.33";
 },
 {
     clouds = 21;
     "dew_point" = "19.66";
     dt = 1624359600;
     "feels_like" = "30.71";
     humidity = 57;
     pop = "0.04";
     pressure = 1014;
     temp = "29.08";
     uvi = "6.71";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043d\U0435\U0431\U043e\U043b\U044c\U0448\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 02d;
             id = 801;
             main = Clouds;
         }
     );
     "wind_deg" = 168;
     "wind_gust" = "7.15";
     "wind_speed" = "5.32";
 },
 {
     clouds = 29;
     "dew_point" = "20.03";
     dt = 1624363200;
     "feels_like" = "31.01";
     humidity = 58;
     pop = "0.04";
     pressure = 1014;
     temp = "29.17";
     uvi = "5.81";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0435\U0440\U0435\U043c\U0435\U043d\U043d\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 03d;
             id = 802;
             main = Clouds;
         }
     );
     "wind_deg" = 164;
     "wind_gust" = "6.32";
     "wind_speed" = "4.22";
 },
 {
     clouds = 52;
     "dew_point" = "20.12";
     dt = 1624366800;
     "feels_like" = "31.61";
     humidity = 57;
     pop = 0;
     pressure = 1014;
     temp = "29.63";
     uvi = "4.5";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 158;
     "wind_gust" = "6.57";
     "wind_speed" = "4.39";
 },
 {
     clouds = 53;
     "dew_point" = "20.91";
     dt = 1624370400;
     "feels_like" = "32.3";
     humidity = 59;
     pop = "0.11";
     pressure = 1013;
     temp = "29.82";
     uvi = "3.03";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 157;
     "wind_gust" = "6.22";
     "wind_speed" = "4.02";
 },
 {
     clouds = 38;
     "dew_point" = "21.23";
     dt = 1624374000;
     "feels_like" = "32.19";
     humidity = 61;
     pop = "0.22";
     pressure = 1013;
     temp = "29.56";
     uvi = "1.73";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0435\U0440\U0435\U043c\U0435\U043d\U043d\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 03d;
             id = 802;
             main = Clouds;
         }
     );
     "wind_deg" = 161;
     "wind_gust" = "5.83";
     "wind_speed" = 4;
 },
 {
     clouds = 37;
     "dew_point" = "21.53";
     dt = 1624377600;
     "feels_like" = "31.28";
     humidity = 66;
     pop = "0.3";
     pressure = 1013;
     temp = "28.62";
     uvi = "0.8100000000000001";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0435\U0440\U0435\U043c\U0435\U043d\U043d\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 03d;
             id = 802;
             main = Clouds;
         }
     );
     "wind_deg" = 163;
     "wind_gust" = "6.42";
     "wind_speed" = "2.92";
 },
 {
     clouds = 33;
     "dew_point" = 21;
     dt = 1624381200;
     "feels_like" = "28.66";
     humidity = 71;
     pop = "0.5";
     pressure = 1013;
     rain =     {
         1h = "0.11";
     };
     temp = "26.84";
     uvi = "0.31";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043d\U0435\U0431\U043e\U043b\U044c\U0448\U043e\U0439 \U0434\U043e\U0436\U0434\U044c";
             icon = 10d;
             id = 500;
             main = Rain;
         }
     );
     "wind_deg" = 135;
     "wind_gust" = "6.5";
     "wind_speed" = "2.74";
 },
 {
     clouds = 32;
     "dew_point" = "19.28";
     dt = 1624384800;
     "feels_like" = "24.55";
     humidity = 75;
     pop = "0.5";
     pressure = 1013;
     temp = "24.12";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0435\U0440\U0435\U043c\U0435\U043d\U043d\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 03d;
             id = 802;
             main = Clouds;
         }
     );
     "wind_deg" = 120;
     "wind_gust" = "8.07";
     "wind_speed" = "3.42";
 },
 {
     clouds = 85;
     "dew_point" = "17.95";
     dt = 1624388400;
     "feels_like" = "22.81";
     humidity = 76;
     pop = 0;
     pressure = 1014;
     temp = "22.52";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0430\U0441\U043c\U0443\U0440\U043d\U043e";
             icon = 04n;
             id = 804;
             main = Clouds;
         }
     );
     "wind_deg" = 123;
     "wind_gust" = "9.390000000000001";
     "wind_speed" = "3.47";
 },
 {
     clouds = 82;
     "dew_point" = "17.52";
     dt = 1624392000;
     "feels_like" = "21.95";
     humidity = 78;
     pop = 0;
     pressure = 1014;
     temp = "21.69";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04n;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 127;
     "wind_gust" = "10.63";
     "wind_speed" = "3.65";
 },
 {
     clouds = 61;
     "dew_point" = "17.16";
     dt = 1624395600;
     "feels_like" = "20.9";
     humidity = 81;
     pop = 0;
     pressure = 1015;
     temp = "20.66";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04n;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 141;
     "wind_gust" = "9.31";
     "wind_speed" = "3.16";
 },
 {
     clouds = 50;
     "dew_point" = "16.89";
     dt = 1624399200;
     "feels_like" = "19.79";
     humidity = 85;
     pop = 0;
     pressure = 1015;
     temp = "19.56";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0435\U0440\U0435\U043c\U0435\U043d\U043d\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 03n;
             id = 802;
             main = Clouds;
         }
     );
     "wind_deg" = 134;
     "wind_gust" = 8;
     "wind_speed" = "3.14";
 },
 {
     clouds = 41;
     "dew_point" = "16.88";
     dt = 1624402800;
     "feels_like" = "19.08";
     humidity = 89;
     pop = 0;
     pressure = 1015;
     temp = "18.82";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0435\U0440\U0435\U043c\U0435\U043d\U043d\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 03n;
             id = 802;
             main = Clouds;
         }
     );
     "wind_deg" = 136;
     "wind_gust" = "6.94";
     "wind_speed" = "3.2";
 },
 {
     clouds = 35;
     "dew_point" = "16.93";
     dt = 1624406400;
     "feels_like" = "18.53";
     humidity = 92;
     pop = 0;
     pressure = 1015;
     temp = "18.25";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U043f\U0435\U0440\U0435\U043c\U0435\U043d\U043d\U0430\U044f \U043e\U0431\U043b\U0430\U0447\U043d\U043e\U0441\U0442\U044c";
             icon = 03n;
             id = 802;
             main = Clouds;
         }
     );
     "wind_deg" = 130;
     "wind_gust" = "7.32";
     "wind_speed" = "3.26";
 },
 {
     clouds = 4;
     "dew_point" = "16.7";
     dt = 1624410000;
     "feels_like" = "18.17";
     humidity = 94;
     pop = 0;
     pressure = 1015;
     temp = "17.87";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01n;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 133;
     "wind_gust" = "6.29";
     "wind_speed" = "2.99";
 },
 {
     clouds = 2;
     "dew_point" = "16.57";
     dt = 1624413600;
     "feels_like" = "17.85";
     humidity = 95;
     pop = 0;
     pressure = 1015;
     temp = "17.56";
     uvi = 0;
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 132;
     "wind_gust" = "6.7";
     "wind_speed" = "2.95";
 },
 {
     clouds = 1;
     "dew_point" = "17.13";
     dt = 1624417200;
     "feels_like" = "18.56";
     humidity = 94;
     pop = 0;
     pressure = 1016;
     temp = "18.23";
     uvi = "0.19";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 136;
     "wind_gust" = "5.78";
     "wind_speed" = "2.35";
 },
 {
     clouds = 1;
     "dew_point" = "17.88";
     dt = 1624420800;
     "feels_like" = "20.42";
     humidity = 88;
     pop = 0;
     pressure = 1016;
     temp = "20.06";
     uvi = "0.58";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 138;
     "wind_gust" = "4.57";
     "wind_speed" = "2.33";
 },
 {
     clouds = 1;
     "dew_point" = "18.38";
     dt = 1624424400;
     "feels_like" = "22.24";
     humidity = 81;
     pop = 0;
     pressure = 1016;
     temp = "21.88";
     uvi = "1.31";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 139;
     "wind_gust" = "5.4";
     "wind_speed" = "3.43";
 },
 {
     clouds = 1;
     "dew_point" = "18.77";
     dt = 1624428000;
     "feels_like" = "23.91";
     humidity = 75;
     pop = 0;
     pressure = 1016;
     temp = "23.54";
     uvi = "2.45";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 140;
     "wind_gust" = "5.15";
     "wind_speed" = "3.5";
 },
 {
     clouds = 0;
     "dew_point" = "19.04";
     dt = 1624431600;
     "feels_like" = "25.48";
     humidity = 69;
     pop = 0;
     pressure = 1016;
     temp = "25.11";
     uvi = "3.9";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 145;
     "wind_gust" = "5.22";
     "wind_speed" = "3.71";
 },
 {
     clouds = 0;
     "dew_point" = "19.23";
     dt = 1624435200;
     "feels_like" = "26.49";
     humidity = 65;
     pop = 0;
     pressure = 1016;
     temp = "26.49";
     uvi = "5.33";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 149;
     "wind_gust" = "5.53";
     "wind_speed" = "4.1";
 },
 {
     clouds = 0;
     "dew_point" = "19.53";
     dt = 1624438800;
     "feels_like" = "28.96";
     humidity = 61;
     pop = 0;
     pressure = 1016;
     temp = "27.59";
     uvi = "6.46";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 160;
     "wind_gust" = "5.48";
     "wind_speed" = "4.21";
 },
 {
     clouds = 0;
     "dew_point" = "20.06";
     dt = 1624442400;
     "feels_like" = "30.03";
     humidity = 61;
     pop = 0;
     pressure = 1016;
     temp = "28.3";
     uvi = "6.85";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 170;
     "wind_gust" = "5.53";
     "wind_speed" = "4.4";
 },
 {
     clouds = 1;
     "dew_point" = "20.32";
     dt = 1624446000;
     "feels_like" = "30.73";
     humidity = 60;
     pop = 0;
     pressure = 1016;
     temp = "28.82";
     uvi = "6.63";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 174;
     "wind_gust" = "5.34";
     "wind_speed" = "4.24";
 },
 {
     clouds = 2;
     "dew_point" = "20.26";
     dt = 1624449600;
     "feels_like" = "31.39";
     humidity = 58;
     pop = 0;
     pressure = 1016;
     temp = "29.4";
     uvi = "5.74";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 171;
     "wind_gust" = "5.21";
     "wind_speed" = "4.01";
 },
 {
     clouds = 5;
     "dew_point" = "20.14";
     dt = 1624453200;
     "feels_like" = "31.77";
     humidity = 57;
     pop = 0;
     pressure = 1016;
     temp = "29.72";
     uvi = "4.36";
     visibility = 10000;
     weather =     (
                 {
             description = "\U044f\U0441\U043d\U043e";
             icon = 01d;
             id = 800;
             main = Clear;
         }
     );
     "wind_deg" = 169;
     "wind_gust" = "4.85";
     "wind_speed" = "3.65";
 }
 )
 , "current": {
     clouds = 79;
     "dew_point" = "17.08";
     dt = 1624285277;
     "feels_like" = "27.87";
     humidity = 54;
     pressure = 1013;
     sunrise = 1624239675;
     sunset = 1624301025;
     temp = "27.19";
     uvi = "3.21";
     visibility = 10000;
     weather =     (
                 {
             description = "\U043e\U0431\U043b\U0430\U0447\U043d\U043e \U0441 \U043f\U0440\U043e\U044f\U0441\U043d\U0435\U043d\U0438\U044f\U043c\U0438";
             icon = 04d;
             id = 803;
             main = Clouds;
         }
     );
     "wind_deg" = 97;
     "wind_gust" = "7.62";
     "wind_speed" = "5.28";
 }]
 */
