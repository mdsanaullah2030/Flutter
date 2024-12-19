import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ViewlocationComponent } from './location/viewlocation/viewlocation.component';
import { CreatelocationComponent } from './location/createlocation/createlocation.component';
import { UpdatelocationComponent } from './location/updatelocation/updatelocation.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HTTP_INTERCEPTORS, provideHttpClient, withFetch, withInterceptorsFromDi } from '@angular/common/http';






import { FontAwesomeModule, FaIconLibrary } from '@fortawesome/angular-fontawesome';
import { fas } from '@fortawesome/free-solid-svg-icons';
import { HomeComponent } from './style/home/home.component';
import { AboutComponent } from './style/about/about.component';






import { NgxPrintModule } from 'ngx-print';


@NgModule({
  declarations: [
    AppComponent,
    ViewlocationComponent,
    CreatelocationComponent,
    UpdatelocationComponent,
  

   
   
   
    HomeComponent,
    AboutComponent,
  
  
 
      
      
       
   
   
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    FontAwesomeModule,
    NgxPrintModule,
  ],
  providers: [
    provideHttpClient(withFetch(), withInterceptorsFromDi()),
   
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(library: FaIconLibrary) {
    
    library.addIconPacks(fas);
  }
}
