<template>
  <form @submit.prevent="speak">
    <div class="form-row mb-4" >
      <div class="col-2">
        <input v-model="userName" placeholder="名前" class="form-control" maxlength="32">
      </div>
      <div class="col">
        <input v-model="message" placeholder="発言する" class="form-control" maxlength="172">
      </div>
      <div class="col"
        <input class="btn btn-primary" type="submit" value="発言">
      </div>
    </div>
  </form>
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
