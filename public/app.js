$(document).ready(function() {

  var ajaxListener = {
    init: function(linkId) {
      $(linkId).click(function(event) {
        event.preventDefault();
        var linkHref = $(this).attr('href');
        ajaxListener.processAjax(linkHref);
      })
    },
    processAjax: function(linkHref) {
      $.get(linkHref, function(response){
        $('#main').append(response);
      });
    }
  }

  var formRendering = {
    init: function(fieldId, location) {
      $(location).on('change', fieldId, function() {
        formRendering.removeFormFields();
        var selectVal = $(fieldId + ' :selected').val();
        if (selectVal === 'feel') { formRendering.stepTwo(location, "/step2_feel"); }
        if (selectVal === 'thinkBad') { formRendering.stepTwo(location, "/step2_bad"); }
        if (selectVal === 'thinkNot') { formRendering.stepTwo(location, "/step2_not"); }
      })
    },
    stepTwo: function(appendLoc, url) {
      formRendering.removeFormFields();
      $.get(url, function(response) {
        $(appendLoc).append(response);
      })
    },
    removeFormFields: function() {
      $('.removeForm').remove();
    }
  }

  var submitForm = {
    init: function(fieldId, location) {
      $(location).on('click', "input[type=submit]", function(event) {
        event.preventDefault();
        var userInput = $("input" + fieldId).serialize();
        submitForm.feelBetter(location, userInput);
      })
    },
    feelBetter: function(location, userInput) {
      $.get("/smile?" + userInput, function(response) {
        $(location).html(response);
      })
    }
  }

  ajaxListener.init("a#go");
  formRendering.init("#step1", "#main");
  submitForm.init("#step2", "#main");
});