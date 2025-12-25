import 'package:aqi_monitor/model/aqi_model.dart';


class HealthMeasures {
  static Map<String, String> getAqiLevel(AqiResponse res) {
    if (res.data.aqi > 0 && res.data.aqi <= 50) {
      return {
        "status": "Good",
        "desc":
        "Air quality is considered satisfactory, and air pollution poses little or no risk",
        "precautions": "Promote plantation and green cover to improve air purification"
      };
    } else if (res.data.aqi > 50 && res.data.aqi <= 100) {
      return {
        "status": "Moderate",
        "desc":
        "Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.",
        "precautions":
        "Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion.",
      };
    } else if (res.data.aqi > 100 && res.data.aqi <= 150) {
      return {
        "status": "Poor",
        "desc":
        "Members of sensitive groups may experience health effects. The general public is not likely to be affected.",
        "precautions":
        "Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion.",
      };
    } else if (res.data.aqi > 150 && res.data.aqi <= 200) {
      return {
        "status": "Unhealthy",
        "desc":
        "Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects",
        "precautions":
        "Active children and adults, and people with respiratory disease, such as asthma, should avoid prolonged outdoor exertion; everyone else, especially children, should limit prolonged outdoor exertion",
      };
    } else if (res.data.aqi > 200 && res.data.aqi <= 300) {
      return {
        "status": "Severe",
        "desc":
        "Health warnings of emergency conditions. The entire population is more likely to be affected.",
        "precautions":
        "Active children and adults, and people with respiratory disease, such as asthma, should avoid all outdoor exertion; everyone else, especially children, should limit outdoor exertion.",
      };
    }
    return {
      "status": "Hazardous",
      "desc":
      "Health alert: everyone may experience more serious health effects.",
      "precautions": "Everyone should avoid all outdoor exertion.",
    };
  }
}



