import { Component, OnInit } from '@angular/core';
import { RegistrationModel } from '../../model/Registration';
import { RegService } from '../reg.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-update',
  templateUrl: './update.component.html',
  styleUrl: './update.component.css'
})
export class UpdateComponent implements OnInit {
  registration: RegistrationModel = new RegistrationModel();
  id: string = "";
  selectedImage?: File;

  constructor(
    private regService: RegService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    // Retrieve the registration ID from the route and fetch data for editing
    this.id = this.route.snapshot.params['id'];
    this.regService.getRegistrationById(this.id).subscribe({
      next: (res) => {
        this.registration = res;
      },
      error: (error) => {
        console.log(error);
      }
    });
  }



  // Update the registration by submitting the form
  updateRegistration() {
    this.regService.updateRegistration(this.id, this.registration).subscribe({
      next: (res) => {
        this.router.navigate(['/registrations']);
      },
      error: (error) => {
        console.log(error);
      }
    });
  }
}







