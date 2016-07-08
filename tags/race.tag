<race>
  <new-competitor addcompetitor={this.handleNewCompetitor}></new-competitor>
  <competitors competitors={this.state.competitors}>

  </competitors>
  <script>
    var actions = require('../app/actions.js')
    var store = this.opts.store

    this.on('mount', function(){
      store.dispatch(actions.loadCompetitors())
        })
    store.subscribe(function(){
      this.state = store.getState()
      this.update()
        }.bind(this))

    handleNewCompetitor(competitor){
      store.dispatch(actions.addCompetitor(competitor))
    }
  </script>
</race>
