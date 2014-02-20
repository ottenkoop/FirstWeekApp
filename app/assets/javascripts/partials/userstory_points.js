class UserstoryPoints
  constructor: (el) ->
    @userstories = ($ el)
    @userstoryPoints = @userstories.find('.selectpointsfield').find('input')

    @bindListeners()

  bindListeners: ->
    @userstoryPoints.on 'change', (e) ->
      target = ($ e.target)

      filled_points = 0

      if target.closest('.userstories').hasClass 'current'
        newpointsDiv = target.closest('.sprintsoverview').find('.totalpoints .points')

        totalPointsDiv = target.closest('.sprintsoverview').find('.totalpoints .totalpoints')
        totalPoints = Number(totalPointsDiv.text())
        userstoryPoints = target.closest('.sprintsoverview').find('.userstorypoints')

        userstoryPoints.each ->
          filled_points += Number(($ this).val())

        pointsLeft = (totalPoints - filled_points)

        newpointsDiv.text(pointsLeft)




        #   totalpoints = points

        #   console.log (100 - totalpoints)