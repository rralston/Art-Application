
function success(position) {
	var s = document.querySelector('#title');
	if(s.className === 'success') {
		// not sure why we're hitting this twice in FF, I think it's to do with a cached result coming back
		return;
	}

	//Ajax call to the companies distance method, the latitud and longitud are sent as parameters
	var latlong = {
		latitude : position.coords.latitude,
		longitude : position.coords.longitude
	};
	
	//var latlong = {latitude: position.coords.latitude , longitude: position.coords.longitude};
	$.post("companies/distance", latlong, function(data) {
		// Update the html with the data returned by the controller
		for(item in data) {
			$("#" + data[item].company_id + "_distance").html(data[item].distance);
			console.log($("#" + data[item].company_id + "_distance").html(data[item].distance));
		}
	});
	// s.innerHTML = "found you! " + position.coords.accuracy + " " + position.coords.latitude + " " + position.coords.longitude + " ";
	s.className = 'success';
}

function error(msg) {
	var s = document.querySelector('#status');
	s.innerHTML = typeof msg == 'string' ? msg : "failed";
	s.className = 'fail';

	// console.log(arguments);
}


$(document).ready(function() {

	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(success, error);
	} else {
		error('not supported');
	}

});

