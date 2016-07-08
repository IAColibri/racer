<new-competitor>
  <form onsubmit={handleSubmit}>
    <input type="text" name="start"/>
    <input type="text" name="stop"/>
    <input type="text" name="time"/>
    <input type="number" name="faltas"/>
    <input type="number" name="negativas"/>
    <input type="submit" name="submit" />
  </form>

  <script>
    var attributes
    attributes = this

    handleSubmit(){
      this.opts.addcompetitor({time: this.time.value,
                               negativas: this.negativas.value,
                               faltas: this.faltas.value})
      this.start.value = ""
      this.stop.value = ""
      this.time.value = 0
      this.faltas.value = 0
      this.negativas.value = 0
    }
    function connect(options){
      var socket, host, store;

      host = options.host
      socket = new WebSocket(host);

      socket.onopen = function() {
        console.log('connected')
      }

      socket.onclose = function() {
        console.log('closed')
      }

      socket.onmessage = function(msg) {
        console.log(msg)
        try {
          var data = JSON.parse(msg.data)
            var distance = data.distance
            var time = new Date
            var timestamp = data.timestamp || time.getTime()

            if(distance < 50){
              if(attributes.start.value === ""){
                attributes.start.value = timestamp
              } else {
                attributes.stop.value = timestamp
                attributes.time.value = parseInt(attributes.stop.value) - parseInt(attributes.start.value)
              }
            }
        }
        catch(err) {
          console.log(err)
        }
      }
    }

    connect({host: 'ws://localhost:3013'})
  </script>

</new-competitor>
