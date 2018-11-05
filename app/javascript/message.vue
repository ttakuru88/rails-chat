<template>
  <li class="list-group-item">
    <strong>{{ userName }}</strong>：{{ message.text }} <small>({{ createdAt }})</small>
  </li>
</template>

<script>
import * as moment from 'moment'

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
    },
    createdAt: function() {
      const now = moment()
      const createdAt = moment(this.message.created_at)
      if(now.year() != createdAt.year()){
        return createdAt.format('YYYY-MM-DD HH:mm')
      }
      else if(now.month() != createdAt.month() || now.date() != createdAt.date()){
        return createdAt.format('MM-DD HH:mm')
      }
      else {
        return createdAt.format('HH:mm')
      }
    }
  }
}
</script>

<style scoped>
small {
  color: gray;
}
</style>
