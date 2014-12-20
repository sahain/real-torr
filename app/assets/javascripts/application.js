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
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

$(function () {

    function update(coords)
    {
      $('#picture_crop_x').val(coords.x)
      $('#picture_crop_y').val(coords.y)
      $('#picture_crop_w').val(coords.w)
      $('#picture_crop_h').val(coords.h)
    };

    $('#cropbox').Jcrop({
      boxWidth: 770,
      boxHeight: 433,
      onSelect: update,
      onChange: update
    });


    'use strict';

    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload({
      autoUpload: true,
      uploadTemplate: function (o) {
        var rows = $();
        $.each(o.files, function (index, file) {
          console.log(file);
            var row = $('<li class="span3">' +
                '<div class="thumbnail">' +
                  '<div class="preview" style="text-align: center;"></div>' +
                  '<div class="progress progress-success progress-striped active">' +
                    '<div class="bar" style="width:0%;"></div>' +
                  '</div>' +
                '</div>');
            rows = rows.add(row);
        });
        return rows;
    },

    completed: function(e, data) {
      console.log(data.result[0].url);
      $('a[href^="' + data.result[0].url + '"]').slimbox();
    },
    downloadTemplate: function (o) {
        var rows = $();
        $.each(o.files, function (index, file) {
            var row = $('<li class="span3" id="picture_' + file.picture_id + '">' +
                (file.error ? '<div class="name"></div>' +
                    '<div class="size"></div><div class="error" ></div>' :
                      '<div class="thumbnail">' +
                        '<a href="' + file.url +'" rel="lightbox-pictures" class="picture_' + file.id + '" title="<%= pic.description %>">' +
                          '<img src="" alt="">') +
                        '</a>' +
                        '<div class="caption">' +
                          '<p style="text-align: center;">' +
                            '<a href="" class="btn btn-mini btn-show" style="margin-right: 4px;">' +
                              '<i class="icon-edit "></i>' +
                              'Edit' +
                            '</a>' +
                            '<a class="btn btn-mini btn-delete" confirm="Вы уверены?" data-remote=true data-method="delete" href="" >' +
                              '<i class="icon-trash"></i>' +
                              'Delete' +
                            '</a>' +
                          '</p>' +
                        '</div>' +
                      '</div>');


            if (file.error) {
                row.find('.name').text(file.name);
                row.find('.error').text(
                    locale.fileupload.errors[file.error] || file.error
                );
            } else {
                if (file.thumbnail_url) {
                    row.find('img').prop('src', file.thumbnail_url);
                }
                row.find('.btn-delete')
                    .attr('href', '/galleries/' + $("#galleryID").val() + '/pictures/' + file.picture_id);
                row.find('.btn-show')
                    .attr('href', '/galleries/' + $("#galleryID").val() + '/pictures/' + file.picture_id + '/edit');
            }            
            rows = rows.add(row);
        });
        return rows;
    }

  });
});
