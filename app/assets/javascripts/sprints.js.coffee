#= include partials/sprint_toggle
#= include partials/userstory_rating

$ ->
  sprint_toggle = new SprintToggle(($ '#sprints .sprint'))

  userstory_rating = new UserstoryRating(($ '#sprints userstories_edit'))