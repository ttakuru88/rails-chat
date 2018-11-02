<template>
  <li>
    {{ message.text }} <small>({{ message.time }})</small>
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
small {
  color: gray;
}
</style>
