import Cable from './cable'

const urlPaths = location.pathname.split('/')
const roomName = urlPaths[urlPaths.length - 1]
const cable = new Cable
cable.connect(roomName)
