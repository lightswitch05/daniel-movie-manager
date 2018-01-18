import {Component, Input, OnInit} from '@angular/core';
import {Movie} from '../shared/movie';
import {MovieService} from '../shared/movie.service';
import {MovieError} from '../shared/movie-error';
import {NgbActiveModal} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-movie-form',
  templateUrl: './movie-form.component.html',
  styleUrls: ['./movie-form.component.scss']
})
export class MovieFormComponent implements OnInit {
  @Input() confirmationBoxTitle: string;
  @Input() movie: Movie;
  apiErrors: MovieError;
  isSaving: boolean;

  constructor(private movieService: MovieService,
              public activeModal: NgbActiveModal) { }

  ngOnInit() {
    this.apiErrors = null;
    this.isSaving = false;
  }

  saveOrUpdateMovie(): void {
    this.isSaving = true;
    if (this.movie.id) {
      this.movieService.updateMovie(this.movie).then(
        (response) => this.handleResponse(response),
        (error) => this.handleError(error)
      );
    } else {
      this.movieService.addMovie(this.movie).then(
        (response) => this.handleResponse(response),
        (error) => this.handleError(error)
      );
    }
  }

  handleResponse(response) {
    this.isSaving = false;
    this.activeModal.close(response);
    this.apiErrors = null;
  }

  handleError(errors) {
    this.isSaving = false;
    this.apiErrors = errors as MovieError;
  }

  action() {
    if (this.isSaving) {
      return 'Saving';
    } else if (this.movie && this.movie.id) {
      return 'Update';
    } else {
      return 'Create';
    }
  }
}
