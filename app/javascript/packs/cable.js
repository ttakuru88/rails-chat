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
      received: (data) => {
        switch(data.event) {
          case 'speak':
            callbacks.onReceiveMessage(data)
            break
        }
      }
    })
  }

  speak(userName, message) {
    this.subscription.send({
      event: 'speak',
      user_name: userName,
      message: message,
    })
  }
}

export default Cable
