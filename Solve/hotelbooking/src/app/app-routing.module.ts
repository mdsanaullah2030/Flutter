import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ViewlocationComponent } from './location/viewlocation/viewlocation.component';





import { AboutComponent } from './style/about/about.component';
import { HomeComponent } from './style/home/home.component';






import { UpdatelocationComponent } from './location/updatelocation/updatelocation.component';
import { CreatelocationComponent } from './location/createlocation/createlocation.component';








const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },


  { path: 'about', component: AboutComponent },
  { path: 'home', component: HomeComponent },
  { path: 'location', component: ViewlocationComponent },
  { path: 'save', component: CreatelocationComponent },
  { path: 'update/:id', component: UpdatelocationComponent },
 


  



  
  



];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

