var riot = require('riot')
var redux = require('redux')
var thunk = require('redux-thunk').default

require('../tags/race.tag')
require('../tags/competitors.tag')
require('../tags/new-competitor.tag')

var reducer = function(state = {competitors: []}, action){
  switch(action.type){
    case 'COMPETITOR_LOADED':
      return Object.assign({}, state, {competitors: action.data})
    case 'COMPETITOR_ADDED':
      return Object.assign({}, state, {competitors: state.competitors.concat(action.data)})
    default:
      return state
  }
}

var createStoreWithMidelware = redux.compose(
    redux.applyMiddleware(thunk)
    )(redux.createStore)

var reduxStore = createStoreWithMidelware(reducer)

document.addEventListener('DOMContentLoaded', () => {
  riot.mount('race', {store: reduxStore})
})
