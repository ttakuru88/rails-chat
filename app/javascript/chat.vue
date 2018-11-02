<template>
  <div id="app">
    <p>{{ roomName }}</p>
  </div>
</template>

<script>
export default {
  props: ['roomName'],
  data: function () {
    return {
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
