class UserstoryPoints
  constructor: (el) ->
    @userstories = ($ el)
    @userstoryPoints = @userstories.find('.selectpointsfield').find('input')
    @copytoclipboard = @userstories.find('.copytoclipboard')

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

        newpointsDiv.text(pointsLeft + ' ' + 'punten')

    @copytoclipboard.on 'click', (e) ->
      target = ($ e.target)
      output = $("<div />")

      @userstories = target.closest('.userstories').find('.userstoriescontent')

      target.zclip
        path: 'http://davidwalsh.name/demo/ZeroClipboard.swf'
        beforeCopy:
          @userstories.each ->
            output.append($(this).text()).append(' (' + $(this).find('.userstorypoints').val() + ')' + '\n')
        copy: ->
          output.text()
