import Cable from './cable'
import Vue from 'vue/dist/vue.esm.js'
import RoomHeader from '../room_header.vue'
import Speaker from '../speaker.vue'
import Message from '../message.vue'
import Notifier from './notifier.js'

const urlPaths = location.pathname.split('/')
const roomName = decodeURIComponent(urlPaths[urlPaths.length - 1])

document.addEventListener('DOMContentLoaded', () => {
  const chatEl = document.getElementById('js-chat')
  if(!chatEl) {
    return
  }
  const notifier = new Notifier
  const cable = new Cable
  const chat = new Vue({
    el: chatEl,
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
      notifier.notify(`${message.user_name}「${message.text}」`)
    },
    onGetMessages: (messages) => {
      messages.forEach((message) => {
        chat.messages.push(message)
      })
    }
  })
})
