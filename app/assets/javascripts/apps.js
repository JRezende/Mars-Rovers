/**
 * Created with JetBrains RubyMine.
 * User: juliano
 * Date: 16/07/15
 * Time: 17:41
 * To change this template use File | Settings | File Templates.
 */
$(function(){

    $('#calculate').click(function(e){
        invalid = false;
        $("input").each(function(){
            if(this.value == ""){
                invalid = true;
            }
        });
        if(invalid){
            e.preventDefault();
            alert("Preencha os campos corretamente!");
        }
    });
})
