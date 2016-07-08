module.exports = {
  loadCompetitors: loadCompetitors,
  addCompetitor: addCompetitor
}

function loadCompetitors(){
  return function(dispatch, getState){
    var request = new XMLHttpRequest()
    request.open('GET', 'http://localhost:3000/competitors', true)
    request.onload = function(){
      if(request.status >= 200 && request.status <= 400){
        var data = JSON.parse(request.responseText)
          dispatch(competitorsLoaded(data))
      }
    }
    request.send()
  }
}

function competitorsLoaded(competitors){
  return {type:'COMPETITOR_LOADED', data:competitors}
}

function addCompetitor(competitor){
  return function(dispatch, getState){
    var request = new XMLHttpRequest()
    request.open('POST', 'http://localhost:3000/competitors', true)
    request.setRequestHeader("Content-Type", "application/json")
    request.onload = function(){
      console.log('onload')
      if(request.status >= 200 && request.status <= 400){
        var competitor = JSON.parse(request.responseText)
        dispatch(newCompetitorAdded(competitor))
      }
    }

    request.send(JSON.stringify(competitor))
  }
}

function newCompetitorAdded(competitor){
  return {type: 'COMPETITOR_ADDED', data: competitor}

}
