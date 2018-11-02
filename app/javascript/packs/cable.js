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

  speak(message) {
    this.subscription.send({
      event: 'speak',
      message: message,
    })
  }
}

export default Cable
