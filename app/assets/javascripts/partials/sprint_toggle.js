class SprintToggle
  constructor: (el) ->
    @items = ($ el)
    @userstories = @items.closest('.sprintsoverview').find('.userstories')

    @bindListeners()

  bindListeners: ->
    @items.on 'click', (e) =>
      target = ($ e.target)

      @setCurrent target

      ($ ".selectpointsfield").find("input").trigger("change")

  setCurrent: (index) ->
    userstory = index.closest('.sprintsoverview').find('.userstories')

    ($ @userstories).not(userstory).removeClass 'current'

    ($ userstory).toggleClass('current', ' ')

