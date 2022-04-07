<template>
  <div class="home">
    <div v-for="error in errors" :key="error">
      <p>{{ error }}</p>
    </div>
    <div>
      <h4>{{ movies }}</h4>
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
</style>