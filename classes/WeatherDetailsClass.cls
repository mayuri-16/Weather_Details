public class WeatherDetailsClass {

    @AuraEnabled
    public static WeatherDetailsWrapper getWeatherDetails(String cityName){
        
        //Frame the Endpoint URL
        String apiKey ='e4373f3b09e7e479a8d12b5cdd93584a';
        String endpoint = 'http://api.openweathermap.org/data/2.5/weather';
        endpoint += '?q='+cityName;
        endpoint += '&units=metric';
        endpoint += '&APPID='+apiKey;
        System.debug('EndPoint URL '+endpoint);
        
        //callout to weather API
        Http http =new http();
        httpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        HttpResponse res = http.send(req);
        System.debug('res '+res+' Body '+JSON.deserializeUntyped(res.getBody()));
        
        //Return the weather details in wrapper form
        WeatherDetailsWrapper weatherDet = new WeatherDetailsWrapper();
        if(res.getStatusCode()==200){
            Map<String, object> result = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            weatherDet.city = String.valueOf(result.get('name'));
            Map<String,object> mainResult = (Map<String,object>)(result.get('main'));
            weatherDet.temperature = String.valueOf(mainResult.get('temp'));
            weatherDet.pressure = String.valueOf(mainResult.get('pressure'));
            weatherDet.humidity = String.valueOf(mainResult.get('humidity'));
            weatherDet.feelsLike  = String.valueOf(mainResult.get('feels_like'));
            weatherDet.tempMin  = String.valueOf(mainResult.get('temp_min'));
            weatherDet.tempMax  = String.valueOf(mainResult.get('temp_max')); 
        }
        System.debug('WeatherDet '+weatherDet);
        return weatherDet;
    }
    
    
    // Wrapper class to store weather details in serial manner
    public class WeatherDetailsWrapper{
        @AuraEnabled public String city {get; set;}
        @AuraEnabled public String temperature {get; set;}
        @AuraEnabled public String pressure {get; set;}
        @AuraEnabled public String humidity {get; set;}
        @AuraEnabled public String feelsLike {get; set;}
        @AuraEnabled public String tempMin {get; set;}
        @AuraEnabled public String tempMax {get; set;}
        
    }
}