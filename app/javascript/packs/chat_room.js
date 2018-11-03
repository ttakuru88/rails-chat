import Cable from './cable'
import Vue from 'vue/dist/vue.esm.js'
import RoomHeader from '../room_header.vue'
import Speaker from '../speaker.vue'
import Message from '../message.vue'

const urlPaths = location.pathname.split('/')
const roomName = decodeURIComponent(urlPaths[urlPaths.length - 1])
const cable = new Cable

document.addEventListener('DOMContentLoaded', () => {
  const chatEl = document.getElementById('js-chat')
  const chat = new Vue({
    el: '#js-chat',
    data: {
      roomName: roomName,
      messages: []
    },
    components: {
      RoomHeader,
      Speaker,
      Message,
    },
    methods: {
      speak: function(userName, message) {
        cable.speak(userName ,message)
      }
    }
  })

  cable.connect(roomName, {
    onReceiveMessage: (data) => {
      chat.messages.unshift(data.message)
    }
  })
})
