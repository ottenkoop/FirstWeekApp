class SprintToggle
  constructor: (el) ->
    @el = ($ el)
    @sprintname = @el.find('.sprint')

    ($ '.userstories').hide()

    @bindListeners()

  bindListeners: ->
    @sprintname.on 'click', (e) =>
      target = ($ e.target)

      target.next('.userstories').show()

$ ->
  sprint_toggle = new SprintToggle(($ '#sprints'))