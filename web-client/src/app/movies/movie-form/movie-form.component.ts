import {Component, OnInit} from '@angular/core';
import {Movie} from '../shared/movie';
import {MovieService} from '../shared/movie.service';
import {MovieError} from '../shared/movie-error';

@Component({
  selector: 'app-movie-form',
  templateUrl: './movie-form.component.html',
  styleUrls: ['./movie-form.component.scss']
})
export class MovieFormComponent implements OnInit {
  newMovie: Movie = this.createNewMovie();
  apiErrors: MovieError = null;

  constructor(private movieService: MovieService) { }

  ngOnInit() {
  }

  add(movie: Movie): void {
    this.movieService.addMovie(movie).then(
      () => {
        this.newMovie = new Movie();
        this.apiErrors = null;
      },
      (errors) => {
        this.apiErrors = errors as MovieError;
      }
    );
  }

  private createNewMovie() {
    return {
      title: null,
      format: null,
      length: null,
      release_year: null,
      rating: null
    };
  }

}
