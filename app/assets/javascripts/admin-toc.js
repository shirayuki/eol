/* Functions for handling the administrator's view of the TOC, where items can be re-arranged, added, and the like.
 */

function refresh_toc() {
  jquery_post(null, '/administrator/table_of_contents/show_tree', $('#edit_toc'));
}
function toc_move_up(toc_id, top) {
  jquery_post("id="+toc_id+"&top="+top, '/administrator/table_of_contents/move_up', $('#edit_toc'));
}
function toc_move_down(toc_id, bottom) {
  jquery_post("id="+toc_id+"&bottom="+bottom, '/administrator/table_of_contents/move_down', $('#edit_toc'));
}
function toc_add_sub_chapter(parent_id, input_id) {
  input_value = $("#"+input_id).val();
  if(input_value == '') {
    alert('You must enter a sub-chapter label');
    return false;
  } else {
    jquery_post("label="+input_value+"&parent_id="+parent_id, '/administrator/table_of_contents/create', $('#edit_toc'));
  }
}
function toc_add_chapter(input_id) {
  input_value = $("#"+input_id).val();
  if(input_value == '') {
    alert('You must enter a chapter label');
    return false;
  } else {
    jquery_post("label="+input_value+"&parent_id=0", '/administrator/table_of_contents/create', $('#edit_toc'));
  }
}
function toc_edit_label(toc_id, toc_label) {
  new_html = '<input id="toc_edit_label_'+toc_id+'" type="text" size="40" value="'+ toc_label +'">';
  new_html+= '<a href="" onclick="submit_new_label('+toc_id+', \'toc_edit_label_'+toc_id+'\'); return false;"><img title="edit" style="float: right;" src="/assets/checked.png" alt="edit"></a>';
  $("#toc_label_"+toc_id).html(new_html);
}
function submit_new_label(toc_id, input_id) {
  input_value = $("#"+input_id).val();
  if(input_value == '') {
    alert('You must enter a new label');
    return false;
  } else {
    jquery_post("id="+toc_id+"&label="+input_value, '/administrator/table_of_contents/update', $('#edit_toc'));
  }
}

function jquery_post(data, url, target) {
  $.ajax({
    url: url,
    data: data,
    success: function(data) {
      target.html(data);
    }
  });
}
