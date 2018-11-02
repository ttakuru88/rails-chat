import actioncable from 'actioncable'

class Cable {
  constructor() {
    this.consumer = actioncable.createConsumer()
  }

  connect(roomName) {
    this.consumer.subscriptions.create({
      channel: 'ChatChannel',
      room_name: roomName,
      received: (data) => {
        console.log('received:', data)
      }
    })
  }
}

export default Cable
