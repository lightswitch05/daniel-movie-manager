import {Component, OnInit} from '@angular/core';
import {Movie} from '../shared/movie';
import {MovieService} from '../shared/movie.service';
import {ConfirmModalComponent} from '../../confirm-modal/confirm-modal.component';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';

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

  delete(movie) {
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

}
