
function isiPhone() { 
    var agent = navigator.userAgent.toLowerCase(); 
    return agent.match(/iPhone/i);
};

if (isiPhone()) {
    window.location = 'http://www.edwardhotchkiss.mobi/iPhone/';
};