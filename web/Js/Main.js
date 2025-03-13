// Toggle Mobile Menu
document.getElementById("mobile-menu-btn").addEventListener("click", function () {
    const mobileMenu = document.getElementById("mobile-menu");
    mobileMenu.classList.toggle("hidden");
  });

 // Optional JavaScript for carousel sliding effect or other interactivity
 document.addEventListener("DOMContentLoaded", function () {
  // Example: Auto-scroll the testimonials carousel (optional)
  const testimonials = document.querySelector(".flex");
  let scrollAmount = 0;
  const scrollWidth = testimonials.scrollWidth;

  setInterval(function () {
    if (scrollAmount < scrollWidth) {
      scrollAmount += 1;
      testimonials.scrollTo(scrollAmount, 0);
    } else {
      testimonials.scrollTo(0, 0);
      scrollAmount = 0;
    }
  }, 15);  // Adjust the speed here
});





// JavaScript for toggling content based on selected feature
document.getElementById('feature1').addEventListener('click', function () {
  document.getElementById('demo-title').innerText = 'Feature 1';
  document.getElementById('demo-description').innerText = 'This is an interactive demo of Feature 1. Here, you can see how it works by toggling between the features above.';
});

document.getElementById('feature2').addEventListener('click', function () {
  document.getElementById('demo-title').innerText = 'Feature 2';
  document.getElementById('demo-description').innerText = 'This is an interactive demo of Feature 2. Explore how this feature improves user experience with real-time interaction.';
});

document.getElementById('feature3').addEventListener('click', function () {
  document.getElementById('demo-title').innerText = 'Feature 3';
  document.getElementById('demo-description').innerText = 'This is an interactive demo of Feature 3. Click the buttons above to see how this feature benefits you.';
});



const ctaBtn = document.getElementById('cta-btn');
const modal = document.getElementById('cta-modal');
const closeModalBtn = document.getElementById('close-modal');

// Open Modal
ctaBtn.addEventListener('click', () => {
    modal.classList.remove('hidden');
});

// Close Modal
closeModalBtn.addEventListener('click', () => {
    modal.classList.add('hidden');
});






 // Open Modal
 function openModal(modalId) {
  var modal = document.getElementById(modalId);
  modal.style.display = "flex";
}

// Close Modal
function closeModal(modalId) {
  var modal = document.getElementById(modalId);
  modal.style.display = "none";
}


