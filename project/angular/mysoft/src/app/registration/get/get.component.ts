import { Component, OnInit } from '@angular/core';
import { RegService } from '../reg.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-get',
  templateUrl: './get.component.html',
  styleUrl: './get.component.css'
})
export class GetComponent implements OnInit {
  registrations: any[] = [];

  constructor(private regService: RegService) {}

  ngOnInit(): void {
    this.loadRegistrations();
  }

  loadRegistrations(): void {
    this.regService.getAllRegistrations().subscribe({
      next: (data) => {
        this.registrations = data;
      },
      error: (err) => {
        console.error('Error loading registrations:', err);
      }
    });
  }
}