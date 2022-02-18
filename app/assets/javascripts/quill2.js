function btnTable(){
    table = quill.getModule('table');
    console.log(table);
    table.insertTable(3, 3);
}
  
var quill = new Quill('#editor', {
    theme: 'bubble'
});
var tooltip = document.getElementsByClassName("ql-tooltip")[0];
tooltip.remove();

// コンテントのセット
try{
  content = JSON.parse(gon.content["content"])
}catch(e){
  content = {"ops":[{"insert":gon.content["content"]}]}
}
quill.setContents(content)

content = document.getElementsByClassName("ql-editor")
content = content[0].querySelectorAll("p");
for(i in content){
    try{
        content[i].innerHTML = content[i].innerHTML.replaceAll("&lt;iframe","<iframe").replaceAll("&gt;&lt;/iframe&gt;","></iframe>")
    }catch(e){;}
}
// タイトルのセット
try{
    text = '<h>'+gon.content["child"]+'</h><hr><br>'
    document.getElementById('portalchild').insertAdjacentHTML('afterbegin',text) 
}catch(e){;}

quill.enable(false)