$(document).ready(function() {
  var labels = [];
  var series = [];
  $('#answers').find('span#answer').each(function(_index, element) {
    labels.push($(element).text());
  });
  $('#answers').find('span#count').each(function(_index, element) {
    series.push($(element).text());
  });

  var data = {
    labels: labels,
    series: [series]
  };
  var options = {
        horizontalBars: true,
        axisX: {
         onlyInteger: true
        }
      };
  // Create a new line chart object where as first parameter we pass in a selector
  // that is resolving to our chart container element. The Second parameter
  // is the actual data object.
  new Chartist.Bar('.ct-chart', data, options);
});
