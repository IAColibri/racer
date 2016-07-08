<competitors>
  <ol>
    <li each={competitor in this.opts.competitors}>
      <div class='calculated_time'>
        {calculated_time(competitor)}
      </div>
      <span class="real_data xsmall">
        {time(competitor)}
        <i class="fa fa-plus-circle error" aria-hidden="true"></i>
        {competitor.faltas || 0}
        <i class="fa fa-minus-circle error" aria-hidden="true"></i>
        {competitor.negativas || 0}
      </span>
    </li>
  </ol>
  <style>
.calculated_time{
  font-weight: bold;
  font-size: 120%
}
  </style>
  <script>
    var Tock = require('tocktimer')

    var timer = new Tock()

    time(competitor){
      return timer.msToTime(competitor.time)
    }

    calculated_time(competitor){
      return timer.msToTime(competitor.time + 5000 * (competitor.faltas + competitor.negativas))
    }
  </script>
</competitors>
