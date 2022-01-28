/* Toggle between showing and hiding the navigation menu links when the user clicks on the hamburger menu / bar icon */
function toggleMenu() {
	var x = document.getElementById("toggleMenu");
	if (x.style.display === "inline-grid") {
		x.style.removeProperty("display");
	} else {
		x.style.display = "inline-grid";
	}
}

window.onresize = () => {
	var x = document.getElementById("toggleMenu");
	x.style.removeProperty("display");
};

/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function selectPalette() {
	document.getElementById("myPalette").classList.toggle("show");
}

function selectHEX() {
	document.getElementById("selectHEX").classList.add("selected");
	document.getElementById("selectRGB").classList.remove("selected");
	document.getElementById("selectHSL").classList.remove("selected");
	document.getElementById("selectCMYK").classList.remove("selected");
	document.getElementById("selectedPalette").textContent = "HEX";

	var hex = document.querySelectorAll("[id='hex']");
	for (var i = 0; i < hex.length; i++) hex[i].style.display = "revert";

	var rgb = document.querySelectorAll("[id='rgb']");
	for (var i = 0; i < rgb.length; i++) rgb[i].style.display = "none";

	var hsl = document.querySelectorAll("[id='hsl']");
	for (var i = 0; i < hsl.length; i++) hsl[i].style.display = "none";

	var cmyk = document.querySelectorAll("[id='cmyk']");
	for (var i = 0; i < cmyk.length; i++) cmyk[i].style.display = "none";
}

function selectRGB() {
	document.getElementById("selectHEX").classList.remove("selected");
	document.getElementById("selectRGB").classList.add("selected");
	document.getElementById("selectHSL").classList.remove("selected");
	document.getElementById("selectCMYK").classList.remove("selected");
	document.getElementById("selectedPalette").textContent = "RGB";

	var rgb = document.querySelectorAll("[id='rgb']");
	for (var i = 0; i < rgb.length; i++) rgb[i].style.display = "revert";

	var hex = document.querySelectorAll("[id='hex']");
	for (var i = 0; i < hex.length; i++) hex[i].style.display = "none";

	var hsl = document.querySelectorAll("[id='hsl']");
	for (var i = 0; i < hsl.length; i++) hsl[i].style.display = "none";

	var cmyk = document.querySelectorAll("[id='cmyk']");
	for (var i = 0; i < cmyk.length; i++) cmyk[i].style.display = "none";
}

function selectHSL() {
	document.getElementById("selectHEX").classList.remove("selected");
	document.getElementById("selectRGB").classList.remove("selected");
	document.getElementById("selectHSL").classList.add("selected");
	document.getElementById("selectCMYK").classList.remove("selected");
	document.getElementById("selectedPalette").textContent = "HSL";

	var hsl = document.querySelectorAll("[id='hsl']");
	for (var i = 0; i < hsl.length; i++) hsl[i].style.display = "revert";

	var hex = document.querySelectorAll("[id='hex']");
	for (var i = 0; i < hex.length; i++) hex[i].style.display = "none";

	var rgb = document.querySelectorAll("[id='rgb']");
	for (var i = 0; i < rgb.length; i++) rgb[i].style.display = "none";

	var cmyk = document.querySelectorAll("[id='cmyk']");
	for (var i = 0; i < cmyk.length; i++) cmyk[i].style.display = "none";
}

function selectCMYK() {
	document.getElementById("selectHEX").classList.remove("selected");
	document.getElementById("selectRGB").classList.remove("selected");
	document.getElementById("selectHSL").classList.remove("selected");
	document.getElementById("selectCMYK").classList.add("selected");
	document.getElementById("selectedPalette").textContent = "CMYK";

	var cmyk = document.querySelectorAll("[id='cmyk']");
	for (var i = 0; i < cmyk.length; i++) cmyk[i].style.display = "revert";

	var hex = document.querySelectorAll("[id='hex']");
	for (var i = 0; i < hex.length; i++) hex[i].style.display = "none";

	var rgb = document.querySelectorAll("[id='rgb']");
	for (var i = 0; i < rgb.length; i++) rgb[i].style.display = "none";

	var hsl = document.querySelectorAll("[id='hsl']");
	for (var i = 0; i < hsl.length; i++) hsl[i].style.display = "none";
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function (event) {
	if (!event.target.matches(".palette")) {
		var dropdown = document.getElementsByClassName("dropdown-content");
		var i;
		for (i = 0; i < dropdown.length; i++) {
			var openDropdown = dropdown[i];
			if (openDropdown.classList.contains("show")) {
				openDropdown.classList.remove("show");
			}
		}
	}
};
