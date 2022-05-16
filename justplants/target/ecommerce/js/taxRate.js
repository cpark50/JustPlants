function getTax (state)
{
  if (window.XMLHttpRequest)
  {  // IE7+, Firefox, Chrome, Opera, Safari
     var xhr = new XMLHttpRequest();
  }
  else
  {  // IE5, IE6
     var xhr = new ActiveXObject ("Microsoft.XMLHTTP");
  }

  // Register the embedded handler function
  // This function will be called when the server returns
  // (the "callback" function)
  xhr.onreadystatechange = function ()
  { // 4 means finished, and 200 means okay.
    if (xhr.readyState == 4 && xhr.status == 200)
    { // Data should look like "Fairfax, Virginia"
        var tax = xhr.responseText;
      //if (document.getElementById ("city").value == "")
        document.getElementById ("total").innerHTML = parseFloat(document.getElementById ("total").innerHTML)*(1+parseFloat(tax));
    } 
  } 
  // Call the response software component
  //xhr.open ("GET", "getCityState?zip=" + zip, true);
  //xhr.send ();
  xhr.open ("POST", "getTaxRate", true);
  xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
  xhr.send ("state="+state);  
}