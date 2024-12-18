import { Component } from '@angular/core';
import { RegistrationModel } from '../../model/Registration';
import { FormBuilder, FormGroup } from '@angular/forms';
import { RegService } from '../reg.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-post',
  templateUrl: './post.component.html',
  styleUrl: './post.component.css'
})
export class PostComponent {
  registration: RegistrationModel = new RegistrationModel();
  formGroup!: FormGroup;
  registrations: any[] = [];
  filteredRegistrations: any[] = [];

  constructor(
    private regService: RegService,
    private formBuilder: FormBuilder,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadRegistrations();

    this.formGroup = this.formBuilder.group({
      name: ['']
    });
  }

  onSubmit() {
    const registration: RegistrationModel = {
      ...this.formGroup.value
    };

    this.regService.createRegistrations(registration).subscribe({
      next: (res) => {
        console.log('Registration added successfully', res);
        this.router.navigate(['registration']);
        this.loadRegistrations(); // Refresh list after adding
      },
      error: (err) => {
        console.error('Error adding registration:', err);
      }
    });
  }

  loadRegistrations() {
    this.regService.getAllRegistrations().subscribe({
      next: (data) => {
        this.registrations = data;
        this.filteredRegistrations = [...this.registrations];
      },
      error: (err) => {
        console.error('Error loading registrations', err);
      }
    });
  }

  deleteRegistration(id: string): void {
    if (confirm('Are you sure you want to delete this registration?')) {
      this.regService.deleteRegistration(id).subscribe({
        next: () => {
          this.filteredRegistrations = this.filteredRegistrations.filter(reg => reg.id !== id);
          console.log('Registration deleted successfully.');
        },
        error: (err) => {
          console.error('Error deleting registration', err);
        }
      });
    }
  }

  updateRegistration(id: string) {
    this.router.navigate(['/update', id]);
  }
}