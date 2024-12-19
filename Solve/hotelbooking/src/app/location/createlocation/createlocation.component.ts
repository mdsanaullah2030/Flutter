import { Component,} from '@angular/core';
import { LocationModel } from '../../model/location.model';
import { FormBuilder, FormGroup } from '@angular/forms';
import { LocationService } from '../../service/location.service';
import { Router } from '@angular/router';
import { AuthService } from '../../service/auth.service';




@Component({
  selector: 'app-createlocation',
  templateUrl: './createlocation.component.html',
  styleUrl: './createlocation.component.css'
})
export class CreatelocationComponent {
onSubmit() {
throw new Error('Method not implemented.');
}
  image: File | null = null;
  location: LocationModel = new LocationModel();
  formGroup!: FormGroup;
  locations: any[] = [];
  filteredLocations: any[] = [];

  constructor(
    private locationService: LocationService,
    private formBuilder: FormBuilder,
    private router: Router,
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    this.loadLocations();

    this.formGroup = this.formBuilder.group({
      name: ['']
    });
  }


 

  loadLocations() {
    this.locationService.getAllLocation().subscribe({
      next: (data) => {
        this.locations = data;
        this.filteredLocations = [...this.locations]; // Set filtered locations to all
      },
      error: (err) => {
        console.error('Error loading locations', err);
      }
    });
  }



 
}

