<template>
  <div class="home">
    <h1>Movies</h1>
    <div class="error-messages" v-for="error in errors" :key="error">
      <p>{{ error }}</p>
    </div>
    <div>
      <button @click="createMovie()">Add Movie</button>
      <p>
        <input v-model="newMovie.title" placeholder="Title" type="text" />
      </p>
      <p>
        <input v-model="newMovie.year" placeholder="Year" type="number" />
      </p>
      <p>
        <input v-model="newMovie.director" placeholder="Director" type="text" />
      </p>
      <p>
        <textarea v-model="newMovie.plot" placeholder="Plot" type="text" />
      </p>
      <p>
        <input v-model="newMovie.image" placeholder="Image URL" type="text" />
      </p>
    </div>
    <div v-for="movie in movies" :key="movie.id" @click="showMovie(movie)">
      <hr />
      <p>click to see more info</p>
      <h3>{{ movie.title }} ({{ movie.year }})</h3>
      <img class="movie-img" :src="movie.image" :alt="movie.title" />
    </div>

    <dialog id="movie-dialog">
      <form method="dialog">
        <p>
          Title
          <input v-model="movie.title" type="text" />
        </p>
        <p>
          Year
          <input v-model="movie.year" type="number" />
        </p>
        <p>
          Director
          <input v-model="movie.director" type="text" />
        </p>
        <p>
          Plot
          <textarea class="form-movie-plot" v-model="movie.plot" type="text"></textarea>
        </p>
        <p>
          Image URL
          <input v-model="movie.image" type="text" />
        </p>
        <button @click="updateMovie(movie)">Update</button>
        <button @click="destroyMovie(movie)" class="delete-btn">Delete</button>
        <button>Close</button>
      </form>
    </dialog>
  </div>
</template>

<script>
import axios from "axios"
export default {
  name: 'HomeView',
  data() {
    return {
      errors: [],
      movie: {},
      movies: [],
      newMovie: {},
    }
  },
  created() {
    this.indexMovie();
  },
  methods: {
    showMovie(movie) {
      this.movie = movie;
      document.getElementById("movie-dialog").showModal();
    },
    indexMovie() {
      axios.get("movies")
        .then((res) => {
          this.movies = res.data;
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
        })
    },
    createMovie() {
      axios.post("movies", this.newMovie)
        .then((res) => {
          this.movies.push(res.data);
          this.newMovie = {};
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
        })
    },
    updateMovie(movie) {
      axios.patch(`movies/${movie.id}`, movie)
        .then((res) => {
          let i = this.movies.indexOf(res.data);
          this.movies[i] = res.data;
          this.movie = {};
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
        })
    },
    destroyMovie(movie) {
      axios.delete(`movies/${movie.id}`)
        .then((res) => {
          let i = this.movies.indexOf(res.data);
          this.movies.splice(i, 1);
          this.movie = {};
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
        })
    }
  },
}
</script>

<style>
.movie-img {
  max-height: 250px;
}

.form-movie-plot {
  height: 300px;
}

.delete-btn {
  color: red;
}

.error-messages {
  color: red;
}
</style>