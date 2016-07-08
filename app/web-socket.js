module.exports = {
  connect: connect
}

// var actions = require('../app/actions.js')


function connect(options){
  var socket, host, store;
  // store = options.store
  host = options.host
  socket = new WebSocket(host);

  socket.onopen = function() {
    console.log('connected')
    // store.dispatch(actions.newMessage(
    //       'Socket Status: ' + socket.readyState + ' (open)'))
  }

  socket.onclose = function() {
    // store.dispatch(actions.newMessage(
    //       'Socket Status: ' + socket.readyState + ' (close)'))
  }

  socket.onmessage = function(msg) {
    console.log(msg)
    // store.dispatch(actions.newMessage('Received: ' + msg.data))
  }
}
