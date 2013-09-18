// // This is a manifest file that'll be compiled into application.js, which will include all the files
// // listed below.
// //
// // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// // or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
// //
// // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// // the compiled file.
// //
// // WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// // GO AFTER THE REQUIRES BELOW.
// //
// //= require jquery
// //= require jquery_ujs
// //= require_tree .

var auth = { 
   
   consumerKey: "EUcoj33x9x0XScuxAU0Y2w", 
   consumerSecret: "-ZPlORm6Q5V_b5OmltDNk2mwGgc",
   accessToken: "Ao_8q4xsHf06mQ-SGdhePM0BHIii15uC",
   accessTokenSecret: "WQGiHuuVgGoMd6h2Bi15EPYLhng",
   serviceProvider: { 
     signatureMethod: "HMAC-SHA1"
   }
 };

 var terms = 'food';
 var near = 'San+Francisco';

 var accessor = {
   consumerSecret: auth.consumerSecret,
   tokenSecret: auth.accessTokenSecret
 };

 parameters = [];
 parameters.push(['term', terms]);
 parameters.push(['location', near]);
 parameters.push(['callback', 'cb']);
 parameters.push(['oauth_consumer_key', auth.consumerKey]);
 parameters.push(['oauth_consumer_secret', auth.consumerSecret]);
 parameters.push(['oauth_token', auth.accessToken]);
 parameters.push(['oauth_signature_method', 'HMAC-SHA1']);

 var message = { 
   'action': 'http:api.yelp.com/v2/search',
   'method': 'GET',
   'parameters': parameters 
 };

 OAuth.setTimestampAndNonce(message);
 OAuth.SignatureMethod.sign(message, accessor);

 var parameterMap = OAuth.getParameterMap(message.parameters);
 parameterMap.oauth_signature = OAuth.percentEncode(parameterMap.oauth_signature)
 console.log(parameterMap);

 $.ajax({
   'url': message.action,
   'data': parameterMap,
   'cache': true,
   'dataType': 'jsonp',
   'jsonpCallback': 'cb',
   'success': function(data, textStats, XMLHttpRequest) {
     console.log(data);
     console.log("Data!" + data[0]);

       $.each(data["businesses"], function(key, val) {
       		$('#results').append('<div class="result result'+key+'">');
       		$('.result'+key).append("Name:" + data["businesses"][key]["name"] + "<p>");
   			$('.result'+key).append("URL:" + data["businesses"][key]["url"] + "<p>");
   			$('.result'+key).append("Phone:" + data["businesses"][key]["phone"] + "<p>");
   			$('.result'+key).append("Description:" + data["businesses"][key]["snippet_text"] + "<p>");
   			$('.result'+key).append("Type of Cuisine:" + data["businesses"][key]["categories"] + "<p><hr />");
   		});
   }
 });
