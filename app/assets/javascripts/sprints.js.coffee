class SprintToggle
  constructor: (el) ->
    @items = ($ el)
    @userstories = @items.closest('.sprintsoverview').find('.userstories')

    @bindListeners()

  bindListeners: ->
    @items.on 'click', (e) =>
      target = ($ e.target)

      console.log target.index()

      @setCurrent target

  setCurrent: (index) ->
    userstory = index.closest('.sprintsoverview').find('.userstories')

    ($ @userstories).not(userstory).removeClass 'current'
    ($ userstory).toggleClass('current', '')

$ ->
  sprint_toggle = new SprintToggle(($ '#sprints .sprint'))