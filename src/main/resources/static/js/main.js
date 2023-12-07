$(function() {

  // rome(inline_cal, { time: false });


	rome(inline_cal, {time: false, inputFormat: 'YYYY.MM.DD'}).on('data', function (value) {
	  result.value = value;
	});
});