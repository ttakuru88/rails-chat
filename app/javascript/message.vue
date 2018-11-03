<template>
  <li class="list-group-item">
    <strong>{{ userName }}</strong>：{{ message.text }} <small>({{ message.time }})</small>
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
  },
  computed: {
    userName: function() {
      return this.message.user_name || '名無し'
    }
  }
}
</script>

<style scoped>
small {
  color: gray;
}
</style>
