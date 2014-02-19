class SprintToggle
  constructor: (el) ->
    @items = ($ el)
    @userstories = @items.find('.userstories')

    @bindListeners()

  bindListeners: ->
    @items.on 'click', (e) =>
      target = ($ e.target)

      console.log target.index()

      @setCurrent target

  setCurrent: (index) ->
    userstory = index.find('.userstories')

    console.log ($ @userstories).not(userstory).removeClass('current')

    ($ userstory).toggleClass('current', '')

$ ->
  sprint_toggle = new SprintToggle(($ '#sprints .sprint'))