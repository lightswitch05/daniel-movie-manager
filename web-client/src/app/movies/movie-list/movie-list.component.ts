import {Component, OnInit} from '@angular/core';
import {Movie} from '../shared/movie';
import {MovieService} from '../shared/movie.service';
import {ConfirmModalComponent} from '../../confirm-modal/confirm-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import {MovieFormComponent} from '../movie-form/movie-form.component';

@Component({
  selector: 'app-movie-list',
  templateUrl: './movie-list.component.html',
  styleUrls: ['./movie-list.component.scss']
})
export class MovieListComponent implements OnInit {
  movies: Movie[];

  constructor(private movieService: MovieService,
              private modalService: NgbModal) { }

  ngOnInit() {
    this.getMovies();
  }

  getMovies(): void {
    this.movieService.getMovies()
      .subscribe(movies => this.movies = movies);
  }

  deleteMovie(movie) {
    const modalRef = this.modalService.open(ConfirmModalComponent);
    modalRef.componentInstance.isDelete = true;
    modalRef.componentInstance.confirmationBoxTitle = 'Delete?';
    modalRef.componentInstance.confirmationMessage = `Are you sure you want to delete ${movie.title}?`;

    modalRef.result.then((confirmation) => {
      if (confirmation) {
        this.movies = this.movies.filter(mov => mov !== movie);
        this.movieService.deleteMovie(movie).toPromise();
      }
    });
  }

  createMovie() {
    const modalRef = this.modalService.open(MovieFormComponent);
    modalRef.componentInstance.movie = {
      title: null,
      format: null,
      length: null,
      release_year: null,
      rating: null
    };

    modalRef.result.then((newMovie) => {
      if (newMovie) {
        this.movies.unshift(newMovie);
      }
    });
  }

  editMovie(movie) {
    const modalRef = this.modalService.open(MovieFormComponent);
    modalRef.componentInstance.movie = Object.assign({}, movie);

    modalRef.result.then((updatedMovie) => {
      Object.assign(movie, updatedMovie);
    });
  }

}
