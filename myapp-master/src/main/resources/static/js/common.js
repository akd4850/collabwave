const fnGetContextPath = ()=>{
    /*const host = location.host;
    const url = location.href;
    const begin = url.indexOf(host) + host.length;
    const end = url.indexOf('/', begin + 1);*/
    //return url.substring(begin, end);
    return 'http://' + location.host;
}