// Sticky Navbar Effect
window.addEventListener("scroll", function () {
    let navbar = document.querySelector(".navbar");
    if (window.scrollY > 50) {
        navbar.classList.add("sticky");
    } else {
        navbar.classList.remove("sticky");
    }
});

// Search Bar Animation
document.querySelector(".search-bar input").addEventListener("focus", function () {
    this.style.width = "90%";
    this.style.transition = "width 0.4s ease-in-out";
});

document.querySelector(".search-bar input").addEventListener("blur", function () {
    this.style.width = "80%";
});

// Search Functionality (Basic Example)
function searchFunction() {
    let searchText = document.querySelector(".search-bar input").value;
    if (searchText.trim() === "") {
        alert("Please enter a search term!");
    } else {
        alert(`Searching for "${searchText}"... (Feature in progress)`);
    }
}

// updates

// Highlight active menu link
document.addEventListener("DOMContentLoaded", function () {
    let navLinks = document.querySelectorAll(".nav-links a");
    let currentPath = window.location.pathname;

    navLinks.forEach((link) => {
        if (link.href.includes(currentPath)) {
            link.style.fontWeight = "bold";
            link.style.color = "#ff9900";
        }
    });
});



// Sticky Navbar
window.addEventListener('scroll', function () {
    const navbar = document.querySelector('.navbar');
    navbar.classList.toggle('sticky', window.scrollY > 0);
});

// Search Function (dummy for now, real backend will replace this)
function searchFunction() {
    const searchInput = document.querySelector('.search-bar input').value.trim();
    if (searchInput === "") {
        alert("Please enter a product or vendor name to search.");
        return;
    }

    // Redirect to search servlet (GET method)
    window.location.href = `search?keyword=${encodeURIComponent(searchInput)}`;
}



