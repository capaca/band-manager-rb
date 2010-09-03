$(document).ready(function(){
  desabilitar_select();
  $("input[name='mode']").change(desabilitar_select);
});

function desabilitar_select() {
  if($("#radio_multi").attr("checked") == true) {
    $("#bandas").attr("disabled", true)
  } else {
    $("#bandas").attr("disabled", false)
  }
}
