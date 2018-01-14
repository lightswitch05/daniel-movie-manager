import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent }      from './home/home.component';
import { MovieListComponent }      from './movies/movie-list/movie-list.component';

const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'movies', component: MovieListComponent },
  { path: '', redirectTo: '/home', pathMatch: 'full' },
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})

export class AppRoutingModule {}
