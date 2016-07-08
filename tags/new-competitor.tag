<new-competitor>
  <form onsubmit={handleSubmit}>
    <i class="fa fa-2x fa-clock-o" aria-hidden="true"></i>
    <input if={this.stop.value === ''} name="clock" value="00:00">
    <span if={this.stop.value !==''}>
      <input type="text" name="lap"/>
      <input type="hidden" name="time"/>
      <button onclick={reset_stop} class="pure-button button-error xsmall">
        <i class="fa fa-close"></i>
      </button>
    </span>
    <div>
      <input type="hidden" name="start"/>
      <input type="hidden" name="stop"/>

      <input type="number" name="faltas"/>
      <input type="number" name="negativas"/>
    </div>
    <button class="pure-button pure-button-primary" type="submit">
      <i class="fa fa-check"></i>
    </button>
  </form>

  <script>
    var attributes
    attributes = this

    var Tock = require('tocktimer')
    var timer = new Tock({
      callback: function () {
        attributes.clock.value = timer.msToTime(timer.lap())
      }})

    reset_stop(){
      this.stop.value = ''
    }

    handleSubmit(){
      this.opts.addcompetitor({time: this.time.value,
                               negativas: this.negativas.value,
                               faltas: this.faltas.value})
      this.start.value = ""
      this.stop.value = ""
      this.time.value = 0
      this.faltas.value = 0
      this.negativas.value = 0
      timer.stop()
      timer.reset()
      this.clock.value = '00:00'
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
                timer.start()
              } else {
                attributes.stop.value = timestamp
                attributes.time.value = timer.lap()
                attributes.lap.value = timer.msToTime(timer.lap())
              }
            attributes.update()
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
