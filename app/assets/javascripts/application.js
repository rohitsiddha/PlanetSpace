// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-datepicker
//= require_tree .


// function of append error message to element
var requiredErrorMessage = "You can't leave this empty.";
function display_error(element_id, errorMessage){
  $('#'+element_id).after('<div class="error error-'+element_id+'" >'+errorMessage+'</div>');
}

// function of get value of element_id
function get_value(element){
  return $('#'+element).val();
}

// function to remove error message div of specific element
function clear_errors(element_id){
  $('.error.error-'+element_id).hide();
}