import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { LocationModel } from '../../model/location.model';
import { LocationService } from '../../service/location.service';

@Component({
  selector: 'app-updatelocation',
  templateUrl: './updatelocation.component.html',
  styleUrls: ['./updatelocation.component.css']
})
export class UpdatelocationComponent implements OnInit {
  location: LocationModel = new LocationModel();
  id: string = '';
  imageFile?: File; // To store selected image file

  constructor(
    private locationService: LocationService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    this.locationService.getLocationById(this.id).subscribe({
      next: (res) => {
        this.location = res;
      },
      error: (err) => {
        console.error('Error fetching location by ID:', err);
      }
    });
  }

  onFileChange(event: any) {
    const file = event.target.files[0];
    if (file) {
      this.imageFile = file;
    }
  }

  updateLocation() {
    this.locationService.updateLocation(this.id, this.location, this.imageFile).subscribe({
      next: () => {
        alert('Location updated successfully!');
        this.router.navigate(['/location']);
      },
      error: (err) => {
        console.error('Error updating location:', err);
        alert('Failed to update location. Please try again.');
      }
    });
  }
}
