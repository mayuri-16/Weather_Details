import { LightningElement , track} from 'lwc';
import getWeatherDetails from '@salesforce/apex/WeatherDetailsClass.getWeatherDetails';

export default class WeatherDetailsComp extends LightningElement {

    @track inputCityName = '';
    weatherDetails = {};
    showWeatherDetails = false;


    handleInput(event){
        this.inputCityName=event.detail.value;
    }

    handleWeatherDetails(){
        getWeatherDetails({cityName: this.inputCityName})
          .then((result)=> {
            this.showWeatherDetails=true;
            this.weatherDetails=result; 
          })
          .catch((error) =>{
            this.showWeatherDetails=false;
            console.log("Some error occurred while fetching weather details");

          });
          console.log('Result '+JSON.stringify(this.weatherDetails));
    }

}