<template>
  <form @submit.prevent="speak">
    <div class="form-group">
      <input v-model="newMessage" placeholder="発言する" class="form-control">
    </div>
  </form>
</template>

<script>
export default {
  data: function () {
    return {
      newMessage: null
    }
  },
  methods: {
    speak: function() {
      this.$emit('speak', this.newMessage)
      this.newMessage = null
    }
  }
}
</script>

<style scoped>
</style>
