import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { RegistrationModel } from '../model/Registration';

@Injectable({
  providedIn: 'root'
})
export class RegService {
  private baseUrl = 'http://localhost:8080/api/registrations';

  constructor(private httpClient: HttpClient) {}

  getAllRegistrations(): Observable<any[]> {
    return this.httpClient.get<any[]>(this.baseUrl);
  }


  createRegistrations(registration: RegistrationModel): Observable<RegistrationModel> {
    const formData = new FormData();
    formData.append(
      'registration',
      new Blob([JSON.stringify(registration)], { type: 'application/json' })
    );

    // Send POST request to the backend API
    return this.httpClient.post<RegistrationModel>(this.baseUrl, formData);
  }


  updateRegistration(id: string, registration: RegistrationModel): Observable<any> {
    return this.httpClient.put(`${this.baseUrl}update/${id}`, registration);
  }
  
  
  deleteRegistration(id: string): Observable<any> {

    return this.httpClient.delete(this.baseUrl + 'delete/' + id);
  }
  

  getRegistrationById(registrationId: string): Observable<any> {
    
    return this.httpClient.get<any>(this.baseUrl + registrationId);
  }


}


