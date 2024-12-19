import { Component } from '@angular/core';
import { LocationService } from '../../service/location.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-viewlocation',
  templateUrl: './viewlocation.component.html',
  styleUrls: ['./viewlocation.component.css']
})

export class ViewlocationComponent {
  locations: any[] = [];
  filteredLocations: any[] = [];
  selectedLocationName: string = ''; 
 
 

  constructor(
    private locationService: LocationService,
    private router: Router,
  ) {}

  ngOnInit(): void {
    this.loadLocations();
  }

  loadLocations() {
    this.locationService.getAllLocation().subscribe({
      next: (data) => {
        // Check if the data is an array and then assign it
        if (Array.isArray(data)) {
          this.locations = data;
          this.filteredLocations = [...this.locations];
          console.log('Locations loaded successfully', this.locations);
        } else {
          console.error('Expected an array, but received', data);
        }
      },
      error: (err) => {
        // Detailed error message
        console.error('Error loading locations', err);
      }
    });
  }
  

  onLocationSelect(event: Event) {
    const target = event.target as HTMLSelectElement;
    this.selectedLocationName = target.value;

    if (this.selectedLocationName) {
      this.locationService.findLocationName(this.selectedLocationName).subscribe({
        next: (data) => {
          this.filteredLocations = data;
        },
        error: (err) => {
          console.error('Error loading selected location', err);
        }
      });
    } else {
      this.filteredLocations = [...this.locations];
    }
  }


  deleteLocation(id: string): void {
    if (confirm('Are you sure you want to delete this location?')) {
      this.locationService.deleteLocation(id).subscribe({
        next: () => {
          // Filter out the deleted location from the filtered locations array
          this.filteredLocations = this.filteredLocations.filter(location => location.id !== id);
          console.log('Location deleted successfully.');
        },
        error: err => {
          console.error('Error deleting location', err);
        }
      });
    }
  }


  updateLocation(id: string) {
    this.router.navigate(['/update', id]);
  }
  
}
