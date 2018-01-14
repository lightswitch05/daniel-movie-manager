import { Component, OnInit, Input } from '@angular/core';
import { Movie } from '../movie';

@Component({
  selector: 'app-movie',
  templateUrl: './movie.component.html',
  styleUrls: ['./movie.component.scss']
})
export class MovieComponent implements OnInit {
  @Input() movie: Movie;
  fullPoster: boolean;

  constructor() { }

  ngOnInit() {
    this.fullPoster = false;
  }

  formattedLength() {
    const minutes = this.movie.length % 60;
    const minutesFormatted = `0${minutes}`.slice(-2);
    const hours = Math.floor(this.movie.length / 60);
    return `${hours} h ${minutesFormatted} m`;
  }

  togglePoster() {
    this.fullPoster = !this.fullPoster;
  }

}
