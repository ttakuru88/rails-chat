<template>
  <li>
    {{ message }}
  </li>
</template>

<script>
export default {
  props: ['message'],
  data: function () {
    return { }
  },
  methods: {
    speak: function() {
      this.$emit('speak', this.newMessage)
    }
  }
}
</script>

<style scoped>
</style>
