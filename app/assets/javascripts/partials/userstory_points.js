class UserstoryPoints
  constructor: (el) ->
    @userstories = ($ el)

    @userstoryPoints = @userstories.find('.selectpointsfield').find('input')

    @bindListeners()

  bindListeners: ->
    @userstoryPoints.on 'change', (e) ->
      target = ($ e.target)
      value = target.val()

      if target.closest('.userstories').hasClass 'current'
        itemCount = ($ target.closest('.userstories').find('.storypoints'))

        id

        console.log allpoints

      # if target.closest('.userstories').hasClass 'current'
      #   console.log 'henk'

      @totalPoints = target.closest('.userstories').find('.totalpoints')
      @changePoints = (@totalPoints - value)

      # console.log @changePoints

      # newPoints =