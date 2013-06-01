function sortInsensitive(a,b) {
	if(a.toLowerCase() < b.toLowerCase()) return -1;
	if(a.toLowerCase() > b.toLowerCase()) return 1;
	return 0;
}

function sortValue(a,b) {
	if(a.Total < b.Total) return 1;
	if(a.Total > b.Total) return -1;
	return 0;
}

function commas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

