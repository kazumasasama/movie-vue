<template>
  <div class="home">
    <h1>Movies</h1>
    <div v-for="error in errors" :key="error">
      <p>{{ error }}</p>
    </div>
    <div v-for="movie in movies" :key="movie.id">
      <h4>{{ movie.title }}</h4>
      <p>{{ movie.year }}</p>
      <p>{{ movie.director }}</p>
      <p>{{ movie.plot }}</p>
      <img class="movie-img" :src="movie.image" :alt="movie.title" />
      <hr />
      <hr />
    </div>
  </div>
</template>

<script>
import axios from "axios"
export default {
  name: 'HomeView',
  data() {
    return {
      movies: [],
      errors: [],
    }
  },
  created() {
    this.indexMovie();
  },
  methods: {
    indexMovie() {
      axios.get("movies")
        .then((res) => {
          this.movies = res.data
        })
        .catch((error) => {
          this.errors = error.response.data.errors
        })
    },
  },
}
</script>

<style>
.movie-img {
  max-height: 250px;
}
</style>