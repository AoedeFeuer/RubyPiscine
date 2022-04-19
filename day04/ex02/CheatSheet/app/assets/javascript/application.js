//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require dataTables/jquery.dataTables
//= require_tree .
//= require jquery.turbolinks

$(document).ready( function () {
    $('#table-quick-search').DataTable();
} );