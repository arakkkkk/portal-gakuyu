var toolbarOptions = [
    [{ 'header': 1 }, { 'header': 2 }],               // custom button values
    [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
    ['bold', 'italic', 'underline'],        // toggled buttons
    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
    [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
    ['link'],
    ['clean'],                                         // remove formatting button
];
// table extemtion
Quill.register({
    'modules/tableUI': quillTableUI.default
}, true);
  
function btnTable(){
    table = quill.getModule('table');
    console.log(table);
    table.insertTable(3, 3);
}
  
var quill = new Quill('#editor', {
    modules: {
        toolbar: toolbarOptions,
        table: true,
        tableUI: true,
    },
    theme: 'snow'
});


// add cuntum toolbar
// for iframe
function toolbar_iframe(){
    range = quill.getSelection()
    quill.insertText(range, '<iframe src="https://drive.google.com/file/d//preview" width="100%" height="1000"></iframe>');
    quill.setSelection(range["index"]+45);
}
text = '<span class="ql-formats"><button onclick="toolbar_iframe()">'
        +'<svg xmlns="http://www.w3.org/2000/svg" width="28" height="24" fill="currentColor" class="bi bi-code-slash" viewBox="0 0 16 16"><path d="M10.478 1.647a.5.5 0 1 0-.956-.294l-4 13a.5.5 0 0 0 .956.294l4-13zM4.854 4.146a.5.5 0 0 1 0 .708L1.707 8l3.147 3.146a.5.5 0 0 1-.708.708l-3.5-3.5a.5.5 0 0 1 0-.708l3.5-3.5a.5.5 0 0 1 .708 0zm6.292 0a.5.5 0 0 0 0 .708L14.293 8l-3.147 3.146a.5.5 0 0 0 .708.708l3.5-3.5a.5.5 0 0 0 0-.708l-3.5-3.5a.5.5 0 0 0-.708 0z"/></svg>'
        +'</button></span>'
document.getElementsByClassName('ql-toolbar')[0].insertAdjacentHTML('beforeend',text);
// for table
text = '<span class="ql-formats"><button onclick="btnTable()">'  
        +'<svg xmlns="http://www.w3.org/2000/svg" width="28" height="24" fill="currentColor" class="bi bi-table" viewBox="0 0 16 16"><path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"/></svg>'
        +'</button></span>'
document.getElementsByClassName('ql-toolbar')[0].insertAdjacentHTML('beforeend',text);

// set value
try{
    element = document.getElementById(gon.content["check"])
    element.checked = true
}catch(e){;}
try{document.getElementById("title").value = gon.content["child"]}catch(e){;}
try{
  content = JSON.parse(gon.content["content"])
}catch(e){
  content = {"ops":[{"insert":gon.content["content"]}]}
}
quill.setContents(content)

// get document text
function getcontent(){
    // form要素を取得
    try{
        var element = document.getElementById("target") ;
        var radioNodeList = element.check ;
        var a = radioNodeList.value ;
    }catch(e){
        a = "none"
    }
    var delta = quill.getContents();
    content = JSON.stringify(delta)
    try{
        title = document.getElementById("title").value
    }catch(e){
        title = ""
    }
    // console.log(content)

    $.ajax({
        url: '/club_editcontent',  
        type: 'PATCH',
        dataType: 'html',
        data: {
            id: gon.content["id"],
            child: title,
            content: content,
            check: a,
        }
    })
    .done(function(data) {
        console.log(data)
        if(location.pathname.match(/kportal/)){
            window.location.href = 'kportal1.'+String(gon.content["id"])
        }else{
            window.location.href = 'portal1.'+String(gon.content["id"])
        }
        
    })
// ----------------------------------------------------------------------------
    .fail(function() {
        alert('エラーが発生しました。')               // 受け取り失敗の場合の処理
    });
}

