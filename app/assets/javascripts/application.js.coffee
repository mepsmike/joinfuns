# *************************************
#
#   application.js
#
#
# *************************************
#= require _plugins
#= require _app-base



JoinFuns.initialMap = ->

handler = Gmaps.build('Google')

handler.buildMap {
     internal: id: 'map'
     provider: {
        zoom: 15,
        center: (lat: 25.060671, lng: 121.5313468)
      }
}, ->


  markers = handler.addMarkers([

    { 
      lat: gon.sticker[0]
      lng: gon.sticker[1]

    }
   
    #{
    #  lat: 25.063718
    #  lng:121.54964
    #}
    #{
    
    #  lat: 25.0607843
    #  lng: 121.5439248
    #}
   
  ])
  handler.bounds.extendWith markers
  handler.fitMapToBounds()
  if navigator.geolocation
      navigator.geolocation.getCurrentPosition(displayOnMap)
      return
  return

  

###
JoinFuns.initialMap = ->

  handler = Gmaps.build('Google')

  displayOnMap = (position) ->
    markers = handler.addMarkers([
      {
        lat: position.coords.latitude
        lng: position.coords.longitude
      }
      {
        lat: 25.063718
        lng:121.54964
      }
      {
        lat: 25.0607843
        lng: 121.5439248
      }
      ])
    handler.map.centerOn markers
    return

  handler.buildMap {
      internal: id: 'map'
      provider: {
        zoom: 15,
        center: (lat: 25.060671, lng: 121.5313468)
      }
    }, ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition(displayOnMap)
      return
    return
###

JoinFuns.initMaterialSelect = ->
  $ ->
    $('select').material_select()
    $(".dropdown-button").dropdown()

JoinFuns.filterTriggerInit = ->
  filterTrigger = $('.filter-trigger')

  filterTrigger.on 'click', ->
    triggerIcon = $(@).find('.material-icons')
    filterPanel = $('.filter-panel-wrapper')

    if filterPanel.hasClass('actived')
      filterPanel.removeClass 'actived'
      triggerIcon.html('expand_more')
    else
      filterPanel.addClass 'actived'
      triggerIcon.html('expand_less')

    return



