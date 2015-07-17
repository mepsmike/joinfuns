# *************************************
#
#   application.js
#
#
# *************************************
#= require _plugins
#= require _app-base





JoinFuns.initialMap = ->


class CustomMarkerBuilder extends Gmaps.Google.Builders.Marker
  create_marker: ->
    options = _.extend @marker_options(), @rich_marker_options()
    @serviceObject = new RichMarker options

  rich_marker_options: ->
    marker = document.createElement("div")
    marker.setAttribute('class', 'custom_marker_content')
    marker.innerHTML = this.args.custom_marker
    { content: marker }

  create_infowindow: ->
    return null unless _.isString @args.custom_infowindow

    boxText = document.createElement("div")
    boxText.setAttribute("class", 'custom_infowindow_content')
    boxText.innerHTML = @args.custom_infowindow
    @infowindow = new InfoBox(@infobox(boxText))

  infobox: (boxText)->
    content: boxText
    pixelOffset: new google.maps.Size(-140, 0)
    boxStyle:
      width: "280px"


handler = Gmaps.build('Google', builders: { Marker: CustomMarkerBuilder })

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
      custom_marker:"<div class=event-demo></div>"
      
    }
  ])
  handler.bounds.extendWith markers
  handler.fitMapToBounds()
 
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



