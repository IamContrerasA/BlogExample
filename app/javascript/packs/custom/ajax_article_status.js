
  let status = document.querySelectorAll("#status_id");
  status.forEach(state => {
    state.onclick = () => {
      if (window.confirm("Do you really want to change the article status?")) {
        let string_value = state.value;
        let id = string_value.substr(0,string_value.indexOf(' '));
        let type = string_value.substr(string_value.indexOf(' ') + 1, string_value.length);
        
        //ajax
        $.ajax({
          headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
          },
          url: '/articles/update_status',
          type: 'POST',
          data: {"id": id, "type": type },
          dataType: "json",
          success: function(data) {
            console.log(data);
            location.reload();
          }
        });
      }else{
        state.checked = false;
      }     
    }
  })
  
  



