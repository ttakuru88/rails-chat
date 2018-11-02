import Cable from './cable'
import Vue from 'vue/dist/vue.esm.js'
import ChatVue from '../chat.vue'

const urlPaths = location.pathname.split('/')
const roomName = urlPaths[urlPaths.length - 1]
const cable = new Cable
cable.connect(roomName)

document.addEventListener('DOMContentLoaded', () => {
  const chatEl = document.getElementById('js-chat')
  const chat = new Vue({
    el: '#js-chat',
    template: '<chat-vue v-bind:room-name="roomName"></chat-vue>',
    data: {
      roomName: null
    },
    components: { ChatVue }
  })
  chat.roomName = roomName
})
