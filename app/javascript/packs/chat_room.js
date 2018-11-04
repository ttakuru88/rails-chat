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
      messages: [],
    },
    components: {
      RoomHeader,
      Speaker,
      Message,
    },
    methods: {
      speak: function(userName, message) {
        cable.speak(userName ,message)
      },
      revision: function() {
        let revision = 0
        this.messages.forEach((message) => {
          if(message.id > revision) {
            revision = message.id
          }
        })

        return revision
      }
    },
    computed: {
      sortedMessages: function() {
        return this.messages.sort((a, b) => { return b.id - a.id })
      }
    }
  })

  cable.connect(roomName, {
    onConnected: () => {
      cable.getMessages(chat.revision())
    },
    onReceiveMessage: (message) => {
      chat.messages.push(message)
    },
    onGetMessages: (messages) => {
      messages.forEach((message) => {
        chat.messages.push(message)
      })
    }
  })
})
