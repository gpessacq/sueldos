# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Morris.Bar
    element: 'sueldos-graph'
    data: $('#sueldos-graph').data('sueldos')
    xkey: 'apellido'
    ykeys: ['asig_mensuales', 'liquido', ]
    labels: ['Asignación Mensual', 'Liquido']
    barColors: ['#9F3ED5', '#4671D0']
    resize: true
    hideHover: 'auto'
    xLabelAngle: 60
jQuery ->    
  Morris.Bar
    element: 'funcionario-graph'
    data: $('#funcionario-graph').data('sueldos')
    xkey: 'apellido'
    ykeys: ['asig_mensuales', 'liquido', ]
    labels: ['Asignación Mensual', 'Liquido']
    barColors: ['#9F3ED5', '#4671D0']
    resize: true
    hideHover: 'auto'
    xLabelAngle: 60

