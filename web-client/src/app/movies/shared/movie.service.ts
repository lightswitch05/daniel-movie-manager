import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';
import { catchError, map, tap } from 'rxjs/operators';

import { Movie } from './movie';
import { MovieError } from './movie-error';
import apply = Reflect.apply;

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
  observable: 'response'
};

@Injectable()
export class MovieService {

  private moviesUrl = '/movie-api/v1/movies';  // URL to web api

  constructor(private http: HttpClient) { }

  /** GET movies from the server */
  getMovies (): Observable<Movie[]> {
    return this.http.get<Movie[]>(this.moviesUrl)
      .pipe(
        catchError(this.handleError('getMovies', []))
      );
  }

  /** POST: add a new movie to the server */
  addMovie (movie: Movie): Promise<Movie|MovieError> {
    return this.http.post<Movie>(this.moviesUrl, movie, httpOptions)
      .toPromise()
    .then(
      (response) => response,
      (error) => {
        if (error.status === 422) {
          throw error.error as MovieError;
        } else {
          console.log('Error adding movie', error);
          throw {};
        }
      });
  }

  /** DELETE: delete the movie from the server */
  deleteMovie (movie: Movie | number): Observable<Movie> {
    const id = typeof movie === 'number' ? movie : movie.id;
    const url = `${this.moviesUrl}/${id}`;

    return this.http.delete<Movie>(url, httpOptions).pipe(
      catchError(this.handleError<Movie>('deleteMovie'))
    );
  }

  /** PUT: update the movie on the server */
  updateMovie (movie: Movie): Promise<Movie|MovieError> {
    const updateUrl = `${this.moviesUrl}/${movie.id}`;
    return this.http.put(updateUrl, movie, httpOptions).toPromise();
  }

  /**
   * Handle Http operation that failed.
   * Let the app continue.
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
  private handleError<T> (operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {

      // TODO: send the error to remote logging infrastructure
      console.error(error); // log to console instead

      // Let the app keep running by returning an empty result.
      return of(error.error as T);
    };
  }

}
