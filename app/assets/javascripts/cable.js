// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);

function updateColorForGrid(gridId, key){
  if($('#color_chooser').length > 0 && $('#color_chooser').val() != "#000000"){
    var color = $('#color_chooser').val();
    if  (confirm('Are you sure you want to update selected color to column '+ key + ' ?')) {
      $.ajax({
        url: "/square_boards/"+gridId+"/update_square_board",                
        dataType: "json",
        type: "post",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {key: key, color: color},
        success: function(result){
          if(result["is_updated"] == true){
            document.getElementById("grid_"+result["key"]).style.backgroundColor = result["color"];
            document.getElementById("grid_"+result["key"]).title = result["title"];
            alert("Updated Successfully")
          }else{
            alert(result["errors"])
          }
        }
      });
    }
  }else{
    alert("Please Select a valid color to continue");
  }
}