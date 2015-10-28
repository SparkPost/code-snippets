/*jshint -W106 */
function formatEventTypes(data) {
  return _.map(data, function(value, key) {
    return {
      'name': value.display_name,
      'key': key,
      'description': value.description,
      'events' : _.map(value.events, function(value) { return value.display_name; }).join(', ')
    };
  });
}

function formatEvents(data) {
  var eventData = []
    , props = [];
  // Format the data for the event metadata
  _.forEach(data, function(value) {
    var events = _.map(value.events, function(event, key) {
      props.push(event.event);
      return {
        'name': event.display_name,
        'key': key,
        'description': event.description,
        'props': _.keys(event.event).join(', ')
      };

    });

    eventData = eventData.concat(events);
  });

  return { events: eventData, props: props };
}

function getUniqueProperties(data) {
  var properties = [];
  _.forEach(data, function(value) {
    _.forEach(value, function(v, k) {
      properties.push(k);
    });
  });

  return _.uniq(properties);
}

function formatProperties(data) {
  var props = getUniqueProperties(data)
    , properties = [];

  _.forEach(data, function(value) {
    _.forEach(value, function(v, k) {
      // Check to see if we have processed this property
      var index = props.indexOf(k);
        // Property hasn't been added yet
        if(index !== -1) {
          properties.push({
            key: k,
            description: v.description,
            sample: (typeof v.sampleValue === 'object') ? JSON.stringify(v.sampleValue) : v.sampleValue
          });

          // Remove from array so we don't load a dupe
          props.splice(index, 1);
        }
    });
  });

  return properties;

}

$(document).ready(function () {
 var eventTypesTemplate = $('#event-type-template').html()
    , typesTemplate = Handlebars.compile(eventTypesTemplate)
    , webhookEventsTemplate = $('#events-template').html()
    , eventsTemplate = Handlebars.compile(webhookEventsTemplate)
    , properties = $('#event-props-template').html()
    , propsTemplate = Handlebars.compile(properties)
    , eventTypesContainer = $('#content-event-types')
    , eventsContainer = $('#content-events')
    , eventPropsContainer = $('#content-event-props');

  $.get('https://api.sparkpost.com/api/v1/webhooks/events/documentation', function(data){
    // Format the data for the types
    var typeData = formatEventTypes(data.results)
      , html = typesTemplate(typeData)
      , eventData = formatEvents(data.results)
      , eventsHtml = eventsTemplate(eventData.events)
      , eventProps = formatProperties(eventData.props)
      , propsHtml = propsTemplate(eventProps);

    eventTypesContainer.append(html);
    eventsContainer.append(eventsHtml);
    eventPropsContainer.append(propsHtml);
  });
});
