# Weather Details
Weather Details mini Project using LWC with Integration

Step 1 :<br>
 Sign up in OpenWeather API<br>
 > >Navigate to Weather API website and create account<br>
     [ https://openweatherman.org/](https://openweathermap.org/)<br>
> >Verify your email and then get the API key, Endpoint<br>
   
Step 2 :<br>
> >Register the Weather Site in Remote Site Settings in Salesforce.Remember to Append Protocol(HTTP://)

Step 3 :<br>
> >Create An Apex class to make API Callout and return the Weather Details in a Wrapper<br>
    Create an aura enabled method inside an apex class which will be responsible to make an API caout to OpenWeather API and then store and return as wrapper<br>

Step 4 :<br>
> >Create LWC component that will have an input text element to accept city name and a button upon clicking on which the respective apex class will be called imperatively and display the returned data on the UI <br>
