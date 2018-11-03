<template>
  <div class="form-row mb-4">
    <div class="col-2">
      <input v-model="userName" placeholder="名前" class="form-control">
    </div>
    <div class="col">
      <input v-model="message" @keyup.enter="speak" placeholder="発言する" class="form-control">
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: null,
      userName: null,
    }
  },
  methods: {
    speak: function() {
      if(!this.message || this.message.length <= 0) {
        return
      }
      this.$emit('speak', this.userName, this.message)
      this.message = null
    }
  }
}
</script>

<style scoped>
</style>
