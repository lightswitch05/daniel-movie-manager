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
  sortType: string;
  modalOpen: boolean;
  sortByAttribute: {
    column: string,
    name: string
  };
  sortableAttributes = [
    {
      column: 'title',
      name: 'Title'
    },
    {
      column: 'release_year',
      name: 'Release Year'
    },
    {
      column: 'format',
      name: 'Format'
    },
    {
      column: 'length',
      name: 'Length'
    },
    {
      column: 'rating',
      name: 'Rating'
    }
  ];

  constructor(private movieService: MovieService,
              private modalService: NgbModal) { }

  ngOnInit() {
    this.sortByAttribute = this.sortableAttributes[0];
    this.sortType = 'asc';
    this.movies = [];
    this.modalOpen = false;
    this.getMovies();
  }

  getMovies(): void {
    this.movieService.getMovies(this.sortByAttribute.column, this.sortType)
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
    this.modalOpen = true;
    const modalRef = this.modalService.open(MovieFormComponent);
    modalRef.componentInstance.movie = {
      title: null,
      format: null,
      length: null,
      release_year: null,
      rating: null
    };

    modalRef.result.then((newMovie) => {
      this.modalOpen = false;
      if (newMovie) {
        this.movies.unshift(newMovie);
      }
    }).catch(() => {
      this.modalOpen = false;
    });
  }

  editMovie(movie) {
    this.modalOpen = true;
    const modalRef = this.modalService.open(MovieFormComponent);
    modalRef.componentInstance.movie = Object.assign({}, movie);

    modalRef.result.then((updatedMovie) => {
      this.modalOpen = false;
      if (updatedMovie) {
        Object.assign(movie, updatedMovie);
      }
    }).catch(() => {
      this.modalOpen = false;
    });
  }

  setSortBy(sortBy) {
    this.sortByAttribute = sortBy;
    this.getMovies();
  }

  setSortType(sortType) {
    this.sortType = sortType;
    this.getMovies();
  }

}
