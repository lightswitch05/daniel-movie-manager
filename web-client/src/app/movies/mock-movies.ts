import { Movie, MovieFormat } from './movie';

export const MOVIES: Movie[] = [
  {
    id: 5,
    title: 'Harry Potter and the Philosopher\'s Stone',
    format: MovieFormat.VHS,
    length: 152,
    release_year: 2001,
    rating: 2
  },
  {
    id: 8,
    title: 'Harry Potter and the Chamber of Secrets',
    format: MovieFormat.VHS,
    length: 161,
    release_year: 2002,
    rating: 1
  },
  {
    id: 9,
    title: 'Harry Potter and the Prisoner of Azkaban',
    format: MovieFormat.DVD,
    length: 142,
    release_year: 2004,
    rating: 3
  },
  {
    id: 34,
    title: 'Harry Potter and the Goblet of Fire',
    format: MovieFormat.DVD,
    length: 157,
    release_year: 2005,
    rating: 4
  },
  {
    id: 28,
    title: 'Harry Potter and the Order of the Phoenix',
    format: MovieFormat.DVD,
    length: 138,
    release_year: 2007,
    rating: 5
  },
  {
    id: 10,
    title: 'Harry Potter and the Half-Blood Prince',
    format: MovieFormat.DVD,
    length: 153,
    release_year: 2009,
    rating: 4
  },
  {
    id: 13,
    title: 'Harry Potter and the Deathly Hallows – Part 1',
    format: MovieFormat.STREAMING,
    length: 146,
    release_year: 2010,
    rating: 4
  },
  {
    id: 50,
    title: 'Harry Potter and the Deathly Hallows – Part 2',
    format: MovieFormat.STREAMING,
    length: 130,
    release_year: 2011,
    rating: 5
  }
];
