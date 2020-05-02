const getCookie = (key) => {
  let result = null;
  var cookies = document.cookie.split(";");
  cookies.some(function (item) {
    item = item.replace(' ', '');
    var cookieItems = item.split('=');
    if (key === cookieItems[0]) {
        result = cookieItems[1];
        return true;
    }
  });

  return result;
}

export default getCookie;
