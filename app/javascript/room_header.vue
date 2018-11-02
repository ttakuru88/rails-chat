<template>
  <h2>{{ roomName }}</h2>
</template>

<script>
export default {
  props: ['roomName'],
  data: function () {
    return { }
  }
}
</script>

<style scoped>
h2 {
  font-size: 2em;
  text-align: center;
}
</style>
