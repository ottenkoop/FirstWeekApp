#= include partials/sprint_toggle
#= include partials/userstory_points

$ ->
  sprint_toggle = new SprintToggle(($ '#sprints .sprint'))

  userstory_points = new UserstoryPoints(($ '#sprints .userstories'))