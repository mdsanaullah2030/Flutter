
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { LocationModel } from '../model/location.model';



@Injectable({
  providedIn: 'root'
})
export class LocationService {


  baseUrl: string = "http://localhost:8080/api/registrations"






  constructor(private httpClient: HttpClient,
   
  ) { }



  getAllLocation(): Observable<any> {
   
    return this.httpClient.get(this.baseUrl)
  }

  getLocationById(locationId: string): Observable<any> {
  
    return this.httpClient.get<any>(this.baseUrl + locationId);
  }

  
  createLocation(location: LocationModel): Observable<LocationModel> {

    const formData = new FormData();

    formData.append('location', new Blob([JSON.stringify(location)], { type: 'application/json' }));



    
  

 
    return this.httpClient.post<LocationModel>(this.baseUrl + "save", formData);

  }


  findLocationName(locationName: string): Observable<LocationModel[]> {
    const params = new HttpParams().set('locationName', locationName);
    // Correctly append the endpoint to baseUrl
    return this.httpClient.get<LocationModel[]>(`${this.baseUrl}findLocationName`, { params });
  }




  updateLocation(id: string, location: LocationModel, image?: File): Observable<any> {
    
    const formData = new FormData();


    formData.append('location', new Blob([JSON.stringify(location)], { type: 'application/json' }));


    if (image) {
      formData.append('image', image);
    }

    return this.httpClient.put(this.baseUrl + 'update/' + id, formData);
  }

  deleteLocation(id: string): Observable<any> {
    
    return this.httpClient.delete(this.baseUrl + 'delete/' + id);
  }
}