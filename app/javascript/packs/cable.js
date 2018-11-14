import actioncable from 'actioncable'

class Cable {
  constructor() {
    this.consumer = actioncable.createConsumer()
  }

  connect(roomName, callbacks) {
    this.subscription = this.consumer.subscriptions.create({
      channel: 'ChatChannel',
      room_name: roomName,
    },
    {
      connected: () => {
        callbacks.onConnected()
      },
      received: (data) => {
        switch(data.event) {
          case 'speak':
            callbacks.onReceiveMessage(data.message)
            break
          case 'messages':
            callbacks.onGetMessages(data.messages)
            break
        }
      }
    })
  }

  getMessages(revision) {
    this.subscription.perform('get_messages', {
      revision: revision,
    })
  }

  speak(userName, message) {
    this.subscription.perform('speak', {
      user_name: userName,
      message: message,
    })
  }
}

export default Cable
