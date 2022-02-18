window.onload = function() {
    try {
        document.getElementById('sidevar').insertAdjacentHTML('afterbegin',gon.text);
        var pathname = location.pathname
        if(pathname.match("/club_editnav") || pathname.match("/kclub_editnav")){
            var pobj = document.getElementById('page_glycanpathway'); 
            if(pobj){pobj.classList.add("show");} 
            var cobj = document.getElementById('setnavpage');
            if(cobj){cobj.classList.add("nowpage");}
        }else if(pathname.match("/portal_editaccount") || pathname.match("/kportal_editaccount")){
            var pobj = document.getElementById('page_glycanpathway'); 
            if(pobj){pobj.classList.add("show");} 
            var cobj = document.getElementById('setaccountpage');
            if(cobj){cobj.classList.add("nowpage");}
        }else{
            var pobj = document.getElementById(gon.content['parent']);
            if(pobj){pobj.classList.add("show");}
            var cobj = document.getElementById(gon.content['child']);
            if(cobj){cobj.classList.add("nowpage");}else{document.getElementById('homenav').classList.add("nowpage");}
        }
    }
    catch (e) {
        console.log(e)
    }

    document.getElementById("introjs").onclick = function() {
        introJs().start();
    };
    // if(gon.nowlogin){if(gon.nowlogin=='yes'){
    //     if(gon.user_info['logtype'] == 'editor'){
    //         gon.nowlogin = 'no'
    //         window.location.href = '/portal_intro';
    //     }else{
    //         gon.nowlogin = 'no'
    //         introJs().start(); 
    //     }
    // }}


    if (window.matchMedia('(max-width: 767px)').matches) {
        document.getElementById("sidebar").style.display ="none";
    }
}
function togglemenubtn(){
    togglenav = document.getElementById("sidebar")
    if(togglenav.style.display == "none"){
        togglenav.style.display = "block"
        document.getElementById("container").style.display = "none"
    }else{
        togglenav.style.display = "none"
        document.getElementById("container").style.display = "block"
    }


    // container
}

function add_navtext(){
    document.getElementById('addnavlist').insertAdjacentHTML('afterbegin',gon.navtext);
}

function AutoLink(str) {
    var regexp_url = /((h?)(ttps?:\/\/[a-zA-Z0-9.\-_@:/~?%&;=+#',()*!]+))/g; // ']))/;
    var regexp_makeLink = function(all, url, h, href) {
        return '<a href="h' + href + '" target=”_blank”>' + url + '</a>';
    }
 
    return str.replace(regexp_url, regexp_makeLink);
}





    
    
    