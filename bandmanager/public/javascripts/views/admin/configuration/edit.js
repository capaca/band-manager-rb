$(document).ready(function(){
  $("input[name='mode']").change(desabilitar_select);
  mode_value = $('input[name="mode_value"]')
  $("#radio_"+mode_value.val()).attr("checked", true);
  desabilitar_select();
});

function desabilitar_select() {
  if($("#radio_multi").attr("checked") == true) {
    $("#bandas").attr("disabled", true)
  } else {
    $("#bandas").attr("disabled", false)
  }
}
