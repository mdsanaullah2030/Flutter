import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';

import {
  HttpClientModule,
  provideHttpClient,
  withFetch,
} from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { GetComponent } from './registration/get/get.component';
import { PostComponent } from './registration/post/post.component';
import { UpdateComponent } from './registration/update/update.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RegService } from './registration/reg.service';

@NgModule({
  declarations: [
    AppComponent,
    GetComponent,
    PostComponent,
    UpdateComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    HttpClientModule,
   
    
  ],
  providers: [
    provideClientHydration(), provideHttpClient(withFetch()),RegService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
