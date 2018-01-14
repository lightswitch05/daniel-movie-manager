export class Movie {
  id: number;
  title: string;
  format: MovieFormat;
  length: number;
  release_year: number;
  rating: number;
}

export enum MovieFormat {
  VHS = "VHS",
  DVD = "DVD",
  STREAMING = "Streaming"
}
