import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { GetComponent } from './registration/get/get.component';
import { PostComponent } from './registration/post/post.component';
import { UpdateComponent } from './registration/update/update.component';

const routes: Routes = [
  
  {path:'get',component:GetComponent},
  {path:'post',component:PostComponent},
  { path: 'update/:id', component: UpdateComponent },


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
